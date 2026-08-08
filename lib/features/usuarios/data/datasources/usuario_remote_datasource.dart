import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';

abstract class UsuarioRemoteDatasource {
  Future<List<PerfilModel>> obtenerTodos();

  Future<List<PerfilModel>> obtenerPorSucursal(String sucursalId);

  Future<PerfilModel?> obtenerPorId(String id);

  /// 🆕 Busca por nombre o email usando filtros de texto.
  Future<List<PerfilModel>> buscarUsuarios(String query);

  /// 🆕 Filtra específicamente por el rol 'repartidor'.
  Future<List<PerfilModel>> obtenerRepartidores({String? sucursalId});

  /// 🛠️ Ahora devuelven Perfil para refrescar la UI instantáneamente.
  Future<PerfilModel> cambiarRol({required String id, required String rol});

  Future<PerfilModel> cambiarEstado({required String id, required bool activo});

  Future<int> contarPorRolYEstado({required String rol, required bool activo});

  Future<bool> existeEncargadoEnSucursal(String sucursalId);

  Future<PerfilModel> actualizarPerfil(PerfilModel model);
}
