import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/dashboard/domain/entities/dashboard_resumen.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerResumenDashboard {
  final PedidoRepository repository;

  ObtenerResumenDashboard(this.repository);

  ResultTask<DashboardResumen> ejecutar(String sucursalId) {
    final idLimpio = sucursalId.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      if (idLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'Se requiere una sucursal para cargar el dashboard',
            ),
          ),
        );
      }
      final futures = await Future.wait([
        repository.contarPorEstado(idLimpio, EstadoPedido.pagoPendiente).run(),
        repository.contarPorEstado(idLimpio, EstadoPedido.enPreparacion).run(),
        repository.contarPorEstado(idLimpio, EstadoPedido.enCamino).run(),
        repository.obtenerVentasDelDia(idLimpio).run(),
        repository.contarPedidosHoy(idLimpio).run(),
      ]);

      final pPendientes = await $(TaskEither.fromEither(futures[0]));
      final pPreparacion = await $(TaskEither.fromEither(futures[1]));
      final pCamino = await $(TaskEither.fromEither(futures[2]));
      final pVentas = await $(TaskEither.fromEither(futures[3]));
      final pTotal = await $(TaskEither.fromEither(futures[4]));

      return DashboardResumen(
        pedidosPendientes: pPendientes,
        pedidosEnPreparacion: pPreparacion,
        pedidosEnCamino: pCamino,
        ventasDelDia: pVentas,
        totalPedidosHoy: pTotal,
      );
    });
  }
}
