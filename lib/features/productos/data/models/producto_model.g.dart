// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductoModel _$ProductoModelFromJson(Map<String, dynamic> json) =>
    _ProductoModel(
      id: json['id'] as String?,
      categoriaId: json['categoria_id'] as String,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String?,
      precioActual: (json['precio_actual'] as num).toInt(),
      precioComparacion: (json['precio_comparacion'] as num?)?.toInt(),
      unidadMedida: $enumDecode(_$UnidadMedidaEnumMap, json['unidad_medida']),
      imagenUrl: json['imagen_url'] as String?,
      isActive: json['is_active'] as bool,
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      stock: (_leerStock(json, 'stock') as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductoModelToJson(_ProductoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoria_id': instance.categoriaId,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'precio_actual': instance.precioActual,
      'precio_comparacion': instance.precioComparacion,
      'unidad_medida': _$UnidadMedidaEnumMap[instance.unidadMedida]!,
      'imagen_url': instance.imagenUrl,
      'is_active': instance.isActive,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$UnidadMedidaEnumMap = {
  UnidadMedida.pieza: 'pieza',
  UnidadMedida.gramo: 'gramo',
  UnidadMedida.mililitro: 'mililitro',
  UnidadMedida.mazo: 'mazo',
};
