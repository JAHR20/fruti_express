import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';

abstract class UsuarioRemoteDatasource {
  Future<List<PerfilModel>> obtenerTodos();
  Future<List<PerfilModel>> obtenerPorSucursal(String sucursalId);
  Future<PerfilModel?> obtenerPorId(String id);
  Future<List<PerfilModel>> buscarUsuarios(String query);
  Future<List<PerfilModel>> obtenerRepartidores({String? sucursalId});
  Future<PerfilModel> cambiarRol({required String id, required String rol});
  Future<PerfilModel> cambiarEstado({required String id, required bool activo});
  Future<int> contarPorRolYEstado({required String rol, required bool activo});
  Future<bool> existeEncargadoEnSucursal(String sucursalId);
  Future<PerfilModel> actualizarPerfil(PerfilModel model);
}
