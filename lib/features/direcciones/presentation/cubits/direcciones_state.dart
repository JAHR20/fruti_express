import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

part 'direcciones_state.freezed.dart';

@freezed
class DireccionesState with _$DireccionesState {
  const DireccionesState._();

  const factory DireccionesState.initial() = _Initial;
  const factory DireccionesState.loading() = _Loading;
  const factory DireccionesState.loaded(List<Direccion> direcciones) = _Loaded;
  const factory DireccionesState.error(String mensaje) = _Error;
}