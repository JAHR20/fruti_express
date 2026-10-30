import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';

class DetailBottomBar extends StatelessWidget {
  final int totalPrice;
  final bool isOutOfStock;
  final VoidCallback onAddToCart;
  final int quantity;
  final String formattedQuantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback? onQuantityTap;

  const DetailBottomBar({
    super.key,
    required this.totalPrice,
    required this.isOutOfStock,
    required this.onAddToCart,
    required this.quantity,
    required this.formattedQuantity,
    required this.onIncrement,
    required this.onDecrement,
    this.onQuantityTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Se adapta al contenido
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CurrencyFormatter.format(totalPrice),
                  style: TextStyle(
                    color: colorScheme.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                if (!isOutOfStock)
                  Row(
                    children: [
                      // Botón Menos (Gris)
                      InkWell(
                        onTap: onDecrement,
                        borderRadius: BorderRadius.circular(20),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: colorScheme.secondary,
                          child: Icon(Icons.remove, size: 20, color: colorScheme.onSurface),
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      GestureDetector(
                        onTap: onQuantityTap,
                        child: Row(
                          children: [
                            Text(
                              formattedQuantity,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Icon(Icons.keyboard_arrow_down, size: 18, color: colorScheme.onSurfaceVariant),
                          ],
                        ),
                      ),
                      
                      const SizedBox(width: 12),
                      
                      // Botón Más (Primario)
                      InkWell(
                        onTap: onIncrement,
                        borderRadius: BorderRadius.circular(20),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: colorScheme.primary,
                          child: Icon(Icons.add, size: 20, color: colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Botón Inferior: Agregar al carrito
            SizedBox(
              width: double.infinity,
              height: 54, // Altura prominente y cómoda
              child: ElevatedButton.icon(
                onPressed: isOutOfStock ? null : onAddToCart,
                icon: Icon(Icons.add, color: isOutOfStock ? colorScheme.secondaryFixed.withValues(alpha: 0.38) : colorScheme.onPrimary),
                label: Text(
                  isOutOfStock ? 'AGOTADO' : 'Agregar al carrito',
                  style: TextStyle(
                    color: isOutOfStock ? colorScheme.onSurface.withValues(alpha: 0.38) : colorScheme.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.secondaryContainer,
                  disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
                  elevation: 2,
                  shadowColor: colorScheme.outline,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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