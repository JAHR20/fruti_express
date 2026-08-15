import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';

part 'wizard_sucursal_state.freezed.dart';

@freezed
abstract class WizardSucursalState with _$WizardSucursalState {
  const factory WizardSucursalState({
    @Default(0) int pasoActual, 
    @Default('') String nombre,
    @Default('') String calle,
    @Default('') String numeroExterior,
    @Default('') String codigoPostal,
    String? colonia,
    String? estado,
    String? municipio,
    double? latitud,
    double? longitud,

    @Default(<String>[]) List<String> codigosDisponibles,
    @Default(<String>[]) List<String> codigosSeleccionados,
    @Default(<String, List<String>>{}) Map<String, List<String>> coloniasPorCp,

    ConfiguracionEnvio? configuracionEnvio,

    @Default(false) bool buscandoUbicacion,
    @Default(false) bool guardando,
    @Default(false) bool cargandoConfiguracion,
    String? errorMessage,
    @Default(false) bool guardadoExitoso,
    @Default(false) bool paso1Completado,
    String? sucursalIdCreada,
  }) = _WizardSucursalState;
}