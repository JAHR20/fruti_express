import 'package:freezed_annotation/freezed_annotation.dart';

part 'tarifa_envio.freezed.dart';

@freezed
abstract class TarifaEnvio with _$TarifaEnvio {
  const factory TarifaEnvio({
    required String id,
    required String sucursalId,
    required String nombre,
    required double distanciaMinKm,   
    required double distanciaMaxKm,
    required int costo,               
    required bool activa,
    required DateTime fechaCreacion,
  }) = _TarifaEnvio;
}