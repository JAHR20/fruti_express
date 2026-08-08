import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  ResultTask<Perfil> call({
    required String email,
    required String password,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono, 
  }) {
    return repository.registro(
      email: email,
      password: password,
      nombre: nombre,
      apellidoPaterno: apellidoPaterno,
      apellidoMaterno: apellidoMaterno,
      alias: alias,
      telefono: telefono,
    );
  }
}
