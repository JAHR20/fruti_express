import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

abstract class SucursalRepository {
  ResultTask<Sucursal> crear(Sucursal sucursal);
  ResultTask<Sucursal> actualizar(Sucursal sucursal);
  ResultTask<List<String>> obtenerCobertura(String sucursalId);
  ResultTask<Unit> actualizarCobertura({
    required String sucursalId,
    required List<String> codigosPostales,
  });
  ResultTask<Sucursal?> obtenerPorId(String id);
  ResultTask<List<Sucursal>> obtenerTodas();
  ResultTask<Sucursal?> obtenerPorNombre(String nombre);
  ResultStream<List<Sucursal>> watchTodas();
  ResultTask<Sucursal?> obtenerPorCodigoPostal(String codigoPostal);
}
