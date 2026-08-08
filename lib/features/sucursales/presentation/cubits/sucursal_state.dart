import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

part 'sucursal_state.freezed.dart';

@freezed
class SucursalState with _$SucursalState {
  const factory SucursalState.initial() = SucursalInitial;
  const factory SucursalState.loading() = SucursalLoading;
  const factory SucursalState.loaded(List<Sucursal> sucursales) = SucursalLoaded;
  const factory SucursalState.error(String message) = SucursalError;
}