import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
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
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  void _confirmOrder(BuildContext context) {
    final profile = context.read<AuthCubit>().state.whenOrNull(
      authenticated: (p) => p,
    );
    if (profile == null) {
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

    final branches = context.read<BranchCubit>().state.branches;
    final selectedBranch = branches.firstWhere(
      (s) => s.id == cartState.branchId,
    );

    final subtotal = cartState.items.fold<int>(0, (sum, item) {
      final bool isWeight =
          item.measurementUnit.name == 'gram' ||
          item.measurementUnit.name == 'milliliter';
      final double multiplier = isWeight
          ? (item.quantity / 1000)
          : item.quantity.toDouble();
      return sum + (multiplier * item.unitPrice).round();
    });

    final bool hasFreeShipping =
        cartState.freeShippingThreshold != null &&
        subtotal >= cartState.freeShippingThreshold!;

    final shippingCost =
        (cartState.deliveryMethod == DeliveryMethod.pickUp || hasFreeShipping)
        ? 0
        : cartState.baseShippingRate;

    final discount = cartState.discountAmount;
    final finalTotal = subtotal + shippingCost - discount;
    final couponId = cartState.appliedCoupon?.id;

    context.read<OrderCubit>().createFromCart(
      items: cartState.items,
      address: cartState.selectedAddress,
      branch: selectedBranch,
      profile: profile,
      subtotal: subtotal,
      calculatedShippingCost: shippingCost,
      deliveryMethod: cartState.deliveryMethod!,
      appliedDiscount: discount,
      total: finalTotal,
      couponId: couponId,
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderCubit, OrderState>(
      listener: (context, state) {
        state.maybeWhen(
          processing: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          awaitingPayment: (createdOrder) {
            Navigator.of(context).pop();
            context.read<CartCubit>().clearCart();
            context.goNamed(
              OrderRoutes.orderSuccessfulName,
              extra: createdOrder,
            );
          },
          error: (message) {
            Navigator.of(context).pop();
            _showError(context, message);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text(
            'Confirmar Pedido',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF1E3A8A),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                const Text(
                  'Detalles de entrega',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                Card(
                  elevation: 2,
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
                              color: const Color(0xFF1E3A8A),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              state.isPickup
                                  ? 'Pasar a recoger (Pick Up)'
                                  : 'Envío a Domicilio',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                            style: const TextStyle(fontSize: 14, height: 1.5),
                          )
                        else
                          const Text(
                            'Por favor, selecciona una dirección.',
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                CheckoutItemsList(items: state.items),

                const Text(
                  'Resumen del pedido',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
}

class _BuildBranchInfo extends StatelessWidget {
  final String? branchId;
  const _BuildBranchInfo({required this.branchId});

  @override
  Widget build(BuildContext context) {
    if (branchId == null) return const SizedBox.shrink();

    final branch = context.read<BranchCubit>().state.branches.firstWhere(
      (b) => b.id == branchId,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(branch.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(
          '${branch.street} #${branch.exteriorNumber}',
          style: TextStyle(color: Colors.grey.shade700),
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
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              disabledBackgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: isEnabled ? onPressed : null,
            child: const Text(
              'Confirmar Pedido',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
