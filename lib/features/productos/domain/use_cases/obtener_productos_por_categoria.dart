import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductosPorCategoria {
  final ProductoRepository repository;

  ObtenerProductosPorCategoria({required this.repository});

  // 🌟 Ahora pedimos ambos IDs
  ResultTask<List<Producto>> ejecutar(String categoriaId, String sucursalId) {
    final idLimpio = categoriaId.trim();
    final sucursalLimpia = sucursalId.trim();

    return TaskEither.Do(($) async {
      if (idLimpio.isEmpty || sucursalLimpia.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El ID de la categoría y la sucursal son necesarios para la búsqueda',
            ),
          ),
        );
      }

      final productos = await $(repository.obtenerPorCategoria(idLimpio, sucursalLimpia));

      return productos;
    });
  }
}