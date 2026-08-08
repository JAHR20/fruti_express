// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sucursal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SucursalModel _$SucursalModelFromJson(Map<String, dynamic> json) =>
    _SucursalModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      calle: json['calle'] as String,
      numeroExterior: json['numero_exterior'] as String,
      codigoPostal: json['codigo_postal'] as String,
      colonia: json['colonia'] as String,
      municipio: json['municipio'] as String,
      estado: json['estado'] as String,
      latitud: (json['latitud'] as num?)?.toDouble(),
      longitud: (json['longitud'] as num?)?.toDouble(),
      activa: json['is_active'] as bool,
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
      fechaActualizacion: json['fecha_actualizacion'] == null
          ? null
          : DateTime.parse(json['fecha_actualizacion'] as String),
    );

Map<String, dynamic> _$SucursalModelToJson(_SucursalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'calle': instance.calle,
      'numero_exterior': instance.numeroExterior,
      'codigo_postal': instance.codigoPostal,
      'colonia': instance.colonia,
      'municipio': instance.municipio,
      'estado': instance.estado,
      'latitud': instance.latitud,
      'longitud': instance.longitud,
      'is_active': instance.activa,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
      'fecha_actualizacion': instance.fechaActualizacion?.toIso8601String(),
    };
