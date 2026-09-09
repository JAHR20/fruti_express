// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      paternalLastName: json['last_name'] as String,
      maternalLastName: json['maternal_last_name'] as String?,
      alias: json['alias'] as String?,
      email: json['email'] as String,
      active: json['is_active'] as bool,
      phone: json['phone'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      branchId: json['branch_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      creationDate: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.paternalLastName,
      'maternal_last_name': instance.maternalLastName,
      'alias': instance.alias,
      'email': instance.email,
      'is_active': instance.active,
      'phone': instance.phone,
      'role': _$UserRoleEnumMap[instance.role]!,
      'branch_id': instance.branchId,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.creationDate.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.manager: 'manager',
  UserRole.deliveryPerson: 'deliveryPerson',
  UserRole.customer: 'customer',
};
