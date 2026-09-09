import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl
    with SupabaseHandleException
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<Profile> login(String email, String password) =>
      TaskEither.tryCatch(
        () async {
          final model = await remoteDataSource.login(email, password);
          return model.toDomain();
        },
        handleException,
      );

  @override
  ResultTask<Profile> register({
    required String email,
    required String password,
    required String firstName,
    required String paternalLastName,
    String? maternalLastName,
    String? alias,
    required String phone,
  }) => TaskEither.tryCatch(
    () async {
      final model = await remoteDataSource.register(
        email: email,
        password: password,
        firstName: firstName,
        paternalLastName: paternalLastName,
        maternalLastName: maternalLastName,
        alias: alias,
        phone: phone,
      );
      return model.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Profile?> getCurrentUser() => TaskEither.tryCatch(
    () async {
      final model = await remoteDataSource.getCurrentUser();
      return model?.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<void> logout() => TaskEither.tryCatch(
    () async => remoteDataSource.logout(),
    handleException,
  );
}