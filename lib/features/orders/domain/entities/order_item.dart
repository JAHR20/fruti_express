import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/utils/unit_formatter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

part 'order_item.freezed.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    required String orderId,
    required String productId, 
    required String productNameSnapshot,
    required int quantity,
    required int unitPriceSnapshot, 
    MeasurementUnit? measurementUnit,
  }) = _OrderItem;
}

extension OrderItemX on OrderItem {
  int get calculatedSubtotal {
    final isBulk = measurementUnit == MeasurementUnit.gram || 
                   measurementUnit == MeasurementUnit.milliliter; 
                   
    final factor = isBulk ? (quantity / 1000) : quantity.toDouble();
    return (factor * unitPriceSnapshot).round();
  }
  
  String get formattedQuantity {
    return measurementUnit != null 
        ? measurementUnit!.format(quantity)
        : '$quantity';
  }
}