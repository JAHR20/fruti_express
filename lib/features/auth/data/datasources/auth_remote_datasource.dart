import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';

abstract class AuthRemoteDataSource {
  Future<PerfilModel> login(String email, String password);
  Future<PerfilModel> registro({
    required String email,
    required String password,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono, // Puedes usar este campo para asignar el rol (cliente/repart
  });
  Future<void> logout();
  Future<PerfilModel?> obtenerUsuarioActual();
}
