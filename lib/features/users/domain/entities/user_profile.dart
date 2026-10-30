import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    String? phone,
    String? avatarUrl,
    DateTime? updateDate,
  }) = _UserProfile;
}

extension UserProfileFormatX on UserProfile {
  String get fullNameSnapshot {
    final maternal = maternalLastName != null ? ' $maternalLastName' : '';
    return '$firstName $paternalLastName$maternal'.trim();
  }

  bool get isComplete =>
      firstName.trim().isNotEmpty && paternalLastName.trim().isNotEmpty;
}
