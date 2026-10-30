import 'dart:async';
import 'dart:io';

import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/app_user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;
  bool _googleSignInInitialized = false;

  static const String _tableName = 'app_users';
  static const String _joinTableName = '*, user_profiles(*)';
  static const String _colId = 'id';

  AuthRemoteDataSourceImpl(this.supabase);

  Future<void> _ensureGoogleSignInInitialized() async {
    if (_googleSignInInitialized) return;

    await GoogleSignIn.instance.initialize(
      serverClientId: dotenv.get('GOOGLE_WEB_CLIENT_ID'),
      clientId: Platform.isIOS 
        ? dotenv.get('APPLE_GOOGLE_OAUTH') 
        : null,
    );
    _googleSignInInitialized = true;
  }

  @override
  Future<AppUserModel> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) throw Exception("Error de autenticación");

    return await _fetchProfileFromDatabase(response.user!.id);
  }

  @override
  Future<AppUserModel?> getCurrentUser() async {
    final session = supabase.auth.currentSession;
    if (session == null) return null;

    return await _fetchProfileFromDatabase(session.user.id);
  }

  Future<AppUserModel> _fetchProfileFromDatabase(String id) async {
    final data = await supabase
        .from(_tableName)
        .select(_joinTableName)
        .eq(_colId, id)
        .single();

    return AppUserModel.fromJson(data);
  }

  @override
  Future<void> logout() async => await supabase.auth.signOut();

  @override
  Future<AppUserModel?> register({
    required String email,
    required String password,
  }) async {
    final authRes = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    if (authRes.user == null) throw Exception("Error al crear cuenta");

    if (authRes.session == null) {
      return null;
    }

    return await _fetchProfileFromDatabase(authRes.user!.id);
  }

  @override
  Future<AppUserModel> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();

    final completer = Completer<GoogleSignInAccount>();
    late final StreamSubscription subscription;

    subscription = GoogleSignIn.instance.authenticationEvents.listen(
      (event) {
        if (event is GoogleSignInAuthenticationEventSignIn) {
          completer.complete(event.user);
        }
        subscription.cancel();
      },
      onError: (Object error) {
        completer.completeError(error);
        subscription.cancel();
      },
    );

    await GoogleSignIn.instance.authenticate();

    final googleUser = await completer.future;
    final googleAuth = googleUser.authentication;
    final idToken = googleAuth.idToken;

    if (idToken == null) {
      throw Exception('No se pudo obtener el token de Google');
    }

    final response = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
    );

    if (response.user == null) throw Exception('Error de autenticación con Google');

    return await _fetchProfileFromDatabase(response.user!.id);
  }

  @override
  Stream<AppUserModel?> get authStateChanges {
    return supabase.auth.onAuthStateChange.asyncMap((event) async {
      final session = event.session;
      if (session == null) return null;
      return await _fetchProfileFromDatabase(session.user.id);
    });
  }
}
