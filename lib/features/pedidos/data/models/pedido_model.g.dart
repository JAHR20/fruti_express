// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PedidoModel _$PedidoModelFromJson(Map<String, dynamic> json) => _PedidoModel(
  id: json['id'] as String,
  clienteId: json['cliente_id'] as String,
  sucursalId: json['sucursal_id'] as String,
  repartidorId: json['repartidor_id'] as String?,
  clienteNombreSnapshot: json['cliente_nombre_snapshot'] as String,
  clienteTelefonoSnapshot: json['cliente_telefono_snapshot'] as String,
  direccionSnapshot: json['direccion_snapshot'] as String,
  subtotal: (json['subtotal'] as num).toInt(),
  costoEnvio: (json['costo_envio'] as num).toInt(),
  descuentosAplicados: (json['descuentos_aplicados'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  estado: $enumDecode(_$EstadoPedidoEnumMap, json['estado']),
  urlEvidenciaEntrega: json['url_evidencia_entrega'] as String?,
  fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
  modoEntrega: $enumDecode(_$ModoEntregaEnumMap, json['modo_entrega']),
  fechaEntregaEstimada: json['fecha_entrega_estimada'] == null
      ? null
      : DateTime.parse(json['fecha_entrega_estimada'] as String),
  fechaEntrega: json['fecha_entrega'] == null
      ? null
      : DateTime.parse(json['fecha_entrega'] as String),
  idempotencyKey: json['idempotency_key'] as String?,
  items:
      (json['detalles_pedido'] as List<dynamic>?)
          ?.map((e) => PedidoItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PedidoModelToJson(
  _PedidoModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'cliente_id': instance.clienteId,
  'sucursal_id': instance.sucursalId,
  'repartidor_id': instance.repartidorId,
  'cliente_nombre_snapshot': instance.clienteNombreSnapshot,
  'cliente_telefono_snapshot': instance.clienteTelefonoSnapshot,
  'direccion_snapshot': instance.direccionSnapshot,
  'subtotal': instance.subtotal,
  'costo_envio': instance.costoEnvio,
  'descuentos_aplicados': instance.descuentosAplicados,
  'total': instance.total,
  'estado': _$EstadoPedidoEnumMap[instance.estado]!,
  'url_evidencia_entrega': instance.urlEvidenciaEntrega,
  'fecha_creacion': instance.fechaCreacion.toIso8601String(),
  'modo_entrega': _$ModoEntregaEnumMap[instance.modoEntrega]!,
  'fecha_entrega_estimada': instance.fechaEntregaEstimada?.toIso8601String(),
  'fecha_entrega': instance.fechaEntrega?.toIso8601String(),
  'idempotency_key': instance.idempotencyKey,
  'detalles_pedido': instance.items,
};

const _$EstadoPedidoEnumMap = {
  EstadoPedido.pagoPendiente: 'pagoPendiente',
  EstadoPedido.confirmado: 'confirmado',
  EstadoPedido.enPreparacion: 'enPreparacion',
  EstadoPedido.enCamino: 'enCamino',
  EstadoPedido.entregado: 'entregado',
  EstadoPedido.cancelado: 'cancelado',
};

const _$ModoEntregaEnumMap = {
  ModoEntrega.aDomicilio: 'aDomicilio',
  ModoEntrega.pickUp: 'pickUp',
};
