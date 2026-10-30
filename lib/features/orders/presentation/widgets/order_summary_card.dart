import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_state.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final preview = state.orderPreview;
        final subtotal = preview?.subtotal ?? 0;
        final shippingCost = preview?.shippingCost ?? 0;
        final discount = preview?.discount ?? 0;
        final total = preview?.total ?? 0;

        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: TextStyle(
                        color: colorTheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(subtotal),
                      style: TextStyle(
                        color: colorTheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Costo de envío
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Costo de envío:',
                      style: TextStyle(
                        color: colorTheme.onSurface,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      shippingCost == 0
                          ? 'Gratis'
                          : CurrencyFormatter.format(shippingCost),
                      style: TextStyle(
                        fontSize: 16,
                        color: shippingCost == 0
                            ? colorTheme.primary
                            : colorTheme.onSurface,
                        fontWeight: shippingCost == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                // Descuento por cupón (Si existe y es mayor a 0)
                if (state.appliedCoupon != null && discount > 0) ...[
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Descuento (${state.appliedCoupon!.code}):',
                        style: TextStyle(
                          color: colorTheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '- ${CurrencyFormatter.format(discount)}',
                        style: TextStyle(
                          color: colorTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(),
                ),

                // Total Final
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.format(total),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorTheme.secondaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
