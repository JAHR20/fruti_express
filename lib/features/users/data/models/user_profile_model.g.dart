// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String?,
      paternalLastName: json['last_name'] as String?,
      maternalLastName: json['maternal_last_name'] as String?,
      alias: json['alias'] as String?,
      phone: json['phone'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      updateDate: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.paternalLastName,
      'maternal_last_name': instance.maternalLastName,
      'alias': instance.alias,
      'phone': instance.phone,
      'avatar_url': instance.avatarUrl,
      'updated_at': instance.updateDate?.toIso8601String(),
    };
