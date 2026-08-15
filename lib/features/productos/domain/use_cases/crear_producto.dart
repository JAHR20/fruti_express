import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CrearProducto {
  final ProductoRepository repository;
  final CategoriaRepository categoriaRepository;

  CrearProducto({required this.repository, required this.categoriaRepository});

  ResultTask<Producto> ejecutar({
    required Perfil usuario,
    required String categoriaId,
    required String nombre,
    String? descripcion,
    required int precioActual,
    int? precioComparacion,
    required UnidadMedida unidadMedida,
    String? imagenUrl,
  }) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      // Validaciones de Reglas y Seguridad
      await $(_validarPermisos(usuario));
      await $(_validarPrecios(precioActual, precioComparacion));

      // Validaciones de Integridad (DB)
      await $(_validarCategoriaExistente(categoriaId));
      await $(_validarNombreUnico(nombreTrim));

      // Construcción de la Entidad
      final producto = Producto(
        id: '',
        categoriaId: categoriaId,
        nombre: nombreTrim,
        descripcion: descripcion,
        precioActual: precioActual,
        precioComparacion: precioComparacion,
        unidadMedida: unidadMedida,
        imagenUrl: imagenUrl,
        isActive: true,
        fechaCreacion: DateTime.now(),
      );

      // Persistencia Como crear devuelve ResultTask<Producto>, el $ extrae el Producto final
      return await $(repository.crear(producto));
    });
  }


  ResultTask<Unit> _validarPermisos(Perfil u) => u.puedeGestionarCatalogo
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.unauthorized('No tienes permisos'));

  ResultTask<Unit> _validarPrecios(int actual, int? comp) =>
      actual > 0 && (comp == null || comp >= actual)
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.validation('Precios no válidos'));

  ResultTask<Unit> _validarCategoriaExistente(String id) => categoriaRepository
      .obtenerPorId(id)
      .flatMap(
        (categoria) => categoria != null
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation('Categoría no encontrada'),
              ),
      );

  ResultTask<Unit> _validarNombreUnico(String nombre) => repository
      .existePorNombre(nombre)
      .flatMap(
        (existe) => existe
            ? TaskEither.left(const Failure.alreadyExists('Nombre duplicado'))
            : TaskEither.right(unit),
      );
}
