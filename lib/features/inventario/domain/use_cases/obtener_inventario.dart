import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class ObtenerInventarioPorProducto {
  final InventarioRepository repository;

  ObtenerInventarioPorProducto(this.repository);
  ResultTask<Inventario> ejecutar({
    required String productoId,
    required String sucursalId,
  }) {
    return TaskEither.Do(($) async {
      await $(_validarInputs(productoId, sucursalId));

      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'No se encontró información de inventario para este producto en la sucursal.',
            ),
          ),
        );
      }

      return inventario;
    });
  }

  ResultTask<Unit> _validarInputs(String pId, String sId) {
    if (pId.trim().isEmpty || sId.trim().isEmpty) {
      return TaskEither.left(
        const Failure.validation(
          'El ID del producto y de la sucursal son obligatorios.',
        ),
      );
    }
    return TaskEither.right(unit);
  }
}
