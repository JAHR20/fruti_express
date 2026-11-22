import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart';

class ProductInfoSection extends StatelessWidget {
  final String name;
  final String categoryName;
  final int price;
  final MeasurementUnit unit;
  final int stock;
  final bool hasDiscount;
  final int? comparisonPrice;
  final int? discountPercentage;
  final String? description;

  const ProductInfoSection({
    super.key,
    required this.name,
    required this.categoryName,
    required this.price,
    required this.unit,
    required this.stock,
    required this.hasDiscount,
    this.comparisonPrice,
    this.discountPercentage,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isAvailable = stock > 0;
    final stockFormatted = unit.format(stock);
    final hasDescription = description != null && description!.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── CATEGORÍA ───
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              categoryName,
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // ─── TÍTULO + DISPONIBLES (IZQUIERDA) / PRECIO (DERECHA) ───
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _StockBadge(
                      isAvailable: isAvailable,
                      stockFormatted: stockFormatted,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              _PriceBlock(
                price: price,
                unitLabel: unit.displayName,
                hasDiscount: hasDiscount,
                comparisonPrice: comparisonPrice,
                discountPercentage: discountPercentage,
              ),
            ],
          ),

          const SizedBox(height: 20),
          Divider(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
          const SizedBox(height: 16),

          // ─── DESCRIPCIÓN ───
          Text(
            'Descripción',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            hasDescription ? description!.trim() : 'Sin descripción disponible.',
            style: textTheme.bodyMedium?.copyWith(
              color: hasDescription
                  ? colorScheme.onSurfaceVariant
                  : colorScheme.outline,
              fontStyle: hasDescription ? FontStyle.normal : FontStyle.italic,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceBlock extends StatelessWidget {
  final int price;
  final String unitLabel;
  final bool hasDiscount;
  final int? comparisonPrice;
  final int? discountPercentage;

  const _PriceBlock({
    required this.price,
    required this.unitLabel,
    required this.hasDiscount,
    this.comparisonPrice,
    this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (hasDiscount && (comparisonPrice != null || discountPercentage != null)) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (discountPercentage != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '-$discountPercentage%',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (comparisonPrice != null) const SizedBox(width: 6),
              ],
              if (comparisonPrice != null)
                Text(
                  CurrencyFormatter.format(comparisonPrice!),
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
        ],
        Text(
          CurrencyFormatter.format(price),
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'por $unitLabel',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _StockBadge extends StatelessWidget {
  final bool isAvailable;
  final String stockFormatted;

  const _StockBadge({
    required this.isAvailable,
    required this.stockFormatted,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final fgColor = isAvailable
        ? colorScheme.primary
        : colorScheme.onErrorContainer;
    final bgColor = isAvailable
        ? colorScheme.primaryContainer.withValues(alpha: 0.15)
        : colorScheme.errorContainer.withValues(alpha: 0.7);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAvailable
                ? Icons.inventory_2_outlined
                : Icons.remove_shopping_cart_outlined,
            size: 14,
            color: fgColor,
          ),
          const SizedBox(width: 5),
          Text(
            isAvailable ? 'Disponibles: $stockFormatted' : 'Agotado',
            style: textTheme.labelMedium?.copyWith(
              color: fgColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}