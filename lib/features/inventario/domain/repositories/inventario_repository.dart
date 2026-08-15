import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

abstract class InventarioRepository {
  ResultTask<Inventario> crear(Inventario inventario);
  ResultTask<Inventario> actualizar(Inventario inventario);
  ResultTask<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  });
  ResultTask<List<Inventario>> obtenerPorProducto(String productoId);
  ResultTask<List<Inventario>> obtenerPorSucursal(String sucursalId);
  ResultTask<Unit> ajustarStockAtomicamente({
    required String productoId,
    required String sucursalId,
    required int cantidadCambio, 
  });
  ResultStream<List<Inventario>> watchPorSucursal(String sucursalId);
  ResultTask<int> obtenerStockActual(String productoId, String sucursalId);
}
