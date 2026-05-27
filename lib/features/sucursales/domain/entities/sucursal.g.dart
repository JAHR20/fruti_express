// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sucursal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sucursal _$SucursalFromJson(Map<String, dynamic> json) => _Sucursal(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  direccion: json['direccion'] as String,
  activa: json['activa'] as bool,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
);

Map<String, dynamic> _$SucursalToJson(_Sucursal instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'direccion': instance.direccion,
  'activa': instance.activa,
  'fechaCreacion': instance.fechaCreacion.toIso8601String(),
};
