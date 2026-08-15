import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/extensions/categoria_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class EditarCategoria {
  final CategoriaRepository repository;

  EditarCategoria(this.repository);

  ResultTask<Categoria> ejecutar({
    required Perfil usuarioActual,
    required String categoriaId,
    String? nombre,
    String? descripcion,
    String? imagenUrl,
    String? categoriaPadreId,
    bool? activa,
  }) {
    return TaskEither.Do(($) async {
      await $(_validarPermisos(usuarioActual));

      final original = await $(repository.obtenerPorId(categoriaId));
      if (original == null) {
        return await $(
          TaskEither.left(const Failure.notFound("Categoría no encontrada")),
        );
      }

      final nuevoNombre = nombre?.trim();
      if (nuevoNombre != null && nuevoNombre != original.nombre) {
        await $(_validarNombreUnico(nuevoNombre, categoriaId));
      }
      if (categoriaPadreId != null &&
          categoriaPadreId != original.categoriaPadreId) {
        await $(_validarRelacionPadre(categoriaPadreId, categoriaId));
      }

      final actualizada = original.copyWith(
        nombre: nuevoNombre ?? original.nombre,
        descripcion: descripcion ?? original.descripcion,
        imagenUrl: imagenUrl ?? original.imagenUrl,
        categoriaPadreId: categoriaPadreId ?? original.categoriaPadreId,
        activa: activa ?? original.activa,
      );

      await $(repository.actualizar(actualizada));

      return actualizada;
    });
  }

  ResultTask<Unit> _validarPermisos(Perfil usuario) =>
      usuario.puedeEditarCategoria()
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            "No tienes permisos para editar categorías",
          ),
        );

  ResultTask<Unit> _validarNombreUnico(String nombre, String idActual) =>
      repository
          .obtenerPorNombre(nombre)
          .flatMap(
            (existente) => (existente != null && existente.id != idActual)
                ? TaskEither.left(
                    const Failure.alreadyExists(
                      "Ya existe una categoría con ese nombre",
                    ),
                  )
                : TaskEither.right(unit),
          );

  ResultTask<Unit> _validarRelacionPadre(String padreId, String idActual) {
    if (padreId == idActual) {
      return TaskEither.left(
        const Failure.validation("Una categoría no puede ser su propio padre"),
      );
    }
    return repository
        .obtenerPorId(padreId)
        .flatMap(
          (padre) => padre == null
              ? TaskEither.left(
                  const Failure.validation(
                    "La categoría padre seleccionada no existe",
                  ),
                )
              : TaskEither.right(unit),
        );
  }
}
