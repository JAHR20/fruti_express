import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart'; // Ajusta según tu enum
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_state.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';
import 'package:fruti_express_jahr_admin/features/addresses/presentation/widgets/address_selector_bottom_sheet.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/order_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/order_state.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/checkout_items_list.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/coupon_input_card.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/order_summary_card.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/widgets/payment_method_selector.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  void _confirmOrder(BuildContext context) {
    final user = context.read<AuthCubit>().state.whenOrNull(
      authenticated: (p) => p,
    );
    if (user == null) {
      return _showError(context, 'Sesión expirada. Vuelve a iniciar sesión.');
    }

    final cartState = context.read<CartCubit>().state;

    if (cartState.deliveryMethod == null) {
      return _showError(context, 'Selecciona un modo de entrega');
    }
    if (cartState.isHomeDelivery && cartState.selectedAddress == null) {
      return _showError(context, 'Selecciona una dirección de envío');
    }
    if (cartState.branchId == null) {
      return _showError(context, 'Error: No hay sucursal activa');
    }

    // 1. Extraemos el preview ya calculado por Supabase
    final preview = cartState.orderPreview;

    // 2. Validamos que exista (para evitar que se confirme mientras isCalculating == true)
    if (preview == null || cartState.isCalculating) {
      return _showError(
        context,
        'Calculando el total del pedido, por favor espera...',
      );
    }

    final branches = context.read<BranchCubit>().state.branches;
    final selectedBranch = branches
        .where((s) => s.id == cartState.branchId)
        .firstOrNull;
    if (selectedBranch == null) {
      return _showError(
        context,
        'No se pudo cargar la sucursal. Inténtalo de nuevo.',
      );
    }

    // 3. Enviamos la orden usando ESTRICTAMENTE los datos devueltos por el backend
    context.read<OrderCubit>().createFromCart(
      items: cartState.items,
      address: cartState.selectedAddress,
      branch: selectedBranch,
      profile: user.profile,
      subtotal: preview.subtotal,
      calculatedShippingCost: preview.shippingCost,
      deliveryMethod: cartState.deliveryMethod!,
      paymentMethod: cartState.paymentMethod,
      appliedDiscount: preview.discount,
      total: preview.total,
      couponId: cartState.appliedCoupon?.id,
    );
  }

  void _showError(BuildContext context, String message) {
    final colorScheme = Theme.of(context).colorScheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: colorScheme.onError)),
        backgroundColor: colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        state.maybeWhen(
          processing: () => _showLoadingDialog(context),
          awaitingPayment: (createdOrder) {
            Navigator.of(context).pop();

            final paymentMethod = context.read<CartCubit>().state.paymentMethod;

            if (paymentMethod == PaymentMethodType.cashOnDelivery) {
              // Flujo contra entrega
              context.read<CartCubit>().clearCart();
              context.goNamed(
                OrderRoutes.orderSuccessfulName,
                extra: createdOrder,
              );
            } else {
              // Flujo con tarjeta: abre la pantalla de pago
              context.pushNamed(
                OrderRoutes.cardPaymentName,
                extra: createdOrder,
              );
            }
          },
          error: (message) {
            Navigator.of(context).pop();
            _showError(context, message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            'Confirmar Pedido',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Text(
                  'Detalles de entrega',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),

                Card(
                  elevation: 2,
                  color: colorScheme.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              state.isPickup
                                  ? Icons.storefront
                                  : Icons.location_on,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              state.isPickup
                                  ? 'Pasar a recoger (Pick Up)'
                                  : 'Envío a Domicilio',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () =>
                                  AddressSelectorBottomSheet.show(context),
                              child: const Text('Cambiar'),
                            ),
                          ],
                        ),
                        const Divider(),
                        if (state.isPickup)
                          _BuildBranchInfo(branchId: state.branchId)
                        else if (state.selectedAddress != null)
                          Text(
                            '${state.selectedAddress!.street} #${state.selectedAddress!.exteriorNumber}\nCol. ${state.selectedAddress!.neighborhood}, C.P. ${state.selectedAddress!.zipCode}',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          )
                        else
                          Text(
                            'Por favor, selecciona una dirección.',
                            style: TextStyle(color: colorScheme.error),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'Método de pago',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 12),

                const PaymentMethodSelector(),

                CheckoutItemsList(items: state.items),

                Text(
                  'Resumen del pedido',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 12),

                const CouponInputCard(),

                const SizedBox(height: 16),

                const OrderSummaryCard(),

                const SizedBox(height: 80),
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final readyToPurchase =
                state.deliveryMethod != null &&
                (state.isPickup || state.selectedAddress != null);
            return _ConfirmOrderButton(
              isEnabled: readyToPurchase,
              onPressed: () => _confirmOrder(context),
            );
          },
        ),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        final dialogColorScheme = Theme.of(dialogContext).colorScheme;
        return Center(
          child: CircularProgressIndicator(color: dialogColorScheme.primary),
        );
      },
    );
  }
}

class _BuildBranchInfo extends StatelessWidget {
  final String? branchId;
  const _BuildBranchInfo({required this.branchId});

  @override
  Widget build(BuildContext context) {
    if (branchId == null) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;

    // watch: se redibuja cuando las sucursales terminan de cargar.
    final branches = context.watch<BranchCubit>().state.branches;
    final branch = branches.where((b) => b.id == branchId).firstOrNull;

    if (branch == null) {
      return Text(
        branches.isEmpty ? 'Cargando sucursal…' : 'Sucursal no disponible.',
        style: TextStyle(color: colorScheme.onSurfaceVariant),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          branch.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${branch.street} #${branch.exteriorNumber}',
          style: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}

class _ConfirmOrderButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const _ConfirmOrderButton({required this.isEnabled, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isEnabled ? onPressed : null,
            child: const Text(
              'Confirmar Pedido',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
