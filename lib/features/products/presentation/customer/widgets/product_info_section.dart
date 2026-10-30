import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
// Asegúrate de importar tu archivo donde tengas el .format() de la unidad, 
// o la extensión que estés usando para formatear cantidades con unidad.
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/utils/measurement_unit_extension.dart'; 

class ProductInfoSection extends StatelessWidget {
  final String name;
  final String categoryName;
  final int price;
  final MeasurementUnit unit;
  final int stock; // 👈 1. Añadimos el stock como parámetro requerido o opcional
  final String? description;

  const ProductInfoSection({
    super.key,
    required this.name,
    required this.categoryName,
    required this.price,
    required this.unit,
    required this.stock, // 👈 2. Requerido en el constructor
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isAvailable = stock > 0;
    final stockFormatted = unit.format(stock);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    CurrencyFormatter.format(price),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary.withValues(alpha: 0.9), 
                    ),
                  ),
                  Text(
                    unit.displayName,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // 👇 3. Indicador de Stock integrado limpiamente en su propia sección de info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isAvailable 
                  ? Colors.green.withValues(alpha: 0.1) 
                  : Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isAvailable ? Icons.inventory_2_outlined : Icons.remove_shopping_cart_outlined,
                  size: 16,
                  color: isAvailable ? colorScheme.primary : colorScheme.error,
                ),
                const SizedBox(width: 6),
                Text(
                  isAvailable ? 'Disponibles: $stockFormatted' : 'Agotado en esta sucursal',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isAvailable ? colorScheme.primary : colorScheme.error,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Text(
            'Descripción',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description != null && description!.isNotEmpty
                ? description!
                : 'Sin descripción disponible.',
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}