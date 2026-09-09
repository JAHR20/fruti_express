import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
sealed class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String paternalLastName,
    @JsonKey(name: 'maternal_last_name') String? maternalLastName,
    String? alias,
    required String email,
    @JsonKey(name: 'is_active') required bool active,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'role') required UserRole role,
    @JsonKey(name: 'branch_id') String? branchId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'created_at') required DateTime creationDate,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelX on ProfileModel {
  Profile toDomain() => Profile(
        id: id,
        firstName: firstName,
        paternalLastName: paternalLastName,
        maternalLastName: maternalLastName,
        alias: alias,
        email: email,
        active: active,
        phone: phone,
        role: role,
        branchId: branchId,
        avatarUrl: avatarUrl,
        creationDate: creationDate,
      );

  static ProfileModel fromDomain(Profile p) => ProfileModel(
        id: p.id,
        firstName: p.firstName,
        paternalLastName: p.paternalLastName,
        maternalLastName: p.maternalLastName,
        alias: p.alias,
        email: p.email,
        active: p.active,
        phone: p.phone,
        role: p.role,
        branchId: p.branchId,
        avatarUrl: p.avatarUrl,
        creationDate: p.creationDate,
      );
}