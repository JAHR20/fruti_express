// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pedido _$PedidoFromJson(Map<String, dynamic> json) => _Pedido(
  id: json['id'] as String,
  clienteId: json['clienteId'] as String,
  sucursalId: json['sucursalId'] as String,
  repartidorId: json['repartidorId'] as String?,
  clienteNombreSnapshot: json['clienteNombreSnapshot'] as String,
  clienteTelefonoSnapshot: json['clienteTelefonoSnapshot'] as String,
  direccionSnapshot: json['direccionSnapshot'] as String,
  subtotal: (json['subtotal'] as num).toInt(),
  costoEnvio: (json['costoEnvio'] as num).toInt(),
  descuentosAplicados: (json['descuentosAplicados'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  estado: $enumDecode(_$EstadoPedidoEnumMap, json['estado']),
  urlEvidenciaEntrega: json['urlEvidenciaEntrega'] as String?,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
  fechaEntregaEstimada: json['fechaEntregaEstimada'] == null
      ? null
      : DateTime.parse(json['fechaEntregaEstimada'] as String),
  fechaEntrega: json['fechaEntrega'] == null
      ? null
      : DateTime.parse(json['fechaEntrega'] as String),
  items: (json['items'] as List<dynamic>)
      .map((e) => PedidoItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PedidoToJson(_Pedido instance) => <String, dynamic>{
  'id': instance.id,
  'clienteId': instance.clienteId,
  'sucursalId': instance.sucursalId,
  'repartidorId': instance.repartidorId,
  'clienteNombreSnapshot': instance.clienteNombreSnapshot,
  'clienteTelefonoSnapshot': instance.clienteTelefonoSnapshot,
  'direccionSnapshot': instance.direccionSnapshot,
  'subtotal': instance.subtotal,
  'costoEnvio': instance.costoEnvio,
  'descuentosAplicados': instance.descuentosAplicados,
  'total': instance.total,
  'estado': _$EstadoPedidoEnumMap[instance.estado]!,
  'urlEvidenciaEntrega': instance.urlEvidenciaEntrega,
  'fechaCreacion': instance.fechaCreacion.toIso8601String(),
  'fechaEntregaEstimada': instance.fechaEntregaEstimada?.toIso8601String(),
  'fechaEntrega': instance.fechaEntrega?.toIso8601String(),
  'items': instance.items,
};

const _$EstadoPedidoEnumMap = {
  EstadoPedido.pendiente: 'pendiente',
  EstadoPedido.enPreparacion: 'enPreparacion',
  EstadoPedido.enCamino: 'enCamino',
  EstadoPedido.entregado: 'entregado',
  EstadoPedido.cancelado: 'cancelado',
  EstadoPedido.confirmado: 'confirmado',
};
