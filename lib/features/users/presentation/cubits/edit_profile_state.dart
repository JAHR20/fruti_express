import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
sealed class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = EditProfileInitial;
  const factory EditProfileState.saving() = EditProfileSaving;
  const factory EditProfileState.success() = EditProfileSuccess;
  const factory EditProfileState.error(String message) = EditProfileError;
}