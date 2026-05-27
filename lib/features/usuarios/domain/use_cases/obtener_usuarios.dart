import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class ObtenerUsuarios {
  final UsuarioRepository repository;

  ObtenerUsuarios(this.repository);

  /// Obtiene la lista MAESTRA de todos los usuarios del sistema.
  /// 🛡️ Reservado exclusivamente para Administradores.
  ResultTask<List<Perfil>> ejecutar(Perfil usuarioActual) {
    return TaskEither.Do(($) async {
      // 🔴 1. Bloqueo de seguridad: Si no es Admin, no entra.
      if (!usuarioActual.esAdmin) {
        return await $(
          TaskEither<Failure, List<Perfil>>.left(
            const Failure.unauthorized(
              "Acceso denegado. Solo los administradores pueden ver la lista global de usuarios.",
            ),
          ),
        );
      }

      // 🟢 2. Caso: Administrador -> Acceso total
      // Aquí el Admin ve a todos: otros admins, encargados, repartidores y clientes.
      return await $(repository.obtenerTodos());
    });
  }
}
