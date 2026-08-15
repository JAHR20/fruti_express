import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

abstract class AuthRepository {
  ResultTask<Perfil> login(String email, String password);
  ResultTask<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono, 
  });

  ResultTask<void> logout();

  ResultTask<Perfil?> obtenerUsuarioActual();
}
