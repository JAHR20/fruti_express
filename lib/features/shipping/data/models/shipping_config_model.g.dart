// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingConfigModel _$ShippingConfigModelFromJson(Map<String, dynamic> json) =>
    _ShippingConfigModel(
      id: json['id'] as String,
      branchId: json['branch_id'] as String,
      strategy: $enumDecode(_$ShippingStrategyEnumMap, json['strategy']),
      maxRadiusKm: (json['max_radius_km'] as num).toDouble(),
      allowedZipCodes:
          (json['allowedZipCodes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      requireZipCodeValidation:
          json['require_zip_code_validation'] as bool? ?? false,
      minAmountForFreeShipping: (json['min_amount_for_free_shipping'] as num?)
          ?.toInt(),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ShippingConfigModelToJson(
  _ShippingConfigModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'branch_id': instance.branchId,
  'strategy': _$ShippingStrategyEnumMap[instance.strategy]!,
  'max_radius_km': instance.maxRadiusKm,
  'require_zip_code_validation': instance.requireZipCodeValidation,
  'min_amount_for_free_shipping': instance.minAmountForFreeShipping,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$ShippingStrategyEnumMap = {
  ShippingStrategy.haversine: 'haversine',
  ShippingStrategy.zipCode: 'zipCode',
  ShippingStrategy.geofence: 'geofence',
  ShippingStrategy.hybrid: 'hybrid',
};
