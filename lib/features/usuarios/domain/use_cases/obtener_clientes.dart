import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class ObtenerClientes {
  final UsuarioRepository repository;

  ObtenerClientes(this.repository);

  /// Obtiene la lista de clientes filtrada según la jerarquía del usuario que consulta.
  ResultTask<List<Perfil>> ejecutar(Perfil usuarioActual) {
    return TaskEither.Do(($) async {
      // 🛡️ 1. Validación de seguridad: Solo el Staff (Admin/Encargado) puede ver clientes
      if (!usuarioActual.esStaff) {
        return await $(
          TaskEither<Failure, List<Perfil>>.left(
            const Failure.unauthorized(
              "No tienes permisos para consultar la lista de clientes",
            ),
          ),
        );
      }

      // 🟢 2. Caso: Administrador -> Puede ver todos los clientes del sistema
      if (usuarioActual.esAdmin) {
        // Nota: Aquí se asume que el repositorio tiene un método para filtrar solo clientes
        // o se puede usar obtenerTodos() y filtrar por rol si el volumen es bajo.
        final todosLosUsuarios = await $(repository.obtenerTodos());
        
        // 2. Filtramos usando la magia de Dart para quedarnos solo con los clientes
        final soloClientes = todosLosUsuarios
            .where((usuario) => usuario.rol == TipoUsuario.cliente)
            .toList();

        return soloClientes;
      }

      // 🟡 3. Caso: Encargado -> Solo ve clientes que han comprado en su propia sucursal
      if (usuarioActual.esEncargado) {
        final sucursalId = usuarioActual.sucursalId;

        if (sucursalId == null) {
          return await $(
            TaskEither<Failure, List<Perfil>>.left(
              const Failure.validation(
                "Tu perfil de encargado no tiene una sucursal asignada",
              ),
            ),
          );
        }

        return await $(
          repository.obtenerClientesQueHanCompradoEnSucursal(sucursalId),
        );
      }

      // 🔴 4. Fallback de seguridad
      return await $(
        TaskEither<Failure, List<Perfil>>.left(
          const Failure.unauthorized("Acceso denegado"),
        ),
      );
    });
  }
}
