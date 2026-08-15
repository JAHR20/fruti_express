import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';

part 'envio_cliente_state.freezed.dart';

@freezed
abstract class EnvioClienteState with _$EnvioClienteState {
  const factory EnvioClienteState({
    @Default(false) bool isLoading,
    @Default([]) List<ConfiguracionEnvio> configuraciones, 
    String? error,
  }) = _EnvioClienteState;
}