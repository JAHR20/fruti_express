import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

class CambiarEstadoProducto {
  final ProductoRepository repository;

  CambiarEstadoProducto({required this.repository});

  ResultTask<Producto> ejecutar({
    required Perfil usuario,
    required String productoId,
    required bool
    nuevoEstado,
  }) {
    return TaskEither.Do(($) async {
      // Validar Permisos
      await $(_validarPermisos(usuario));

      // Obtener Producto
      final producto = await $(repository.obtenerPorId(productoId));

      // Validar que el cambio sea necesario (Evitar peticiones redundantes)
      await $(_validarCambioNecesario(producto, nuevoEstado));

      // Aplicar Cambio con inmutabilidad
      final productoActualizado = producto.copyWith(isActive: nuevoEstado);

      // Persistir y retornar
      return await $(repository.actualizar(productoActualizado));
    });
  }

  ResultTask<Unit> _validarPermisos(Perfil u) => u.puedeGestionarCatalogo
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para modificar el catálogo',
          ),
        );

  ResultTask<Unit> _validarCambioNecesario(Producto p, bool nuevo) =>
      p.isActive != nuevo
      ? TaskEither.right(unit)
      : TaskEither.left(
          Failure.validation(
            'El producto ya se encuentra ${nuevo ? 'activo' : 'desactivado'}',
          ),
        );
}
