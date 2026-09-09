// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      alias: json['alias'] as String,
      street: json['street'] as String,
      exteriorNumber: json['exterior_number'] as String,
      interiorNumber: json['interior_number'] as String?,
      neighborhood: json['neighborhood'] as String,
      zipCode: json['zip_code'] as String,
      municipality: json['municipality'] as String,
      state: json['state'] as String,
      references: json['references_text'] as String?,
      isMain: json['is_primary'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'alias': instance.alias,
      'street': instance.street,
      'exterior_number': instance.exteriorNumber,
      'interior_number': instance.interiorNumber,
      'neighborhood': instance.neighborhood,
      'zip_code': instance.zipCode,
      'municipality': instance.municipality,
      'state': instance.state,
      'references_text': instance.references,
      'is_primary': instance.isMain,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
