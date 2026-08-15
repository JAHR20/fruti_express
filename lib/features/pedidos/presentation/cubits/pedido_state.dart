import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

part 'pedido_state.freezed.dart';

@freezed
class PedidoState with _$PedidoState {
  const PedidoState._();
  const factory PedidoState.initial() = _Initial;
  const factory PedidoState.procesando() = _Procesando; 
  const factory PedidoState.esperandoPago(Pedido pedido) = _EsperandoPago; 
  const factory PedidoState.confirmandoPago() = _ConfirmandoPago; 
  const factory PedidoState.completado(Pedido pedido) = _Completado; 
  const factory PedidoState.error(String mensaje) = _Error;
}