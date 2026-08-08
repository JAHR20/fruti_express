import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_params.dart';
import '../../domain/entities/pedido.dart';
import '../../domain/enums/estado_pedido.dart';
import 'pedido_item_model.dart';

part 'pedido_model.freezed.dart';
part 'pedido_model.g.dart';

@freezed
abstract class PedidoModel with _$PedidoModel {
  const factory PedidoModel({
    required String id,
    @JsonKey(name: 'cliente_id') required String clienteId,
    @JsonKey(name: 'sucursal_id') required String sucursalId,
    @JsonKey(name: 'repartidor_id') String? repartidorId,
    @JsonKey(name: 'cliente_nombre_snapshot')
    required String clienteNombreSnapshot,
    @JsonKey(name: 'cliente_telefono_snapshot')
    required String clienteTelefonoSnapshot,
    @JsonKey(name: 'direccion_snapshot') required String direccionSnapshot,
    required int subtotal,
    @JsonKey(name: 'costo_envio') required int costoEnvio,
    @JsonKey(name: 'descuentos_aplicados') required int descuentosAplicados,
    required int total,
    required EstadoPedido estado,
    @JsonKey(name: 'url_evidencia_entrega') String? urlEvidenciaEntrega,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'modo_entrega') required ModoEntrega modoEntrega,
    @JsonKey(name: 'fecha_entrega_estimada') DateTime? fechaEntregaEstimada,
    @JsonKey(name: 'fecha_entrega') DateTime? fechaEntrega,
    @JsonKey(name: 'idempotency_key') String? idempotencyKey,
    @JsonKey(includeFromJson: false, includeToJson: false) // ← no viene de BD
    String? codigoConfirmacion,
    @JsonKey(name: 'detalles_pedido') @Default([]) List<PedidoItemModel> items,
  }) = _PedidoModel;

  factory PedidoModel.fromJson(Map<String, dynamic> json) =>
      _$PedidoModelFromJson(json);
}

extension PedidoModelX on PedidoModel {
  Pedido toDomain() => Pedido(
    id: id,
    clienteId: clienteId,
    sucursalId: sucursalId,
    repartidorId: repartidorId,
    clienteNombreSnapshot: clienteNombreSnapshot,
    clienteTelefonoSnapshot: clienteTelefonoSnapshot,
    direccionSnapshot: direccionSnapshot,
    subtotal: subtotal,
    costoEnvio: costoEnvio,
    descuentosAplicados: descuentosAplicados,
    total: total,
    estado: estado,
    urlEvidenciaEntrega: urlEvidenciaEntrega,
    fechaCreacion: fechaCreacion,
    modoEntrega: modoEntrega,
    fechaEntregaEstimada: fechaEntregaEstimada,
    fechaEntrega: fechaEntrega,
    codigoConfirmacion: codigoConfirmacion,
    items: items.map((i) => i.toDomain()).toList(),
  );

  static PedidoModel fromDomain(Pedido p) => PedidoModel(
    id: p.id,
    clienteId: p.clienteId,
    sucursalId: p.sucursalId,
    repartidorId: p.repartidorId,
    clienteNombreSnapshot: p.clienteNombreSnapshot,
    clienteTelefonoSnapshot: p.clienteTelefonoSnapshot,
    direccionSnapshot: p.direccionSnapshot,
    subtotal: p.subtotal,
    costoEnvio: p.costoEnvio,
    descuentosAplicados: p.descuentosAplicados,
    total: p.total,
    estado: p.estado,
    urlEvidenciaEntrega: p.urlEvidenciaEntrega,
    fechaCreacion: p.fechaCreacion,
    modoEntrega: p.modoEntrega,
    fechaEntregaEstimada: p.fechaEntregaEstimada,
    fechaEntrega: p.fechaEntrega,
    codigoConfirmacion: p.codigoConfirmacion,
    items: p.items.map((i) => PedidoItemModelX.fromDomain(i)).toList(),
  );

  static PedidoModel fromParams(CrearPedidoParams p) => PedidoModel(
    id: '', // ← la BD lo genera, no importa este valor
    clienteId: p.clienteId,
    sucursalId: p.sucursalId,
    clienteNombreSnapshot: p.clienteNombreSnapshot,
    clienteTelefonoSnapshot: p.clienteTelefonoSnapshot,
    direccionSnapshot: p.direccionSnapshot,
    subtotal: p.subtotal,
    costoEnvio: p.costoEnvio,
    descuentosAplicados: p.descuentosAplicados,
    total: p.total,
    estado: EstadoPedido.pagoPendiente,
    fechaCreacion: DateTime.now(),
    modoEntrega: p.modoEntrega,
    items: p.items
        .map(
          (i) => PedidoItemModel(
            id: '',
            pedidoId: '',
            productoId: i.productoId,
            nombreProductoSnapshot: i.nombreProductoSnapshot,
            cantidad: i.cantidad,
            precioUnitarioSnapshot: i.precioUnitarioSnapshot,
            unidadMedida: i.unidadMedida,
          ),
        )
        .toList(),
  );
}
