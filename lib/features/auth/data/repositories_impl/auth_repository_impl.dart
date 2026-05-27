import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth.repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl
    with SupabaseHandleException
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<Perfil> login(String email, String password) =>
      TaskEither.tryCatch(
        () async => await remoteDataSource.login(email, password),
        handleException,
      );

  @override
  ResultTask<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
  }) => TaskEither.tryCatch(
    () async => await remoteDataSource.registro(
      email: email,
      password: password,
      nombre: nombre,
    ),
    handleException,
  );

  @override
  ResultTask<Perfil?> obtenerUsuarioActual() => TaskEither.tryCatch(
    () async => await remoteDataSource.obtenerUsuarioActual(),
    handleException,
  );

  @override
  ResultTask<void> logout() => TaskEither.tryCatch(
    () async => await remoteDataSource.logout(),
    handleException,
  );
}
