// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryModel _$InventoryModelFromJson(Map<String, dynamic> json) =>
    _InventoryModel(
      productId: json['product_id'] as String,
      branchId: json['branch_id'] as String,
      availableStock: (json['available_stock'] as num).toInt(),
      reservedStock: (json['reserved_stock'] as num).toInt(),
      localPrice: (json['local_price'] as num?)?.toInt(),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$InventoryModelToJson(_InventoryModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'branch_id': instance.branchId,
      'available_stock': instance.availableStock,
      'reserved_stock': instance.reservedStock,
      'local_price': instance.localPrice,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
