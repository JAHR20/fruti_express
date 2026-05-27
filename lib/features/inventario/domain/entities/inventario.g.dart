// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Inventario _$InventarioFromJson(Map<String, dynamic> json) => _Inventario(
  id: json['id'] as String,
  productoId: json['productoId'] as String,
  sucursalId: json['sucursalId'] as String,
  cantidadDisponible: (json['cantidadDisponible'] as num).toInt(),
  cantidadReservada: (json['cantidadReservada'] as num).toInt(),
  ultimaActualizacion: DateTime.parse(json['ultimaActualizacion'] as String),
);

Map<String, dynamic> _$InventarioToJson(_Inventario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productoId': instance.productoId,
      'sucursalId': instance.sucursalId,
      'cantidadDisponible': instance.cantidadDisponible,
      'cantidadReservada': instance.cantidadReservada,
      'ultimaActualizacion': instance.ultimaActualizacion.toIso8601String(),
    };
