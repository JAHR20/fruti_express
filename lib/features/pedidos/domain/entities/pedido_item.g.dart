// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PedidoItem _$PedidoItemFromJson(Map<String, dynamic> json) => _PedidoItem(
  id: json['id'] as String,
  pedidoId: json['pedidoId'] as String,
  productoId: json['productoId'] as String,
  nombreProductoSnapshot: json['nombreProductoSnapshot'] as String,
  cantidad: (json['cantidad'] as num).toInt(),
  precioUnitarioSnapshot: (json['precioUnitarioSnapshot'] as num).toInt(),
);

Map<String, dynamic> _$PedidoItemToJson(_PedidoItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pedidoId': instance.pedidoId,
      'productoId': instance.productoId,
      'nombreProductoSnapshot': instance.nombreProductoSnapshot,
      'cantidad': instance.cantidad,
      'precioUnitarioSnapshot': instance.precioUnitarioSnapshot,
    };
