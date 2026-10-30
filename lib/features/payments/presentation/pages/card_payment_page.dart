import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/card_payment_cubit.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/card_payment_state.dart';
import 'package:go_router/go_router.dart';
import 'package:mercadopago/mercadopago.dart';

class CardPaymentPage extends StatelessWidget {
  final Order order;

  const CardPaymentPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardPaymentCubit>(
      create: (_) => sl<CardPaymentCubit>(),
      child: _CardPaymentView(order: order),
    );
  }
}

class _CardPaymentView extends StatefulWidget {
  final Order order;

  const _CardPaymentView({required this.order});

  @override
  State<_CardPaymentView> createState() => _CardPaymentViewState();
}

class _CardPaymentViewState extends State<_CardPaymentView> {
  final _cardNumber = PciFieldState();
  final _expirationDate = PciFieldState();
  final _securityCode = PciFieldState();
  final _name = TextEditingController();

  String? _activeBin;
  int? _securityCodeLength;
  String? _paymentMethodId;
  String? _paymentTypeId;
  bool _tokenizing = false;

  bool _finished = false; 
  bool _outcomeUnknown = false;
  bool _leaving = false; 

  @override
  void dispose() {
    _cardNumber.dispose();
    _expirationDate.dispose();
    _securityCode.dispose();
    _name.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: colorScheme.onError)),
        backgroundColor: colorScheme.error,
      ),
    );
  }

  Future<void> _leave() async {
    if (_leaving) return;
    _leaving = true;

    if (!_finished && !_outcomeUnknown) {
      await context.read<CardPaymentCubit>().abandon(widget.order.id);
    }

    if (!mounted) return;
    context.pop();
  }

  Future<void> _loadPaymentMetadata(String? bin) async {
    _activeBin = bin;
    _securityCode.clear();
    if (mounted) {
      setState(() {
        _securityCodeLength = null;
        _paymentMethodId = null;
        _paymentTypeId = null;
      });
    }
    if (bin == null) return;

    final result = await MercadoPagoSDK.shared.coreMethods.getPaymentMethods(
      bin: bin,
    );
    if (!mounted || _activeBin != bin) return;

    if (result case Success(:final data) when data.isNotEmpty) {
      final method = data.first;
      final length = method.securityCodeLength;
      setState(() {
        _securityCodeLength = length == 3 || length == 4 ? length : null;
        _paymentMethodId = method.id; 
        _paymentTypeId = method.paymentTypeId; 
      });
    }
  }

  String _tokenErrorMessage(Object error) => switch (error) {
    InvalidCardNumberError() => 'El número de tarjeta no es válido.',
    InvalidCvvError() => 'El código de seguridad no es válido.',
    InvalidExpirationDateError() => 'La fecha de vencimiento no es válida.',
    CardExpiredError() => 'La tarjeta está vencida.',
    NetworkError() => 'Sin conexión. Inténtalo de nuevo.',
    ValidationError() => 'Revisa los datos de la tarjeta.',
    _ => 'No se pudo validar la tarjeta. Revisa los datos.',
  };

  Future<void> _pay() async {
    if (_tokenizing) return;

    final name = _name.text.trim();
    final methodId = _paymentMethodId;
    final typeId = _paymentTypeId;

    if (name.isEmpty) return _showMessage('Escribe el nombre del titular.');
    if (methodId == null || typeId == null) {
      return _showMessage(
        'No pudimos identificar la tarjeta. Revisa el número.',
      );
    }

    final cubit = context.read<CardPaymentCubit>();

    setState(() => _tokenizing = true);
    final result = await MercadoPagoSDK.shared.coreMethods
        .createTokenForNewCard(
          cardNumber: _cardNumber,
          expirationDate: _expirationDate,
          securityCode: _securityCode,
          identification: BuyerIdentification(name: name),
        );
    if (!mounted) return;
    setState(() => _tokenizing = false);

    switch (result) {
      case Success(:final data):
        await cubit.pay(
          orderId: widget.order.id,
          token: data.token, 
          paymentMethodId: methodId,
          paymentTypeId: typeId,
        );
      case Failure(:final error):
        _showMessage(_tokenErrorMessage(error));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocConsumer<CardPaymentCubit, CardPaymentState>(
      listener: (context, state) {
        state.maybeWhen(
          approved: (_) {
            _finished = true;
            context.read<CartCubit>().clearCart();
            context.goNamed(
              OrderRoutes.orderSuccessfulName,
              extra: widget.order,
            );
          },
          pending: (_) {
            _finished = true;
            context.pushReplacementNamed(
              OrderRoutes.paymentPendingName,
              extra: widget.order,
            );
          },
          rejected: (message) {
            _outcomeUnknown =
                false;
            _showMessage(message);
          },
          error: (message) {
            _outcomeUnknown = true;
            _showMessage(message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final charging = state.maybeWhen(
          processing: () => true,
          orElse: () => false,
        );
        final busy = _tokenizing || charging;

        return PopScope(
          canPop: false, 
          onPopInvokedWithResult: (didPop, _) {
            if (didPop || busy) return;
            _leave();
          },

          child: Scaffold(
            backgroundColor: colorScheme.surface,
            appBar: AppBar(
              title: const Text(
                'Pago con tarjeta',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                TextField(
                  controller: _name,
                  enabled: !busy,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del titular',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                CardNumberField(
                  controller: _cardNumber,
                  enabled: !busy,
                  onBinChanged: _loadPaymentMetadata,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ExpirationDateField(
                        controller: _expirationDate,
                        enabled: !busy,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SecurityCodeField(
                        controller: _securityCode,
                        expectedLength: _securityCodeLength,
                        enabled: !busy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: busy || _paymentMethodId == null ? null : _pay,
                    child: busy
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text(
                            'Pagar',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Los datos de tu tarjeta se envían directo a Mercado Pago.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
