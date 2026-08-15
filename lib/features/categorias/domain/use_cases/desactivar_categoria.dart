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
      await $(_validarPermisos(usuarioActual));

      final categoria = await $(repository.obtenerPorId(categoriaId));
      if (categoria == null) {
        return await $(
          TaskEither.left(const Failure.notFound("Categoría no encontrada")),
        );
      }
      await $(_validarCambioNecesario(categoria, nuevoEstado));

      if (!nuevoEstado) {
        await $(_validarIntegridadSubcategorias(categoriaId));
      }

      final actualizada = categoria.copyWith(activa: nuevoEstado);
      await $(repository.actualizar(actualizada));

      return actualizada;
    });
  }

  ResultTask<Unit> _validarPermisos(Perfil usuario) =>
      usuario
          .puedeDesactivarCategoria()
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
