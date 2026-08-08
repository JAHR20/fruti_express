// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  descuento: json['descuento'] as String,
  subtitulo: json['subtitulo'] as String,
  colorInicio: json['color_inicio'] as String,
  colorFin: json['color_fin'] as String,
  imagenUrl: json['imagen_url'] as String?,
  activo: json['activo'] as bool,
  orden: (json['orden'] as num).toInt(),
  fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descuento': instance.descuento,
      'subtitulo': instance.subtitulo,
      'color_inicio': instance.colorInicio,
      'color_fin': instance.colorFin,
      'imagen_url': instance.imagenUrl,
      'activo': instance.activo,
      'orden': instance.orden,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
    };
