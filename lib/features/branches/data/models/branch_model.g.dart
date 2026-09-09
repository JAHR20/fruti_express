// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => _BranchModel(
  id: json['id'] as String,
  name: json['name'] as String,
  street: json['street'] as String,
  exteriorNumber: json['exterior_number'] as String,
  postalCode: json['zip_code'] as String,
  neighborhood: json['neighborhood'] as String,
  municipality: json['municipality'] as String,
  state: json['state'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  active: json['is_active'] as bool,
  creationDate: DateTime.parse(json['created_at'] as String),
  updateDate: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$BranchModelToJson(_BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'street': instance.street,
      'exterior_number': instance.exteriorNumber,
      'zip_code': instance.postalCode,
      'neighborhood': instance.neighborhood,
      'municipality': instance.municipality,
      'state': instance.state,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_active': instance.active,
      'created_at': instance.creationDate.toIso8601String(),
      'updated_at': instance.updateDate?.toIso8601String(),
    };
