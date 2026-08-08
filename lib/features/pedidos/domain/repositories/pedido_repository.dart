import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/confirmar_entrega_params.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_params.dart';

abstract class PedidoRepository {
  // --- 🔍 CONSULTAS (One-shot) ---
  ResultTask<Pedido> obtenerPorId(String id);
  ResultTask<List<Pedido>> obtenerPorSucursal(String sucursalId);
  ResultTask<List<Pedido>> obtenerPorEstado({
    required String sucursalId,
    required EstadoPedido estado,
  });

  ResultTask<Pedido> crear(CrearPedidoParams params);

  ResultTask<List<Pedido>> obtenerPorUsuario(String usuarioId);

  ResultTask<List<Pedido>> obtenerTodos();

  // --- 📊 ESTADÍSTICAS ---
  ResultTask<int> contarPorEstado(String sucursalId, EstadoPedido estado);
  ResultTask<int> obtenerVentasDelDia(String sucursalId);
  ResultTask<int> contarPedidosHoy(String sucursalId);

  // --- ✍️ ACCIONES ---
  ResultTask<Pedido> actualizarEstado({
    required String pedidoId,
    required EstadoPedido nuevoEstado,
  });

  ResultTask<Pedido> asignarRepartidor({
    required String pedidoId,
    required String repartidorId,
  });

  // --- 📡 TIEMPO REAL ---
  /// Imprescindible para el Dashboard: ver pedidos nuevos al instante.
  ResultStream<List<Pedido>> watchPorSucursal(String sucursalId);

  ResultStream<List<Pedido>> watchPorRepartidor(String repartidorId);

  // En PedidoRepository
  ResultTask<Unit> confirmarEntrega(ConfirmarEntregaParams params);
}
