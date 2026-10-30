import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl
    with SupabaseHandleException
    implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<AppUser> login(String email, String password) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.login(email, password);
        return model.toEntity();
      }, handleException);

  @override
  ResultTask<AppUser?> register({
    required String email,
    required String password,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDataSource.register(
      email: email,
      password: password,
    );
    return model?.toEntity();
  }, handleException);

  @override
  ResultTask<AppUser?> getCurrentUser() => TaskEither.tryCatch(() async {
    final model = await remoteDataSource.getCurrentUser();
    return model?.toEntity();
  }, handleException);

  @override
  ResultTask<void> logout() => TaskEither.tryCatch(
    () async => remoteDataSource.logout(),
    handleException,
  );

  @override
  Stream<AppUser?> get authStateChanges =>
      remoteDataSource.authStateChanges.map((model) => model?.toEntity());

  @override
  ResultTask<AppUser> signInWithGoogle() {
    return TaskEither.tryCatch(() async {
      final model = await remoteDataSource.signInWithGoogle();
      return model.toEntity();
    }, handleException);
  }
}
