import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

abstract class UsuarioRepository {
  // --- 🔍 CONSULTAS ---

  /// Obtiene el perfil de un usuario por su ID único.
  ResultTask<Perfil> obtenerPorId(String id);

  /// Obtiene la lista completa de usuarios (Clientes, Admins, Encargados).
  ResultTask<List<Perfil>> obtenerTodos();

  ResultTask<List<Perfil>> obtenerRepartidores({String? sucursalId});

  /// Consulta específica para reportes o límites de seguridad.
  ResultTask<int> contarAdminsActivos();

  /// Verifica si una sucursal ya tiene un encargado asignado.
  ResultTask<bool> existeEncargadoEnSucursal(String sucursalId);

  /// Obtiene clientes filtrados por su historial de compras en una ubicación.
  ResultTask<List<Perfil>> obtenerClientesQueHanCompradoEnSucursal(
    String sucursalId,
  );

  ResultTask<List<Perfil>> buscarUsuarios(String query);

  // --- ✍️ ESCRITURA ---

  /// Actualiza los datos del perfil.
  ResultTask<Perfil> actualizar(Perfil perfil);

  ResultTask<Perfil> cambiarEstado({required String id, required bool activo});

  /// 🆕 Cambia el rol jerárquico del usuario.
  ResultTask<Perfil> cambiarRol({
    required String id,
    required TipoUsuario nuevoRol,
  });
}
