import 'package:fruti_express_jahr_admin/features/inventario/data/models/inventario_model.dart';

abstract class InventarioRemoteDatasource {
  /// Busca el stock de un producto específico en una sucursal.
  Future<InventarioModel?> obtener({
    required String productoId,
    required String sucursalId,
  });

  /// Crea o actualiza el registro (Upsert).
  Future<InventarioModel> actualizar(InventarioModel model);

  /// Trae todo el inventario de una sucursal para la vista de gestión.
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
