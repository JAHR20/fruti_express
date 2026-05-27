import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

abstract class InventarioRemoteDatasource {
  /// Busca el stock de un producto específico en una sucursal.
  Future<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  });

  /// Crea o actualiza el registro (Upsert).
  Future<Inventario> actualizar(Inventario inventario);

  /// Trae todo el inventario de una sucursal para la vista de gestión.
  Future<List<Inventario>> obtenerPorSucursal(String sucursalId);

  Future<Inventario> crear(Inventario inventario);
  Future<List<Inventario>> obtenerPorProducto(String productoId);
  Stream<List<Inventario>> watchPorSucursal(String sucursalId);
}
