import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class ActualizarProducto {
  final ProductoRepository repository;
  final CategoriaRepository categoriaRepository;

  ActualizarProducto({
    required this.repository,
    required this.categoriaRepository,
  });

  ResultTask<Producto> ejecutar({
    required Perfil usuario,
    required String productoId,
    required String categoriaId,
    required String nombre,
    String? descripcion,
    required int precioActual,
    int? precioComparacion,
    required UnidadMedida unidadMedida,
    String? imagenUrl,
    required bool isActive,
  }) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validaciones Iniciales (Síncronas)
      await $(_validarPermisos(usuario));
      await $(_validarPrecios(precioActual, precioComparacion));

      // 2️⃣ Obtener el producto actual para comparar cambios
      // Si no existe, el repo ya devuelve Left(Failure.notFound) y el $ detiene todo.
      final existente = await $(repository.obtenerPorId(productoId));

      // 3️⃣ Validar Categoría (SOLO si cambió)
      if (existente.categoriaId != categoriaId) {
        await $(_validarNuevaCategoria(categoriaId));
      }

      // 4️⃣ Validar Nombre duplicado (SOLO si cambió)
      if (existente.nombre != nombreTrim) {
        await $(_validarNuevoNombre(nombreTrim));
      }

      // 5️⃣ Crear copia con datos actualizados
      final actualizado = existente.copyWith(
        categoriaId: categoriaId,
        nombre: nombreTrim,
        descripcion: descripcion,
        precioActual: precioActual,
        precioComparacion: precioComparacion,
        unidadMedida: unidadMedida,
        imagenUrl: imagenUrl,
        isActive: isActive,
      );

      // 6️⃣ Persistir cambios
      return await $(repository.actualizar(actualizado));
    });
  }

  // --- 🧩 MICRO-PASOS BLINDADOS ---

  ResultTask<Unit> _validarPermisos(Perfil u) => u.puedeGestionarCatalogo
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para editar el catálogo',
          ),
        );

  ResultTask<Unit> _validarPrecios(int actual, int? comp) =>
      actual > 0 && (comp == null || comp >= actual)
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.validation('Precios no válidos'));

  ResultTask<Unit> _validarNuevaCategoria(String id) => categoriaRepository
      .obtenerPorId(id)
      .flatMap(
        (cat) => cat != null
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation('La nueva categoría no existe'),
              ),
      );

  ResultTask<Unit> _validarNuevoNombre(String nombre) => repository
      .existePorNombre(nombre)
      .flatMap(
        (existe) => existe
            ? TaskEither.left(
                const Failure.alreadyExists(
                  'Ya existe otro producto con este nombre',
                ),
              )
            : TaskEither.right(unit),
      );
}
