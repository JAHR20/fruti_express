import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

abstract class PedidoRemoteDatasource {
  Future<Pedido?> obtenerPorId(String id);
  Future<List<Pedido>> obtenerPorSucursal(String sucursalId);
  Future<List<Pedido>> obtenerPorEstado(String sucursalId, String estado);
  Future<List<Pedido>> obtenerTodos();

  Future<Pedido> crear(Pedido pedido);

  Future<List<Pedido>> obtenerPorUsuario(String usuarioId);

  // Estadísticas
  Future<int> contarPorEstado(String sucursalId, String estado);
  Future<int> obtenerVentasDelDia(String sucursalId);
  Future<int> contarPedidosHoy(String sucursalId);

  // Acciones
  Future<Pedido> actualizarEstado(String pedidoId, String nuevoEstado);
  Future<Pedido> asignarRepartidor(String pedidoId, String repartidorId);

  // Tiempo Real
  Stream<List<Pedido>> watchPorSucursal(String sucursalId);
}
