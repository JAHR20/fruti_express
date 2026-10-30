import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  ResultTask<AppUser?> call({
    required String email,
    required String password,
  }) {
    return repository.register(
      email: email,
      password: password,
    );
  }
}
