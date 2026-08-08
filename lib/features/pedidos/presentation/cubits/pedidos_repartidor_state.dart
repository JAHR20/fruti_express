import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

part 'pedidos_repartidor_state.freezed.dart';

@freezed
abstract class PedidosRepartidorState with _$PedidosRepartidorState {
  const factory PedidosRepartidorState.inicial() = _Inicial;
  const factory PedidosRepartidorState.cargando() = _Cargando;
  const factory PedidosRepartidorState.cargado(List<Pedido> pedidos) = _Cargado;

  /// Error puntual — conserva la lista para no limpiar la UI
  const factory PedidosRepartidorState.errorConPedidos({
    required List<Pedido> pedidos,
    required String mensaje,
  }) = _ErrorConPedidos;

  /// Error fatal — sin pedidos (fallo de conexión, etc.)
  const factory PedidosRepartidorState.error(String mensaje) = _Error;

  const factory PedidosRepartidorState.accionando({
    required List<Pedido> pedidos,
    required String pedidoId,
  }) = _Accionando;
}