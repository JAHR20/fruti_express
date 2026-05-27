import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

abstract class DireccionRemoteDatasource {
  Future<List<Direccion>> obtenerPorUsuario(String usuarioId);
  Future<Direccion> crear(Direccion direccion);
  Future<Direccion> actualizar(Direccion direccion);
  Future<void> eliminar(String id);
  Future<void> establecerPrincipal(String usuarioId, String direccionId);
}
