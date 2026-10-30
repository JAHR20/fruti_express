import 'package:flutter/foundation.dart';
import 'package:fruti_express_jahr_admin/core/logging/app_logger.dart';

class ConsoleLogger implements AppLogger {
  @override
  void error(String message, {Object? error, StackTrace? stackTrace}) {
    // Por ahora, consola. Cuando integres Crashlytics/Sentry,
    // solo reemplazas el contenido de este método, nada más cambia.
    debugPrint('[ERROR] $message ${error ?? ''}');
  }
}