import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
// Importa tu entidad principal
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
// Importa el modelo del perfil que creamos arriba
import 'user_profile_model.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
abstract class AppUserModel with _$AppUserModel {
  const AppUserModel._();

  const factory AppUserModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'role') required UserRole role,
    @JsonKey(name: 'is_active') required bool active,
    @JsonKey(name: 'branch_id') String? branchId,
    @JsonKey(name: 'created_at') required DateTime creationDate,
    @JsonKey(name: 'user_profiles') required UserProfileModel profile,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) => 
      _$AppUserModelFromJson(json);

  AppUser toEntity() => AppUser(
        id: id,
        email: email,
        role: role,
        active: active,
        branchId: branchId,
        creationDate: creationDate,
        profile: profile.toEntity(),
      );
}