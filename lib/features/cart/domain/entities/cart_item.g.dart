// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  productId: json['productId'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
  unitPrice: (json['unitPrice'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  measurementUnit: $enumDecode(
    _$MeasurementUnitEnumMap,
    json['measurementUnit'],
  ),
  branchId: json['branchId'] as String,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'productId': instance.productId,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'unitPrice': instance.unitPrice,
  'quantity': instance.quantity,
  'measurementUnit': _$MeasurementUnitEnumMap[instance.measurementUnit]!,
  'branchId': instance.branchId,
};

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.piece: 'piece',
  MeasurementUnit.gram: 'gram',
  MeasurementUnit.milliliter: 'milliliter',
  MeasurementUnit.bunch: 'bunch',
};
