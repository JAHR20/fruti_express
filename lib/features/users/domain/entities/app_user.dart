import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'user_profile.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required UserRole role,
    required bool active,
    String? branchId,
    required DateTime creationDate,
    required UserProfile profile, 
    
  }) = _AppUser;
}