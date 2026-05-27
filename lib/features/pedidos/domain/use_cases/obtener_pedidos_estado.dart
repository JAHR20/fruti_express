import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosPorEstado {
  final PedidoRepository repository;

  ObtenerPedidosPorEstado(this.repository);

  /// Retorna un flujo asíncrono blindado con la lista de pedidos filtrada.
  ResultTask<List<Pedido>> ejecutar({
    required String sucursalId,
    required EstadoPedido estado,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      // Evitamos llamadas innecesarias al servidor si el ID está vacío.
      if (sucursalId.trim().isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El ID de la sucursal es obligatorio para filtrar pedidos.',
            ),
          ),
        );
      }

      // 2️⃣ Delegación al Repositorio
      // El operador $ extrae la lista de pedidos o propaga el fallo (Left) automáticamente.
      return await $(
        repository.obtenerPorEstado(
          sucursalId: sucursalId.trim(),
          estado: estado,
        ),
      );
    });
  }
}
