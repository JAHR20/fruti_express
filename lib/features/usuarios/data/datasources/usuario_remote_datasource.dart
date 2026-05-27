import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

abstract class UsuarioRemoteDatasource {
  Future<List<Perfil>> obtenerTodos();

  Future<List<Perfil>> obtenerPorSucursal(String sucursalId);

  Future<Perfil?> obtenerPorId(String id);

  /// 🆕 Busca por nombre o email usando filtros de texto.
  Future<List<Perfil>> buscarUsuarios(String query);

  /// 🆕 Filtra específicamente por el rol 'repartidor'.
  Future<List<Perfil>> obtenerRepartidores({String? sucursalId});

  /// 🛠️ Ahora devuelven Perfil para refrescar la UI instantáneamente.
  Future<Perfil> cambiarRol({required String id, required String rol});

  Future<Perfil> cambiarEstado({required String id, required bool activo});

  Future<int> contarPorRolYEstado({required String rol, required bool activo});

  Future<bool> existeEncargadoEnSucursal(String sucursalId);

  Future<Perfil> actualizarPerfil(Perfil perfil);
}
