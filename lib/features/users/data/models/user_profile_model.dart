import 'package:freezed_annotation/freezed_annotation.dart';
// Importa tu entidad
import 'package:fruti_express_jahr_admin/features/users/domain/entities/user_profile.dart'; 

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._(); 

  const factory UserProfileModel({
    @JsonKey(name: 'id') required String id, 
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? paternalLastName,
    @JsonKey(name: 'maternal_last_name') String? maternalLastName,
    @JsonKey(name: 'alias') String? alias,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'updated_at') DateTime? updateDate,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => 
      _$UserProfileModelFromJson(json);


  UserProfile toEntity() => UserProfile(
        id: id,
        firstName: firstName ?? '', 
        paternalLastName: paternalLastName ?? '',
        maternalLastName: maternalLastName,
        alias: alias,
        phone: phone,
        avatarUrl: avatarUrl,
        updateDate: updateDate,
      );

  factory UserProfileModel.fromDomain(UserProfile entity) => UserProfileModel(
      id: entity.id,
      firstName: entity.firstName,
      paternalLastName: entity.paternalLastName,
      maternalLastName: entity.maternalLastName,
      alias: entity.alias,
      phone: entity.phone,
      avatarUrl: entity.avatarUrl,
      updateDate: entity.updateDate,
    );
}