// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Producto _$ProductoFromJson(Map<String, dynamic> json) => _Producto(
  id: json['id'] as String?,
  categoriaId: json['categoriaId'] as String,
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  precioActual: (json['precioActual'] as num).toInt(),
  precioComparacion: (json['precioComparacion'] as num?)?.toInt(),
  unidadMedida: $enumDecode(_$UnidadMedidaEnumMap, json['unidadMedida']),
  imagenUrl: json['imagenUrl'] as String?,
  isActive: json['isActive'] as bool,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
);

Map<String, dynamic> _$ProductoToJson(_Producto instance) => <String, dynamic>{
  'id': instance.id,
  'categoriaId': instance.categoriaId,
  'nombre': instance.nombre,
  'descripcion': instance.descripcion,
  'precioActual': instance.precioActual,
  'precioComparacion': instance.precioComparacion,
  'unidadMedida': _$UnidadMedidaEnumMap[instance.unidadMedida]!,
  'imagenUrl': instance.imagenUrl,
  'isActive': instance.isActive,
  'fechaCreacion': instance.fechaCreacion.toIso8601String(),
};

const _$UnidadMedidaEnumMap = {
  UnidadMedida.pieza: 'pieza',
  UnidadMedida.gramo: 'gramo',
  UnidadMedida.mililitro: 'mililitro',
  UnidadMedida.mazo: 'mazo',
};
