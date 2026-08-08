import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/estrategia_envio.dart';

part 'configuracion_envio.freezed.dart';

@freezed
abstract class ConfiguracionEnvio with _$ConfiguracionEnvio {
  const factory ConfiguracionEnvio({
    required String id,
    required String sucursalId,
    required EstrategiaEnvio estrategia,
    required double radioMaximoKm,
    @Default([]) List<String> codigosPostalesPermitidos,
    @Default(false) bool requerirValidacionCP,
    final double? montoMinimoEnvioGratis,
    @Default(true) bool activa,
    required DateTime fechaCreacion,
  }) = _ConfiguracionEnvio;
}
