import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/extensions/categoria_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class CambiarEstadoCategoria {
  final CategoriaRepository repository;

  CambiarEstadoCategoria(this.repository);

  ResultTask<Categoria> ejecutar({
    required Perfil usuarioActual,
    required String categoriaId,
    required bool nuevoEstado,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación de Permisos (Solo Admin/Personal autorizado)
      await $(_validarPermisos(usuarioActual));

      // 2️⃣ Obtener la categoría actual
      final categoria = await $(repository.obtenerPorId(categoriaId));
      if (categoria == null) {
        return await $(
          TaskEither.left(const Failure.notFound("Categoría no encontrada")),
        );
      }

      // 3️⃣ Validar estado actual (No cambiar si ya está en ese estado)
      await $(_validarCambioNecesario(categoria, nuevoEstado));

      // 4️⃣ Validar Integridad: Solo si estamos DESACTIVANDO (nuevoEstado == false)
      if (!nuevoEstado) {
        await $(_validarIntegridadSubcategorias(categoriaId));
      }

      // 5️⃣ Proceder a la actualización
      final actualizada = categoria.copyWith(activa: nuevoEstado);
      await $(repository.actualizar(actualizada));

      return actualizada;
    });
  }

  // --- 🧩 MICRO-PASOS ACTUALIZADOS ---

  ResultTask<Unit> _validarPermisos(Perfil usuario) =>
      usuario
          .puedeDesactivarCategoria() // Asumiendo que esta extensión cubre gestión general
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            "No tienes permisos para gestionar categorías",
          ),
        );

  ResultTask<Unit> _validarCambioNecesario(Categoria cat, bool nuevo) =>
      cat.activa != nuevo
      ? TaskEither.right(unit)
      : TaskEither.left(
          Failure.validation(
            "La categoría ya se encuentra ${nuevo ? 'activa' : 'desactivada'}",
          ),
        );

  ResultTask<Unit> _validarIntegridadSubcategorias(String id) => repository
      .obtenerPorCategoriaPadre(id)
      .flatMap(
        (subs) => subs.any((c) => c.activa)
            ? TaskEither.left(
                const Failure.validation(
                  "No se puede desactivar: existen subcategorías activas vinculadas.",
                ),
              )
            : TaskEither.right(unit),
      );
}
