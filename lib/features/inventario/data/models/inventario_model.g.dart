// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventarioModel _$InventarioModelFromJson(Map<String, dynamic> json) =>
    _InventarioModel(
      productoId: json['producto_id'] as String,
      sucursalId: json['sucursal_id'] as String,
      stockDisponible: (json['stock_disponible'] as num).toInt(),
      stockReservado: (json['stock_reservado'] as num).toInt(),
      precioLocal: (json['precio_local'] as num?)?.toInt(),
      fechaActualizacion: DateTime.parse(json['fecha_actualizacion'] as String),
    );

Map<String, dynamic> _$InventarioModelToJson(_InventarioModel instance) =>
    <String, dynamic>{
      'producto_id': instance.productoId,
      'sucursal_id': instance.sucursalId,
      'stock_disponible': instance.stockDisponible,
      'stock_reservado': instance.stockReservado,
      'precio_local': instance.precioLocal,
      'fecha_actualizacion': instance.fechaActualizacion.toIso8601String(),
    };
