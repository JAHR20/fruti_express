import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosSucursal {
  final PedidoRepository repository;

  ObtenerPedidosSucursal(this.repository);

  /// Obtiene todos los pedidos vinculados a una sucursal específica.
  ResultTask<List<Pedido>> ejecutar(String sucursalId) {
    final idLimpio = sucursalId.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast (Síncrona)
      if (idLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'Se requiere un ID de sucursal válido para obtener los pedidos.',
            ),
          ),
        );
      }

      // 2️⃣ Delegación al Repositorio
      // El operador $ extrae la lista o propaga el fallo automáticamente.
      // Si el repositorio falla (ej. error de Firebase), el Left subirá hasta la UI.
      return await $(repository.obtenerPorSucursal(idLimpio));
    });
  }
}
