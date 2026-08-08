import 'package:freezed_annotation/freezed_annotation.dart';

part 'tarifa_envio.freezed.dart';

@freezed
abstract class TarifaEnvio with _$TarifaEnvio {
  const factory TarifaEnvio({
    required String id,
    required String sucursalId,
    required String nombre,           // "Zona Local", "Zona Centro"
    required double distanciaMinKm,   // desde (inclusive)
    required double distanciaMaxKm,   // hasta (inclusive)
    required int costo,               // en pesos enteros (0 = gratis)
    required bool activa,
    required DateTime fechaCreacion,
  }) = _TarifaEnvio;
}