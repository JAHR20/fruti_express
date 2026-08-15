import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

part 'pedidos_cliente_state.freezed.dart';

@freezed
abstract class PedidosClienteState with _$PedidosClienteState {
  const factory PedidosClienteState.inicial() = _Inicial;
  const factory PedidosClienteState.cargando() = _Cargando;
  const factory PedidosClienteState.cargado(List<Pedido> pedidos) = _Cargado;
  const factory PedidosClienteState.error(String mensaje) = _Error;
}