import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

part 'sucursal_state.freezed.dart';

@freezed
abstract class SucursalState with _$SucursalState {
  const factory SucursalState({
    @Default([]) List<Sucursal> sucursales,
    @Default(false) bool isLoading,
    String? errorMessage,
    String? sucursalProcesandoId, 
    @Default(<String>{}) Set<String> sucursalesConEnvioConfigurado,
  }) = _SucursalState;
}