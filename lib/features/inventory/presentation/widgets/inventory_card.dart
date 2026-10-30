import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

class InventoryCard extends StatelessWidget {
  final Inventory item;
  final Product product;
  final bool isUpdating;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const InventoryCard({
    super.key,
    required this.item,
    required this.product,
    required this.isUpdating,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final isCritical = item.isCriticalStock(product);
    final themeColor = isCritical ? colors.error : colors.onPrimaryContainer;
    final figureBgColor = isCritical
        ? colors.errorContainer
        : colors.primaryContainer;
    final figureBorderColor = isCritical
        ? colors.error.withValues(alpha: 0.5)
        : colors.primary.withValues(alpha: 0.5);

    return Card(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      color: colors.surface,
      shadowColor: colors.shadow.withValues(alpha: 0.7),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 📸 Imagen del Producto
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 60,
                color: colors.surfaceContainerHighest,
                child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                    ? Image.network(
                        product.imageUrl!.trim(),
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.broken_image,
                          color: colors.onSurfaceVariant,
                        ),
                      )
                    : Icon(Icons.image, color: colors.onSurfaceVariant),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colors.onSurface,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        item.finalPrice(product).toCurrencyFormat,
                        style: TextStyle(
                          color: colors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (item.hasLocalPrice) ...[
                        const SizedBox(width: 8),
                        Text(
                          product.currentPrice.toCurrencyFormat,
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colors.secondaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Local',
                            style: TextStyle(
                              color: colors.onSecondaryContainer,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ] else if (item.hasGlobalDiscount(product)) ...[
                        const SizedBox(width: 8),
                        Text(
                          product.comparisonPrice!.toCurrencyFormat,
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colors.tertiaryContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Oferta',
                            style: TextStyle(
                              color: colors.onTertiaryContainer,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: colors.secondary,
                  ),
                  onPressed: isUpdating ? null : onDecrease,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 60),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: figureBgColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: figureBorderColor),
                    ),
                    child: isUpdating
                        ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: themeColor,
                            ),
                          )
                        : Text(
                            product.measurementUnit.format(item.availableStock),
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.add_circle_outline, color: colors.primary),
                  onPressed: isUpdating ? null : onIncrease,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
