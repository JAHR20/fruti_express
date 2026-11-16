import 'package:flutter/services.dart';

class SecureScreen {
  static const _channel = MethodChannel('fruti_express/secure_screen');

  static Future<void> enable() => _set(true);
  static Future<void> disable() => _set(false);

  static Future<void> _set(bool secure) async {
    try {
      await _channel.invokeMethod('setSecure', secure);
    } on MissingPluginException {
      // iOS u otra plataforma sin implementación nativa.
    } on PlatformException {
      // Mejor esfuerzo: nunca debe romper el pago.
    }
  }
}