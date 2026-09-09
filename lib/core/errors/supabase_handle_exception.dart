import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';

mixin SupabaseHandleException {
  Failure handleException(Object error, StackTrace stackTrace) {
    if (error is AuthException) {
      return switch (error.message) {
        'Invalid login credentials' => const Failure.unauthorized(
            FailureCode.invalidLoginCredentials,
          ),
        'User already registered' => const Failure.alreadyExists(
            FailureCode.userAlreadyRegistered,
          ),
        'Password should be at least 6 characters' => const Failure.validation(
            FailureCode.weakPassword,
          ),
        _ => Failure.server(
            FailureCode.authError,
            params: {'detail': error.message},
          ),
      };
    }

    if (error is PostgrestException) {
      return switch (error.code) {
        '23505' => const Failure.alreadyExists(
            FailureCode.databaseRecordExists,
          ),
        '42501' => const Failure.unauthorized(
            FailureCode.accessDenied,
          ),
        'PGRST116' => const Failure.server(
            FailureCode.databaseRecordNotFound,
          ),
        'P0001' => _parseRpcError(error.message),
        _ => Failure.server(
            FailureCode.databaseError,
            params: {'errorCode': error.code, 'errorMsg': error.message},
          ),
      };
    }

    if (error is SocketException ||
        error.toString().contains('SocketException')) {
      return const Failure.server(FailureCode.networkConnectionFailed);
    }

    return Failure.server(
      FailureCode.genericError,
      params: {'detail': error.toString()},
    );
  }

  Failure _parseRpcError(String message) {
    final msg = message.toLowerCase();

    if (msg.contains('código') || msg.contains('codigo')) {
      return const Failure.validation(FailureCode.incorrectDeliveryCode);
    }
    if (msg.contains('no está en camino') || msg.contains('no esta en camino')) {
      return const Failure.validation(FailureCode.orderNotInTransit);
    }
    if (msg.contains('no encontrado')) {
      return const Failure.server(FailureCode.orderNotFound);
    }
    return const Failure.server(FailureCode.genericError);
  }
}