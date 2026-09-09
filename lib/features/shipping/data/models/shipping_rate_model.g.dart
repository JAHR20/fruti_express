// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_rate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShippingRateModel _$ShippingRateModelFromJson(Map<String, dynamic> json) =>
    _ShippingRateModel(
      id: json['id'] as String,
      branchId: json['branch_id'] as String,
      name: json['name'] as String,
      minDistanceKm: (json['min_distance_km'] as num).toDouble(),
      maxDistanceKm: (json['max_distance_km'] as num).toDouble(),
      cost: (json['cost'] as num).toInt(),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ShippingRateModelToJson(_ShippingRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_id': instance.branchId,
      'name': instance.name,
      'min_distance_km': instance.minDistanceKm,
      'max_distance_km': instance.maxDistanceKm,
      'cost': instance.cost,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
    };
