// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String?,
      categoryId: json['category_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      currentPrice: (json['current_price'] as num).toInt(),
      comparisonPrice: (json['compare_at_price'] as num?)?.toInt(),
      measurementUnit: $enumDecode(
        _$MeasurementUnitEnumMap,
        json['measurement_unit'],
      ),
      imageUrl: json['image_url'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      stock: (_readStock(json, 'stock') as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'current_price': instance.currentPrice,
      'compare_at_price': instance.comparisonPrice,
      'measurement_unit': _$MeasurementUnitEnumMap[instance.measurementUnit]!,
      'image_url': instance.imageUrl,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.piece: 'piece',
  MeasurementUnit.gram: 'gram',
  MeasurementUnit.milliliter: 'milliliter',
  MeasurementUnit.bunch: 'bunch',
};
