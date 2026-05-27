import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/estado_pedido.dart';
import 'pedido_item.dart';

part 'pedido.freezed.dart';
part 'pedido.g.dart';

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
    DateTime? fechaEntregaEstimada,
    DateTime? fechaEntrega,

    required List<PedidoItem> items,
  }) = _Pedido;

  factory Pedido.fromJson(Map<String, dynamic> json) => _$PedidoFromJson(json);
}
