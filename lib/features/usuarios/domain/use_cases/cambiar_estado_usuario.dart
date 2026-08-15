import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class CambiarEstadoUsuario {
  final UsuarioRepository repository;

  CambiarEstadoUsuario(this.repository);

  ResultTask<Perfil> ejecutar({
    required Perfil usuarioActual,
    required String usuarioId,
    required bool activar, 
  }) {
    return TaskEither.Do(($) async {
      final usuarioTarget = await $(repository.obtenerPorId(usuarioId));

      await $(_validarPermisos(usuarioActual, usuarioTarget));

      // Validar Redundancia de Estado, no activamos a quien ya está activo, ni desactivamos a quien ya no lo está.
      await $(_validarCambioEstado(usuarioTarget, activar));

      final actualizado = usuarioTarget.copyWith(activo: activar);

      return await $(repository.actualizar(actualizado));
    });
  }

  ResultTask<Unit> _validarPermisos(Perfil actor, Perfil target) =>
      actor.puedeDesactivarReactivarUsuario(target)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            "No tienes permisos para realizar esta acción",
          ),
        );

  ResultTask<Unit> _validarCambioEstado(Perfil target, bool nuevoEstado) {
    if (target.activo == nuevoEstado) {
      return TaskEither.left(
        Failure.validation(
          nuevoEstado
              ? "El usuario ya está activo"
              : "El usuario ya está desactivado",
        ),
      );
    }
    return TaskEither.right(unit);
  }
}
