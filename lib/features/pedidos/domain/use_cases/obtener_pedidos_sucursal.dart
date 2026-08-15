import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosSucursal {
  final PedidoRepository repository;

  ObtenerPedidosSucursal(this.repository);

  ResultTask<List<Pedido>> ejecutar(String sucursalId) {
    final idLimpio = sucursalId.trim();

    return TaskEither.Do(($) async {
      if (idLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'Se requiere un ID de sucursal válido para obtener los pedidos.',
            ),
          ),
        );
      }
      return await $(repository.obtenerPorSucursal(idLimpio));
    });
  }
}
