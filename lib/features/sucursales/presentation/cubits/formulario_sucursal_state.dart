import 'package:freezed_annotation/freezed_annotation.dart';

part 'formulario_sucursal_state.freezed.dart';

@freezed
abstract class FormularioSucursalState with _$FormularioSucursalState {
  const factory FormularioSucursalState({
    // ─── Estados de carga y error ───
    @Default(false) bool buscandoUbicacion,
    @Default(false) bool guardando,
    String? errorMessage,
    @Default(false) bool guardadoExitoso,

    // ─── Datos de autocompletado (Postali) ───
    String? sucursalIdCreada,
    String? colonia,
    String? estado,
    String? municipio,


    double? latitud,
    double? longitud,

    // ─── Listas de Cobertura ───
    @Default(<String>[]) List<String> codigosDisponibles,
    @Default(<String>[]) List<String> codigosSeleccionados,
    @Default(<String, List<String>>{}) Map<String, List<String>> coloniasPorCp,
  }) = _FormularioSucursalState;
}