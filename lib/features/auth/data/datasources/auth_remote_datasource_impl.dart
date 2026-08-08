import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;
  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<PerfilModel> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Error de autenticación");

    return await _traerPerfilDeBaseDeDatos(response.user!.id);
  }

  @override
  Future<PerfilModel?> obtenerUsuarioActual() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;
    return await _traerPerfilDeBaseDeDatos(session.user.id);
  }

  // Método privado para evitar repetir código
  Future<PerfilModel> _traerPerfilDeBaseDeDatos(String id) async {
    final data = await supabase.from('perfiles').select().eq('id', id).single();

    return PerfilModel.fromJson(data);
  }

  @override
  Future<void> logout() async => await supabase.auth.signOut();

  @override
  Future<PerfilModel> registro({
    required String email,
    required String password,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono,
  }) async {
    // 1. Registro en Supabase Auth pasando los metadatos.
    // El Trigger de SQL leerá estos datos y creará el perfil automáticamente.
    final authRes = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'nombre': nombre,
        'apellido_paterno': apellidoPaterno,
        'apellido_materno': apellidoMaterno ?? '',
        'alias': alias ?? '',
        'telefono': telefono,
      },
    );

    if (authRes.user == null) throw Exception("Error al crear cuenta");

    return await _traerPerfilDeBaseDeDatos(authRes.user!.id);
  }
}
