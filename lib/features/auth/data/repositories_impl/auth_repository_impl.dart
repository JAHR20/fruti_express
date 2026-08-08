import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';
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
        () async {
          final model = await remoteDataSource.login(email, password);
          return model.toDomain();
        },
        handleException,
      );

  @override
  ResultTask<Perfil> registro({
    required String email,
    required String password,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String telefono,
  }) => TaskEither.tryCatch(
    () async {
      final model = await remoteDataSource.registro(
        email: email,
        password: password,
        nombre: nombre,
        apellidoPaterno: apellidoPaterno,
        apellidoMaterno: apellidoMaterno,
        alias: alias,
        telefono: telefono,
      );
      return model.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Perfil?> obtenerUsuarioActual() => TaskEither.tryCatch(
    () async {
      final model = await remoteDataSource.obtenerUsuarioActual();
      return model?.toDomain(); // ← nullable con ?.
    },
    handleException,
  );

  @override
  ResultTask<void> logout() => TaskEither.tryCatch(
    () async => remoteDataSource.logout(),
    handleException,
  );
}