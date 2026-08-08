import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  ResultTask<Perfil> call(String email, String password) {
    return repository.login(email, password);
  }
}
