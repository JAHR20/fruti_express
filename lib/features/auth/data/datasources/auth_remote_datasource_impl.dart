import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;
  
  static const String _tableName = 'profiles';
  static const String _colId = 'id';

  AuthRemoteDataSourceImpl(this.supabase);

  @override
  Future<ProfileModel> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Error de autenticación");

    return await _fetchProfileFromDatabase(response.user!.id);
  }

  @override
  Future<ProfileModel?> getCurrentUser() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;
    
    return await _fetchProfileFromDatabase(session.user.id);
  }

  Future<ProfileModel> _fetchProfileFromDatabase(String id) async {
    final data = await supabase.from(_tableName).select().eq(_colId, id).single();

    return ProfileModel.fromJson(data);
  }

  @override
  Future<void> logout() async => await supabase.auth.signOut();

  @override
  Future<ProfileModel> register({
    required String email,
    required String password,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    required String phone,
  }) async {
    final authRes = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'first_name': firstName,
        'last_name': paternalLastName,
        'maternal_last_name': maternalLastName ?? '',
        'alias': alias ?? '',
        'phone': phone,
      },
    );

    if (authRes.user == null) throw Exception("Error al crear cuenta");

    return await _fetchProfileFromDatabase(authRes.user!.id);
  }
}