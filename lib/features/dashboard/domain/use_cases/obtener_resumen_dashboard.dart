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

      // 2️⃣ Disparar todas las consultas en paralelo (Velocidad máxima 🚀)
      // Ejecutamos el .run() de cada TaskEither para que empiecen a trabajar YA.
      final futures = await Future.wait([
        repository.contarPorEstado(idLimpio, EstadoPedido.pagoPendiente).run(),
        repository.contarPorEstado(idLimpio, EstadoPedido.enPreparacion).run(),
        repository.contarPorEstado(idLimpio, EstadoPedido.enCamino).run(),
        repository.obtenerVentasDelDia(idLimpio).run(),
        repository.contarPedidosHoy(idLimpio).run(),
      ]);

      // 3️⃣ Validar y extraer resultados con el operador $
      // Usamos TaskEither.fromEither para volver al flujo funcional.
      // Si alguno es Left, el $ detendrá todo y devolverá ese error.
      final pPendientes = await $(TaskEither.fromEither(futures[0]));
      final pPreparacion = await $(TaskEither.fromEither(futures[1]));
      final pCamino = await $(TaskEither.fromEither(futures[2]));
      final pVentas = await $(TaskEither.fromEither(futures[3]));
      final pTotal = await $(TaskEither.fromEither(futures[4]));

      // 4️⃣ Construir el resumen (Solo llegamos aquí si todos fueron Right)
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
