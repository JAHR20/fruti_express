import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import '../enums/estado_pedido.dart';
import 'pedido_item.dart';

part 'pedido.freezed.dart';

@freezed
abstract class Pedido with _$Pedido {
  const factory Pedido({
    required String id,
    required String clienteId,
    required String sucursalId,
    String? repartidorId,
    required String clienteNombreSnapshot,
    required String clienteTelefonoSnapshot,
    required String direccionSnapshot,
    required int subtotal,
    required int costoEnvio,
    required int descuentosAplicados,
    required int total,
    required EstadoPedido estado,
    String? urlEvidenciaEntrega,
    required DateTime fechaCreacion,
    required ModoEntrega modoEntrega,
    DateTime? fechaEntregaEstimada,
    DateTime? fechaEntrega,
    String? idempotencyKey,
    String? codigoConfirmacion,
    required List<PedidoItem> items,
  }) = _Pedido;
}