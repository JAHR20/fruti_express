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
    required Perfil usuarioActual, // El administrador que opera
    required String usuarioId, // El ID del usuario a modificar
    required bool activar, // El nuevo estado deseado
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Obtener el usuario objetivo
      // Si no existe, el repo devuelve Left(Failure.notFound) y el $ corta aquí.
      final usuarioTarget = await $(repository.obtenerPorId(usuarioId));

      // 2️⃣ Validar Permisos (Lógica de Dominio)
      // Usamos la extensión que ya tienes definida.
      await $(_validarPermisos(usuarioActual, usuarioTarget));

      // 3️⃣ Validar Redundancia de Estado
      // No activamos a quien ya está activo, ni desactivamos a quien ya no lo está.
      await $(_validarCambioEstado(usuarioTarget, activar));

      // 4️⃣ Crear copia con el nuevo estado
      final actualizado = usuarioTarget.copyWith(activo: activar);

      // 5️⃣ Persistir cambios
      return await $(repository.actualizar(actualizado));
    });
  }

  // --- 🧩 MICRO-PASOS ---

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
