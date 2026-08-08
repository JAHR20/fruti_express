import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductosPorSucursal {
  final ProductoRepository repository;

  ObtenerProductosPorSucursal({required this.repository});

  ResultTask<List<Producto>> ejecutar(String sucursalId) {
    final sucursalLimpia = sucursalId.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación (Fail Fast)
      if (sucursalLimpia.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation('El ID de la sucursal es necesario.'),
          ),
        );
      }

      // 2️⃣ Llamada al repositorio
      final productos = await $(repository.obtenerPorSucursal(sucursalLimpia));
      return productos;
    });
  }
}