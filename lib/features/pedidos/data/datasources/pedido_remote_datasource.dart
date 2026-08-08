import 'package:fruti_express_jahr_admin/features/pedidos/data/models/pedido_model.dart';

abstract class PedidoRemoteDatasource {
  Future<PedidoModel?> obtenerPorId(String id);
  Future<List<PedidoModel>> obtenerPorSucursal(String sucursalId);
  Future<List<PedidoModel>> obtenerPorEstado(String sucursalId, String estado);
  Future<List<PedidoModel>> obtenerTodos();

  Future<PedidoModel> crear(PedidoModel model);

  Future<List<PedidoModel>> obtenerPorUsuario(String usuarioId);

  // Estadísticas
  Future<int> contarPorEstado(String sucursalId, String estado);
  Future<int> obtenerVentasDelDia(String sucursalId);
  Future<int> contarPedidosHoy(String sucursalId);

  // Acciones
  Future<PedidoModel> actualizarEstado(String pedidoId, String nuevoEstado);
  Future<PedidoModel> asignarRepartidor(String pedidoId, String repartidorId);

  // Tiempo Real
  Stream<List<PedidoModel>> watchPorSucursal(String sucursalId);
  // En PedidoRemoteDatasource
  Stream<List<PedidoModel>> watchPorRepartidor(String repartidorId);

  Future<void> confirmarEntrega({
    required String pedidoId,
    String? codigoConfirmacion,
    String? urlEvidencia,
  });

  Future<String?> obtenerCodigoConfirmacion(String pedidoId);
}
