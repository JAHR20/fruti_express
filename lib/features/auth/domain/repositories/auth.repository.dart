import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

abstract class AuthRepository {
  /// Inicia sesión y rescata el perfil completo con su rol.
  ResultTask<Perfil> login(String email, String password);

  /// Crea un nuevo usuario (por defecto cliente) y su entrada en la tabla perfiles.
  ResultTask<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
  });

  /// Cierra la sesión activa.
  ResultTask<void> logout();

  /// Verifica si hay una sesión activa y devuelve el perfil.
  ResultTask<Perfil?> obtenerUsuarioActual();
}
