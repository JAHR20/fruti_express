import 'package:fruti_express_jahr_admin/features/direcciones/data/models/direccion_model.dart';

abstract class DireccionRemoteDatasource {
  Future<List<DireccionModel>> obtenerPorUsuario(String usuarioId);
  Future<DireccionModel> crear(DireccionModel model);
  Future<DireccionModel> actualizar(DireccionModel model);
  Future<void> eliminar(String id);
  Future<void> establecerPrincipal(String usuarioId, String direccionId);
}
