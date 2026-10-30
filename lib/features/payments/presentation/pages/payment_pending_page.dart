import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/di/injection_container.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/payment_verification_cubit.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/payment_verification_state.dart';
import 'package:go_router/go_router.dart';

class PaymentPendingPage extends StatelessWidget {
  final Order order;

  const PaymentPendingPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentVerificationCubit>(
      create: (_) => sl<PaymentVerificationCubit>(),
      child: _PaymentPendingView(order: order),
    );
  }
}

class _PaymentPendingView extends StatefulWidget {
  final Order order;

  const _PaymentPendingView({required this.order});

  @override
  State<_PaymentPendingView> createState() => _PaymentPendingViewState();
}

class _PaymentPendingViewState extends State<_PaymentPendingView>
    with WidgetsBindingObserver {
  static const _interval = Duration(seconds: 4);
  static const _maxAttempts = 30; // ~2 minutos

  Timer? _timer;
  int _attempts = 0;
  bool _timedOut = false;
  bool _cancelled = false;

  bool get _canLeave => _timedOut || _cancelled;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _startPolling();
  }

  void _startPolling() {
    _timer?.cancel();
    _attempts = 0;
    setState(() => _timedOut = false);
    _verify();
    _timer = Timer.periodic(_interval, (_) {
      if (_attempts >= _maxAttempts) {
        _timer?.cancel();
        if (mounted) setState(() => _timedOut = true);
        return;
      }
      _attempts++;
      _verify();
    });
  }

  void _verify() {
    if (!mounted) return;
    context.read<PaymentVerificationCubit>().verify(widget.order.id);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _verify();
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _showWaitMessage() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(
            'Estamos confirmando tu pago. Espera un momento, por favor.',
          ),
        ),
      );
  }

  void _leave() {
    if (_cancelled) {
      context.pop();
      return;
    }
    context.read<CartCubit>().clearCart();
    context.go('/'); 
  }

  void _onStatus(String status) {
    if (status == 'pendingPayment') return;

    _timer?.cancel();

    if (status == 'cancelled') {
      setState(() => _cancelled = true);
      return;
    }

    context.read<CartCubit>().clearCart();
    context.goNamed(OrderRoutes.orderSuccessfulName, extra: widget.order);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_canLeave) {
          _leave();
        } else {
          _showWaitMessage();
        }
      },
      child: BlocListener<PaymentVerificationCubit, PaymentVerificationState>(
        listener: (context, state) {
          state.maybeWhen(status: _onStatus, orElse: () {});
        },
        child: Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            title: const Text('Confirmando pago'),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_cancelled) ...[
                    Icon(
                      Icons.cancel_outlined,
                      size: 64,
                      color: colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'El pago no se completó y el pedido fue cancelado.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _leave,
                      child: const Text('Volver'),
                    ),
                  ] else if (_timedOut) ...[
                    Icon(Icons.schedule, size: 64, color: colorScheme.primary),
                    const SizedBox(height: 16),
                    Text(
                      'Tu banco aún no confirma el pago. '
                      'Por favor no pagues de nuevo este pedido. '
                      'Puedes volver a verificar en unos minutos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorScheme.onSurface),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _startPolling,
                      child: const Text('Verificar de nuevo'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _leave,
                      child: const Text('Salir'),
                    ),
                  ] else ...[
                    CircularProgressIndicator(color: colorScheme.primary),
                    const SizedBox(height: 24),
                    Text(
                      'Confirmando tu pago…',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Estamos esperando la respuesta de tu banco. '
                      'No cierres la app ni vuelvas a pagar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}