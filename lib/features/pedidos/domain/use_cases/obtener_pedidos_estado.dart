import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosPorEstado {
  final PedidoRepository repository;

  ObtenerPedidosPorEstado(this.repository);

  ResultTask<List<Pedido>> ejecutar({
    required String sucursalId,
    required EstadoPedido estado,
  }) {
    return TaskEither.Do(($) async {
      if (sucursalId.trim().isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El ID de la sucursal es obligatorio para filtrar pedidos.',
            ),
          ),
        );
      }

      return await $(
        repository.obtenerPorEstado(
          sucursalId: sucursalId.trim(),
          estado: estado,
        ),
      );
    });
  }
}
