import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

part 'coordinador_cliente_state.freezed.dart';

@freezed
abstract class CoordinadorClienteState with _$CoordinadorClienteState {
  const factory CoordinadorClienteState.idle() = _Idle;
  const factory CoordinadorClienteState.procesando() = _Procesando;
  const factory CoordinadorClienteState.cambioExitoso(Sucursal nuevaSucursal, bool fueAutomatico) = _CambioExitoso;
  const factory CoordinadorClienteState.sinCobertura(Direccion direccion) = _SinCobertura;
}