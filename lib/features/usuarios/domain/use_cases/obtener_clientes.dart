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
  ResultTask<List<Perfil>> ejecutar(Perfil usuarioActual) {
    return TaskEither.Do(($) async {
      if (!usuarioActual.esStaff) {
        return await $(
          TaskEither<Failure, List<Perfil>>.left(
            const Failure.unauthorized(
              "No tienes permisos para consultar la lista de clientes",
            ),
          ),
        );
      }

      if (usuarioActual.esAdmin) {
        final todosLosUsuarios = await $(repository.obtenerTodos());
        final soloClientes = todosLosUsuarios
            .where((usuario) => usuario.rol == TipoUsuario.cliente)
            .toList();

        return soloClientes;
      }

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
      return await $(
        TaskEither<Failure, List<Perfil>>.left(
          const Failure.unauthorized("Acceso denegado"),
        ),
      );
    });
  }
}
