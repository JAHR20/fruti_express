import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';

part 'pedido_state.freezed.dart';

@freezed
class PedidoState with _$PedidoState {
  const PedidoState._();

  /// Estado inicial antes de realizar cualquier acción
  const factory PedidoState.initial() = _Initial;
  
  /// Mientras la base de datos procesa la transacción RPC para guardar el pedido y sus ítems
  const factory PedidoState.procesando() = _Procesando; 
  
  /// El pedido se guardó con éxito en Supabase con estado 'pendiente_pago'.
  /// Este estado le indica a la vista que debe abrir el simulador de pago.
  const factory PedidoState.esperandoPago(Pedido pedido) = _EsperandoPago; 
  
  /// Mientras se actualiza el estado del pedido a 'confirmado' en el servidor
  const factory PedidoState.confirmandoPago() = _ConfirmandoPago; 
  
  /// ¡Todo el flujo fue exitoso! El pedido está pagado y listo para surtirse.
  const factory PedidoState.completado(Pedido pedido) = _Completado; 
  
  /// Si ocurre algún error en la red o en la base de datos
  const factory PedidoState.error(String mensaje) = _Error;
}