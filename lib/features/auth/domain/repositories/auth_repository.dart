import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

abstract class AuthRepository {
  ResultTask<AppUser> login(String email, String password);
  
  ResultTask<AppUser?> register({
    required String email,
    required String password,
  });

  ResultTask<void> logout();

  ResultTask<AppUser?> getCurrentUser();

  ResultTask<AppUser> signInWithGoogle();
  
  Stream<AppUser?> get authStateChanges; 
}