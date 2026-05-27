import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/repositories/usuario_repository.dart';

class CambiarRolUsuario {
  final UsuarioRepository repository;

  CambiarRolUsuario(this.repository);

  ResultTask<Perfil> ejecutar({
    required Perfil usuarioActual,
    required String usuarioId,
    required TipoUsuario nuevoRol,
    String? sucursalAsignadaId,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Obtener el usuario objetivo
      final usuarioTarget = await $(repository.obtenerPorId(usuarioId));

      // 2️⃣ Regla Crítica: No dejar el sistema sin administradores
      await $(_validarUltimoAdmin(usuarioTarget, nuevoRol));

      // 3️⃣ Construir y validar el nuevo perfil según el rol (Lógica compleja)
      final perfilActualizado = await $(
        _procesarCambioRol(
          editor: usuarioActual,
          target: usuarioTarget,
          nuevoRol: nuevoRol,
          sucursalId: sucursalAsignadaId,
        ),
      );

      // 4️⃣ Guardar cambios
      return await $(repository.actualizar(perfilActualizado));
    });
  }

  // --- 🧩 MICRO-PASOS DE LÓGICA ---

  /// Evita que el último admin activo pierda su rol
  ResultTask<Unit> _validarUltimoAdmin(Perfil target, TipoUsuario nuevoRol) {
    if (target.esAdmin && nuevoRol != TipoUsuario.admin) {
      return repository.contarAdminsActivos().flatMap(
        (total) => total > 1
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation(
                  "Debe existir al menos un administrador activo",
                ),
              ),
      );
    }
    return TaskEither.right(unit);
  }

  /// Orquestador del cambio de rol con validaciones específicas
  ResultTask<Perfil> _procesarCambioRol({
    required Perfil editor,
    required Perfil target,
    required TipoUsuario nuevoRol,
    String? sucursalId,
  }) {
    switch (nuevoRol) {
      case TipoUsuario.admin:
        return _asignarAdmin(editor, target);
      case TipoUsuario.encargado:
        return _asignarEncargado(editor, target, sucursalId);
      case TipoUsuario.repartidor:
        return _asignarRepartidor(editor, target, sucursalId);
      default:
        return _asignarRolBasico(editor, target, nuevoRol);
    }
  }

  // --- 🔐 VALIDACIONES ESPECÍFICAS POR ROL ---

  ResultTask<Perfil> _asignarAdmin(Perfil editor, Perfil target) =>
      editor.esAdmin
      ? TaskEither.right(
          target.copyWith(rol: TipoUsuario.admin, sucursalId: null),
        )
      : TaskEither.left(
          const Failure.unauthorized("Solo un admin puede asignar este rol"),
        );

  ResultTask<Perfil> _asignarEncargado(
    Perfil editor,
    Perfil target,
    String? sucursalId,
  ) {
    if (!editor.esAdmin) {
      return TaskEither.left(
        const Failure.unauthorized("Solo un admin puede asignar encargados"),
      );
    }
    if (sucursalId == null) {
      return TaskEither.left(
        const Failure.validation("Debe especificarse la sucursal"),
      );
    }

    // Validación asíncrona: ¿Ya hay encargado?
    return repository
        .existeEncargadoEnSucursal(sucursalId)
        .flatMap(
          (existe) => existe
              ? TaskEither.left(
                  const Failure.alreadyExists("La sucursal ya tiene encargado"),
                )
              : TaskEither.right(
                  target.copyWith(
                    rol: TipoUsuario.encargado,
                    sucursalId: sucursalId,
                  ),
                ),
        );
  }

  ResultTask<Perfil> _asignarRepartidor(
    Perfil editor,
    Perfil target,
    String? sucursalId,
  ) {
    if (sucursalId == null) {
      return TaskEither.left(
        const Failure.validation("Falta sucursal para el repartidor"),
      );
    }

    final esAdmin = editor.esAdmin;
    final esEncargadoMismaSucursal =
        editor.esEncargado && editor.sucursalId == sucursalId;

    return (esAdmin || esEncargadoMismaSucursal)
        ? TaskEither.right(
            target.copyWith(
              rol: TipoUsuario.repartidor,
              sucursalId: sucursalId,
            ),
          )
        : TaskEither.left(
            const Failure.unauthorized("No tienes permiso en esta sucursal"),
          );
  }

  ResultTask<Perfil> _asignarRolBasico(
    Perfil editor,
    Perfil target,
    TipoUsuario rol,
  ) => editor.esAdmin
      ? TaskEither.right(target.copyWith(rol: rol, sucursalId: null))
      : TaskEither.left(
          const Failure.unauthorized(
            "No tienes permisos para asignar este rol",
          ),
        );
}
