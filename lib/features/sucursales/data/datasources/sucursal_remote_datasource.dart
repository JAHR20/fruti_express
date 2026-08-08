import 'package:fruti_express_jahr_admin/features/sucursales/data/models/sucursal_model.dart';

abstract class SucursalRemoteDatasource {
  Future<List<SucursalModel>> obtenerTodas();
  Future<SucursalModel?> obtenerPorId(String id);
  Future<SucursalModel> crear(SucursalModel model);
  Future<SucursalModel> actualizar(SucursalModel model);
  Future<SucursalModel?> obtenerPorNombre(String nombre);
  Stream<List<SucursalModel>> watchTodas();

  Future<List<String>> obtenerCobertura(String sucursalId);
  Future<void> guardarCobertura({
    required String sucursalId,
    required List<String> codigosPostales,
  });
  Future<SucursalModel?> obtenerPorCodigoPostal(String codigoPostal);
}
