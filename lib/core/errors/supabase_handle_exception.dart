import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';

mixin SupabaseHandleException {
  Failure handleException(Object error, StackTrace stackTrace) {
    if (error is AuthException) {
      return switch (error.message) {
        'Invalid login credentials' => const Failure.unauthorized(
          'Correo o contraseña incorrectos. Por favor, verifica tus datos.',
        ),
        'User already registered' => const Failure.alreadyExists(
          'Este correo ya está registrado en Fruti Express.',
        ),
        'Password should be at least 6 characters' => const Failure.validation(
          'La contraseña debe tener al menos 6 caracteres.',
        ),
        _ => Failure.server('Error de autenticación: ${error.message}'),
      };
    }

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
        'P0001' => _parsearErrorRpc(error.message),
        _ => Failure.server(
          "Error de base de datos (${error.code}): ${error.message}",
        ),
      };
    }

    if (error is SocketException ||
        error.toString().contains('SocketException')) {
      return const Failure.network(); 
    }

    return Failure.server("Error inesperado: $error");
  }
}

Failure _parsearErrorRpc(String message) {
  final msg = message.toLowerCase();

  if (msg.contains('código') || msg.contains('codigo')) {
    return const Failure.invalidState(
      'Código incorrecto. Verifica con el cliente e intenta de nuevo.',
    );
  }
  if (msg.contains('no está en camino') || msg.contains('no esta en camino')) {
    return const Failure.invalidState('Este pedido ya no está en camino.');
  }
  if (msg.contains('no encontrado')) {
    return const Failure.notFound(
      'Pedido no encontrado. Contacta al encargado.',
    );
  }
  return const Failure.server(
    'Ocurrió un error. Intenta de nuevo o contacta al encargado.',
  );
}
