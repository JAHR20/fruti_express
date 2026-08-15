import 'package:fruti_express_jahr_admin/features/inventario/data/models/inventario_model.dart';

abstract class InventarioRemoteDatasource {
  Future<InventarioModel?> obtener({
    required String productoId,
    required String sucursalId,
  });
  Future<InventarioModel> actualizar(InventarioModel model);
  Future<List<InventarioModel>> obtenerPorSucursal(String sucursalId);
  Future<InventarioModel> crear(InventarioModel model);
  Future<List<InventarioModel>> obtenerPorProducto(String productoId);
  Stream<List<InventarioModel>> watchPorSucursal(String sucursalId);
  Future<void> ajustarStockAtomicamente({
    required String productoId,
    required String sucursalId,
    required int cantidadCambio,
  });
  Future<int> obtenerStockActual(String productoId, String sucursalId);
}
