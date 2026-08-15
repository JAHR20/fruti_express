import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';

part 'envio_admin_state.freezed.dart';

@freezed
abstract class EnvioAdminState with _$EnvioAdminState {
  const factory EnvioAdminState({
    @Default(false) bool isLoading,
    ConfiguracionEnvio? configuracion,
    @Default(<TarifaEnvio>[]) List<TarifaEnvio> tarifas,
    @Default(5.0) double radioTemporalKm,
    @Default(false) bool requiereCPTemporal,
    double? montoGratisTemporal,
    String? error,
    String? mensajeExito,
    String? tarifaProcesandoId,
  }) = _EnvioAdminState;
}
