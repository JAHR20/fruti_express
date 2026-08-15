import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

abstract class UsuarioRepository {
  ResultTask<Perfil> obtenerPorId(String id);
  ResultTask<List<Perfil>> obtenerTodos();
  ResultTask<List<Perfil>> obtenerRepartidores({String? sucursalId});
  ResultTask<int> contarAdminsActivos();
  ResultTask<bool> existeEncargadoEnSucursal(String sucursalId);
  ResultTask<List<Perfil>> obtenerClientesQueHanCompradoEnSucursal(
    String sucursalId,
  );
  ResultTask<List<Perfil>> buscarUsuarios(String query);
  ResultTask<Perfil> actualizar(Perfil perfil);
  ResultTask<Perfil> cambiarEstado({required String id, required bool activo});
  ResultTask<Perfil> cambiarRol({
    required String id,
    required TipoUsuario nuevoRol,
  });
}
