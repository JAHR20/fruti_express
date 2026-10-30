import 'package:fruti_express_jahr_admin/features/users/data/models/app_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AppUserModel> login(String email, String password);
  
  Future<AppUserModel?> register({
    required String email,
    required String password,
  });
  
  Future<void> logout();
  
  Future<AppUserModel?> getCurrentUser();

  Future<AppUserModel> signInWithGoogle();
  Stream<AppUserModel?> get authStateChanges;
}