// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    _OrderItemModel(
      id: json['id'] as String,
      orderId: json['order_id'] as String,
      productId: json['product_id'] as String,
      productNameSnapshot: json['product_name_snapshot'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPriceSnapshot: (json['unit_price_snapshot'] as num).toInt(),
      measurementUnit: const MeasurementUnitConverter().fromJson(
        json['measurement_unit'] as String?,
      ),
    );

Map<String, dynamic> _$OrderItemModelToJson(_OrderItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'product_name_snapshot': instance.productNameSnapshot,
      'quantity': instance.quantity,
      'unit_price_snapshot': instance.unitPriceSnapshot,
      'measurement_unit': const MeasurementUnitConverter().toJson(
        instance.measurementUnit,
      ),
    };
