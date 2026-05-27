import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';

mixin SupabaseHandleException {
  Failure handleException(Object error, StackTrace stackTrace) {
    if (error is PostgrestException) {
      return switch (error.code) {
        '23505' => const Failure.alreadyExists(
          "El registro ya existe en la base de datos.",
        ),
        '42501' => const Failure.unauthorized(
          "No tienes permisos suficientes.",
        ),
        'PGRST116' => const Failure.notFound(
          "No se encontró el registro solicitado.",
        ),
        _ => Failure.server(
          "Error de base de datos (${error.code}): ${error.message}",
        ),
      };
    }
    return Failure.server("Error inesperado: $error");
  }
}
