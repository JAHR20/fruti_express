// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) =>
    _AppUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      active: json['is_active'] as bool,
      branchId: json['branch_id'] as String?,
      creationDate: DateTime.parse(json['created_at'] as String),
      profile: UserProfileModel.fromJson(
        json['user_profiles'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AppUserModelToJson(_AppUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'is_active': instance.active,
      'branch_id': instance.branchId,
      'created_at': instance.creationDate.toIso8601String(),
      'user_profiles': instance.profile,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.manager: 'manager',
  UserRole.deliveryPerson: 'deliveryPerson',
  UserRole.customer: 'customer',
};
