import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';

abstract class InventarioRepository {
  // --- ✍️ ESCRITURA ---
  ResultTask<Inventario> crear(Inventario inventario);
  ResultTask<Inventario> actualizar(Inventario inventario);

  // --- 🔍 CONSULTAS ---
  /// Obtiene el registro específico de un producto en una sucursal.
  ResultTask<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  });

  ResultTask<List<Inventario>> obtenerPorProducto(String productoId);
  ResultTask<List<Inventario>> obtenerPorSucursal(String sucursalId);

  // --- 📡 TIEMPO REAL ---
  /// Para ver alertas de "Stock Bajo" al instante.
  ResultStream<List<Inventario>> watchPorSucursal(String sucursalId);
}
