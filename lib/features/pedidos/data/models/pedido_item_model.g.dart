// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PedidoItemModel _$PedidoItemModelFromJson(Map<String, dynamic> json) =>
    _PedidoItemModel(
      id: json['id'] as String,
      pedidoId: json['pedido_id'] as String,
      productoId: json['producto_id'] as String,
      nombreProductoSnapshot: json['nombre_producto_snapshot'] as String,
      cantidad: (json['cantidad'] as num).toInt(),
      precioUnitarioSnapshot: (json['precio_unitario_snapshot'] as num).toInt(),
      unidadMedida: const UnidadMedidaConverter().fromJson(
        json['unidad_medida'] as String?,
      ),
    );

Map<String, dynamic> _$PedidoItemModelToJson(
  _PedidoItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'pedido_id': instance.pedidoId,
  'producto_id': instance.productoId,
  'nombre_producto_snapshot': instance.nombreProductoSnapshot,
  'cantidad': instance.cantidad,
  'precio_unitario_snapshot': instance.precioUnitarioSnapshot,
  'unidad_medida': const UnidadMedidaConverter().toJson(instance.unidadMedida),
};
