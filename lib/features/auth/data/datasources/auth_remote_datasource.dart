import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart'; 

abstract class AuthRemoteDataSource {
  Future<ProfileModel> login(String email, String password);
  
  Future<ProfileModel> register({
    required String email,
    required String password,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    required String phone,
  });
  
  Future<void> logout();
  
  Future<ProfileModel?> getCurrentUser();
}