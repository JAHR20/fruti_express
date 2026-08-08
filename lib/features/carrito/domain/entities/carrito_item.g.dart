// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrito_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarritoItem _$CarritoItemFromJson(Map<String, dynamic> json) => _CarritoItem(
  productoId: json['productoId'] as String,
  nombre: json['nombre'] as String,
  imagenUrl: json['imagenUrl'] as String?,
  precioUnitario: (json['precioUnitario'] as num).toInt(),
  cantidad: (json['cantidad'] as num).toInt(),
  unidadMedida: $enumDecode(_$UnidadMedidaEnumMap, json['unidadMedida']),
  sucursalId: json['sucursalId'] as String,
);

Map<String, dynamic> _$CarritoItemToJson(_CarritoItem instance) =>
    <String, dynamic>{
      'productoId': instance.productoId,
      'nombre': instance.nombre,
      'imagenUrl': instance.imagenUrl,
      'precioUnitario': instance.precioUnitario,
      'cantidad': instance.cantidad,
      'unidadMedida': _$UnidadMedidaEnumMap[instance.unidadMedida]!,
      'sucursalId': instance.sucursalId,
    };

const _$UnidadMedidaEnumMap = {
  UnidadMedida.pieza: 'pieza',
  UnidadMedida.gramo: 'gramo',
  UnidadMedida.mililitro: 'mililitro',
  UnidadMedida.mazo: 'mazo',
};
