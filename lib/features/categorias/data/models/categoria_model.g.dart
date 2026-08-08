// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriaModel _$CategoriaModelFromJson(Map<String, dynamic> json) =>
    _CategoriaModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String?,
      imagenUrl: json['imagen_url'] as String?,
      activa: json['is_active'] as bool,
      categoriaPadreId: json['categoria_padre_id'] as String?,
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
      fechaActualizacion: json['fecha_actualizacion'] == null
          ? null
          : DateTime.parse(json['fecha_actualizacion'] as String),
    );

Map<String, dynamic> _$CategoriaModelToJson(_CategoriaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'imagen_url': instance.imagenUrl,
      'is_active': instance.activa,
      'categoria_padre_id': instance.categoriaPadreId,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
      'fecha_actualizacion': instance.fechaActualizacion?.toIso8601String(),
    };
