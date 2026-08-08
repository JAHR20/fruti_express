// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DireccionModel _$DireccionModelFromJson(Map<String, dynamic> json) =>
    _DireccionModel(
      id: json['id'] as String,
      usuarioId: json['usuario_id'] as String,
      alias: json['alias'] as String,
      calle: json['calle'] as String,
      numExt: json['num_ext'] as String,
      numInt: json['num_int'] as String?,
      colonia: json['colonia'] as String,
      codigoPostal: json['codigo_postal'] as String,
      municipio: json['municipio'] as String,
      estado: json['estado'] as String,
      referencias: json['referencias'] as String?,
      esPrincipal: json['es_principal'] as bool? ?? false,
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      latitud: (json['latitud'] as num).toDouble(),
      longitud: (json['longitud'] as num).toDouble(),
    );

Map<String, dynamic> _$DireccionModelToJson(_DireccionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario_id': instance.usuarioId,
      'alias': instance.alias,
      'calle': instance.calle,
      'num_ext': instance.numExt,
      'num_int': instance.numInt,
      'colonia': instance.colonia,
      'codigo_postal': instance.codigoPostal,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'referencias': instance.referencias,
      'es_principal': instance.esPrincipal,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
