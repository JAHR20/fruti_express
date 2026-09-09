import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  ResultTask<Profile> call({
    required String email,
    required String password,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    required String phone, 
  }) {
    return repository.register(
      email: email,
      password: password,
      firstName: firstName,
      paternalLastName: paternalLastName,
      maternalLastName: maternalLastName,
      alias: alias,
      phone: phone,
    );
  }
}
