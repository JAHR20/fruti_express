
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
part 'repartidores_state.freezed.dart';

@freezed
abstract class RepartidoresState with _$RepartidoresState {
  const factory RepartidoresState.inicial() = _Inicial;
  const factory RepartidoresState.cargando() = _Cargando;
  const factory RepartidoresState.cargado(List<Perfil> repartidores) = _Cargado;
  const factory RepartidoresState.error(String mensaje) = _Error;
}