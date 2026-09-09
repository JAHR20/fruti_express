import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  ResultTask<Profile> call(String email, String password) {
    return repository.login(email, password);
  }
}
