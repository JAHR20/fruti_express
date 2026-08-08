import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart'; // Tu typedef de TaskEither
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class ObtenerStockActual {
  final InventarioRepository _repository;

  ObtenerStockActual(this._repository);

  ResultTask<int> ejecutar(String productoId, String sucursalId) =>
      TaskEither.Do(($) async {
        
        // 🌟 1. VALIDACIÓN: Producto ID
        // Si viene vacío, cortamos la ejecución y regresamos el Failure al instante
        final idProductoValido = await $(
          TaskEither.fromPredicate(
            productoId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation('El identificador del producto es inválido'),
          ),
        );

        // 🌟 2. VALIDACIÓN: Sucursal ID
        final idSucursalValido = await $(
          TaskEither.fromPredicate(
            sucursalId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation('La sucursal seleccionada no es válida'),
          ),
        );

        // 🌟 3. EJECUCIÓN
        // Si pasó las validaciones, ahora sí disparamos la petición a la BD
        final stock = await $(
          _repository.obtenerStockActual(idProductoValido, idSucursalValido)
        );

        // Retornamos el resultado exitoso
        return stock;
      });
}