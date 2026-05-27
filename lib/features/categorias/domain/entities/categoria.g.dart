// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Categoria _$CategoriaFromJson(Map<String, dynamic> json) => _Categoria(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  descripcion: json['descripcion'] as String?,
  imagenUrl: json['imagenUrl'] as String?,
  activa: json['activa'] as bool,
  categoriaPadreId: json['categoriaPadreId'] as String?,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
);

Map<String, dynamic> _$CategoriaToJson(_Categoria instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'descripcion': instance.descripcion,
      'imagenUrl': instance.imagenUrl,
      'activa': instance.activa,
      'categoriaPadreId': instance.categoriaPadreId,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
