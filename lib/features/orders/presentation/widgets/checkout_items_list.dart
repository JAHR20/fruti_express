import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/utils/currency_formatter.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart'; 
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart'; 

import 'package:fruti_express_jahr_admin/features/cart/domain/entities/cart_item.dart'; 

class CheckoutItemsList extends StatelessWidget {
  final List<CartItem> items; 

  const CheckoutItemsList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tus productos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = items[index];

              final String displayQuantity = item.measurementUnit.format(item.quantity);
              
              final bool isWeightOrVolume = item.measurementUnit == MeasurementUnit.gram || 
                                            item.measurementUnit == MeasurementUnit.milliliter;
              
              final double multiplier = isWeightOrVolume 
                  ? (item.quantity / 1000) 
                  : item.quantity.toDouble();
              
              final int itemTotal = (multiplier * item.unitPrice).round();

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imageUrl!,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 55,
                      height: 55,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  ),
                ),
                
                title: Text(
                  item.name, 
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Cantidad: $displayQuantity',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                trailing: Text(
                  itemTotal.toCurrencyFormat,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF1E3A8A),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}