import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

abstract class SucursalRemoteDatasource {
  Future<List<Sucursal>> obtenerTodas();
  Future<Sucursal?> obtenerPorId(String id);
  Future<Sucursal> crear(Sucursal sucursal);
  Future<Sucursal> actualizar(Sucursal sucursal);
  Future<void> desactivar(String id);
  Future<Sucursal?> obtenerPorNombre(String nombre);
  Stream<List<Sucursal>> watchTodas();
}
