import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

abstract class AuthRepository {
  ResultTask<Profile> login(String email, String password);
  
  ResultTask<Profile> register({
    required String email,
    required String password,
    required String firstName, 
    required String paternalLastName, 
    String? maternalLastName,
    String? alias,
    required String phone,
  });

  ResultTask<void> logout();

  ResultTask<Profile?> getCurrentUser();
}