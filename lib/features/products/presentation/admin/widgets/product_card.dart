import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isAdminOrManager;
  final Function(bool) onStatusChanged;
  final VoidCallback onEdit;
  final bool isUpdating;

  const ProductCard({
    super.key,
    required this.product,
    required this.isAdminOrManager,
    required this.onStatusChanged,
    required this.onEdit,
    required this.isUpdating,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Opacity(
      opacity: product.isActive ? 1.0 : 0.5,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // 🖼️ Imagen
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: colors.surfaceContainerHighest,
                      child:
                          product.imageUrl != null &&
                              product.imageUrl!.isNotEmpty
                          ? Image.network(product.imageUrl!, fit: BoxFit.cover)
                          : Icon(
                              Icons.image_not_supported,
                              color: colors.onSurfaceVariant,
                            ),
                    ),
                  ),

                  if (product.hasDiscount)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colors.error,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          '-${product.discountPercentage}%',
                          style: TextStyle(
                            color: colors.onError,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 6,
                      children: [
                        Text(
                          product.currentPrice.toCurrencyFormat,
                          style: TextStyle(
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        if (product.hasDiscount)
                          Text(
                            product.comparisonPrice!.toCurrencyFormat,
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),

                    Text(
                      'Por ${product.measurementUnit.displayName}',
                      style: TextStyle(
                        color: colors.onSurfaceVariant,
                        fontSize: 12,
                      ),
                    ),

                    if (product.description != null &&
                        product.description!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        product.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colors.onSurfaceVariant.withValues(alpha: 0.8),
                          fontSize: 11,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              if (isAdminOrManager)
                Column(
                  children: [
                    if (isUpdating)
                      const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    else
                      Switch(
                        value: product.isActive,
                        onChanged: onStatusChanged,
                      ),

                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: colors.secondaryContainer,
                      ),
                      onPressed: isUpdating ? null : onEdit,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
