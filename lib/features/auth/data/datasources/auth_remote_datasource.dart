import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

abstract class AuthRemoteDataSource {
  Future<Perfil> login(String email, String password);
  Future<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
  });
  Future<void> logout();
  Future<Perfil?> obtenerUsuarioActual();
}
