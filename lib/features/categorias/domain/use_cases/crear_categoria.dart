import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/extensions/categoria_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class CrearCategoria {
  final CategoriaRepository repository;

  CrearCategoria(this.repository);

  ResultTask<Categoria> ejecutar({
    required Perfil usuarioActual,
    required String nombre,
    String? descripcion,
    String? imagenUrl,
    String? categoriaPadreId,
  }) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación de Permisos (Fail Fast)
      await $(_validarPermisos(usuarioActual));

      // 2️⃣ Validación de Entrada
      await $(_validarNombreEntrada(nombreTrim));

      // 3️⃣ Regla de Negocio: Evitar nombres duplicados
      await $(_validarNombreUnico(nombreTrim));

      // 4️⃣ Regla de Negocio: Validar existencia de Categoría Padre (si aplica)
      if (categoriaPadreId != null) {
        await $(_validarExistenciaPadre(categoriaPadreId));
      }

      // 5️⃣ Construcción e Inserción
      final nuevaCategoria = Categoria(
        id: '', // Se generará en la capa de datos
        nombre: nombreTrim,
        descripcion: descripcion,
        imagenUrl: imagenUrl,
        activa: true,
        categoriaPadreId: categoriaPadreId,
        fechaCreacion: DateTime.now(),
      );

      return await $(repository.crear(nuevaCategoria));
    });
  }

  // --- 🧩 MICRO-PASOS BLINDADOS ---

  ResultTask<Unit> _validarPermisos(Perfil usuario) =>
      usuario.puedeCrearCategoria()
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            "No tienes permisos para crear categorías",
          ),
        );

  ResultTask<Unit> _validarNombreEntrada(String nombre) => nombre.isEmpty
      ? TaskEither.left(
          const Failure.validation(
            "El nombre de la categoría no puede estar vacío",
          ),
        )
      : TaskEither.right(unit);

  ResultTask<Unit> _validarNombreUnico(String nombre) => repository
      .obtenerPorNombre(nombre)
      .flatMap(
        (existe) => existe != null
            ? TaskEither.left(
                const Failure.alreadyExists(
                  "Ya existe una categoría con ese nombre",
                ),
              )
            : TaskEither.right(unit),
      );

  ResultTask<Unit> _validarExistenciaPadre(String id) => repository
      .obtenerPorId(id)
      .flatMap(
        (padre) => padre != null
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation(
                  "La categoría padre seleccionada no existe",
                ),
              ),
      );
}
