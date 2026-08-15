import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart'; // Tu typedef de TaskEither
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class ObtenerStockActual {
  final InventarioRepository _repository;

  ObtenerStockActual(this._repository);

  ResultTask<int> ejecutar(String productoId, String sucursalId) =>
      TaskEither.Do(($) async {
        final idProductoValido = await $(
          TaskEither.fromPredicate(
            productoId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation('El identificador del producto es inválido'),
          ),
        );

        final idSucursalValido = await $(
          TaskEither.fromPredicate(
            sucursalId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation('La sucursal seleccionada no es válida'),
          ),
        );

        final stock = await $(
          _repository.obtenerStockActual(idProductoValido, idSucursalValido)
        );

        return stock;
      });
}