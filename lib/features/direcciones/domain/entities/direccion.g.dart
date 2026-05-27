// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Direccion _$DireccionFromJson(Map<String, dynamic> json) => _Direccion(
  id: json['id'] as String,
  usuarioId: json['usuarioId'] as String,
  alias: json['alias'] as String,
  calle: json['calle'] as String,
  numExt: json['numExt'] as String,
  numInt: json['numInt'] as String?,
  colonia: json['colonia'] as String,
  codigoPostal: json['codigoPostal'] as String,
  municipio: json['municipio'] as String,
  estado: json['estado'] as String,
  pais: json['pais'] as String,
  referencias: json['referencias'] as String?,
  esPrincipal: json['esPrincipal'] as bool? ?? false,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
);

Map<String, dynamic> _$DireccionToJson(_Direccion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuarioId': instance.usuarioId,
      'alias': instance.alias,
      'calle': instance.calle,
      'numExt': instance.numExt,
      'numInt': instance.numInt,
      'colonia': instance.colonia,
      'codigoPostal': instance.codigoPostal,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'pais': instance.pais,
      'referencias': instance.referencias,
      'esPrincipal': instance.esPrincipal,
      'fechaCreacion': instance.fechaCreacion.toIso8601String(),
    };
