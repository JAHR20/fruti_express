// test/features/auth/data/repositories_impl/auth_repository_delete_account_test.dart
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Datasource falso: solo implementa deleteAccount y siempre falla con [error].
class _FailingDataSource implements AuthRemoteDataSource {
  _FailingDataSource(this.error);

  final Object error;

  @override
  Future<void> deleteAccount() async => throw error;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

/// Datasource falso que termina bien.
class _OkDataSource implements AuthRemoteDataSource {
  @override
  Future<void> deleteAccount() async {}

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<Failure?> _failureFor(Object error) async {
  final repository = AuthRepositoryImpl(_FailingDataSource(error));
  final result = await repository.deleteAccount().run();
  return result.fold((failure) => failure, (_) => null);
}

void main() {
  group('AuthRepositoryImpl.deleteAccount', () {
    test('si el servidor lo permite, termina bien', () async {
      final repository = AuthRepositoryImpl(_OkDataSource());

      final result = await repository.deleteAccount().run();

      expect(result.isRight(), isTrue);
    });

    test('409 (pedidos en curso) se traduce a un mensaje propio', () async {
      final failure = await _failureFor(FunctionException(status: 409));

      expect(
        failure,
        const Failure.validation(FailureCode.accountHasPendingOrders),
      );
    });

    test('401 se traduce a acceso denegado', () async {
      final failure = await _failureFor(FunctionException(status: 401));

      expect(failure, const Failure.unauthorized(FailureCode.accessDenied));
    });

    test('403 (cuenta de personal) se traduce a permiso denegado', () async {
      final failure = await _failureFor(FunctionException(status: 403));

      expect(failure, const Failure.unauthorized(FailureCode.permissionDenied));
    });

    test('cualquier otro error del servidor es un fallo al eliminar', () async {
      final failure = await _failureFor(FunctionException(status: 500));

      expect(failure, const Failure.server(FailureCode.accountDeletionFailed));
    });

    test('un error que no es de la función usa el manejador general', () async {
      final failure = await _failureFor(const SocketException('sin red'));

      expect(
        failure,
        const Failure.server(FailureCode.networkConnectionFailed),
      );
    });
  });
}