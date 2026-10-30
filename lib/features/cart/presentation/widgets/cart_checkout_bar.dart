import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/router/order_routes.dart';

class CartCheckoutBar extends StatelessWidget {
  final int total;
  final bool hasUnavailableProducts;

  const CartCheckoutBar({
    super.key,
    required this.total,
    required this.hasUnavailableProducts,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: colorTheme.surfaceContainerHigh,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
            color: colorTheme.outlineVariant,
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            // Fila de Subtotal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorTheme.onSurface,
                  ),
                ),
                Text(
                  CurrencyFormatter.format(total),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorTheme.secondaryContainer, // Naranja exacto de tu diseño
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Advertencia de productos agotados
            if (hasUnavailableProducts)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, size: 20, color: colorTheme.secondaryContainer),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Elimina los productos no disponibles para continuar.',
                        style: TextStyle(
                          color: colorTheme.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Botón Checkout
            SizedBox(
              width: double.infinity,
              height: 56, // Más alto
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorTheme.secondaryContainer,
                  disabledBackgroundColor: colorTheme.outline,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: hasUnavailableProducts
                    ? null
                    : () => context.pushNamed(OrderRoutes.checkoutName),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: hasUnavailableProducts ? colorTheme.surfaceContainerHigh : colorTheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}