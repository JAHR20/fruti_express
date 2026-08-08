import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
part 'pedidos_encargado_state.freezed.dart';

@freezed
abstract class PedidosEncargadoState with _$PedidosEncargadoState {
  const factory PedidosEncargadoState.inicial() = _Inicial;
  const factory PedidosEncargadoState.cargando() = _Cargando;
  const factory PedidosEncargadoState.cargado(List<Pedido> pedidos) = _Cargado;
  const factory PedidosEncargadoState.error(String mensaje) = _Error;

  /// Estado de acción puntual (asignar, cambiar estado) sin perder la lista
  const factory PedidosEncargadoState.accionando({
    required List<Pedido> pedidos,
    required String pedidoId, // qué pedido está en proceso
  }) = _Accionando;
}
