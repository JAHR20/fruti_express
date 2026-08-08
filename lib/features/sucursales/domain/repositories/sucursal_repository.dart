import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

abstract class SucursalRepository {
  // --- ✍️ ESCRITURA ---
  ResultTask<Sucursal> crear(Sucursal sucursal);
  ResultTask<Sucursal> actualizar(Sucursal sucursal);

  // --- 🔍 CONSULTAS ---
  ResultTask<Sucursal?> obtenerPorId(String id);
  ResultTask<List<Sucursal>> obtenerTodas();
  ResultTask<Sucursal?> obtenerPorNombre(String nombre);

  // --- 📡 TIEMPO REAL ---
  ResultStream<List<Sucursal>> watchTodas();

  ResultTask<List<String>> obtenerCobertura(String sucursalId);
  ResultTask<Sucursal?> obtenerPorCodigoPostal(String codigoPostal);
}
