import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  @override
  ResultTask<Unit> deleteAccount() => TaskEither.tryCatch(() async {
    await remoteDataSource.deleteAccount();
    return unit;
  }, _handleDeleteAccountError);
  Failure _handleDeleteAccountError(Object error, StackTrace stackTrace) {
    if (error is FunctionException) {
      return switch (error.status) {
        409 => const Failure.validation(FailureCode.accountHasPendingOrders),
        401 => const Failure.unauthorized(FailureCode.accessDenied),
        403 => const Failure.unauthorized(FailureCode.permissionDenied),
        _ => const Failure.server(FailureCode.accountDeletionFailed),
      };
    }
    return handleException(error, stackTrace);
  }
}
