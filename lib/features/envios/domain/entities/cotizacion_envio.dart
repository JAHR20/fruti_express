import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/motivo_nod_isponible.dart';
part 'cotizacion_envio.freezed.dart';

@freezed
abstract class CotizacionEnvio with _$CotizacionEnvio {

  const factory CotizacionEnvio({
    required String sucursalId,
    required bool disponible,
    required double distanciaKm,
    required int costoEnvio,
    MotivoNoDisponible? motivo,
  }) = _CotizacionEnvio;
}
