import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;
  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<Perfil> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Error de autenticación");

    return await _traerPerfilDeBaseDeDatos(response.user!.id);
  }

  @override
  Future<Perfil?> obtenerUsuarioActual() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;
    return await _traerPerfilDeBaseDeDatos(session.user.id);
  }

  // Método privado para evitar repetir código
  Future<Perfil> _traerPerfilDeBaseDeDatos(String id) async {
    final data = await supabase.from('perfiles').select().eq('id', id).single();

    return Perfil.fromJson(data);
  }

  @override
  Future<void> logout() async => await supabase.auth.signOut();

  @override
  Future<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
  }) async {
    // 1. Registro en Supabase Auth
    final authRes = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    if (authRes.user == null) throw Exception("Error al crear cuenta");

    // 2. Crear el perfil en la tabla 'perfiles' (Supabase suele hacerlo con Triggers,
    // pero si no tienes el Trigger, lo hacemos manual aquí)
    final perfilMap = {
      'id': authRes.user!.id,
      'nombre': nombre,
      'email': email,
      'rol': 'cliente', // Por defecto
      'activo': true,
      'fecha_creacion': DateTime.now().toIso8601String(),
    };

    final profileRes = await supabase
        .from('perfiles')
        .insert(perfilMap)
        .select()
        .single();
    return Perfil.fromJson(profileRes);
  }
}
