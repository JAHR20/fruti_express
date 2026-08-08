// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarifa_envio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TarifaEnvioModel _$TarifaEnvioModelFromJson(Map<String, dynamic> json) =>
    _TarifaEnvioModel(
      id: json['id'] as String,
      sucursalId: json['sucursal_id'] as String,
      nombre: json['nombre'] as String,
      distanciaMinKm: (json['distancia_min_km'] as num).toDouble(),
      distanciaMaxKm: (json['distancia_max_km'] as num).toDouble(),
      costo: (json['costo'] as num).toInt(),
      activa: json['activa'] as bool,
      fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
    );

Map<String, dynamic> _$TarifaEnvioModelToJson(_TarifaEnvioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sucursal_id': instance.sucursalId,
      'nombre': instance.nombre,
      'distancia_min_km': instance.distanciaMinKm,
      'distancia_max_km': instance.distanciaMaxKm,
      'costo': instance.costo,
      'activa': instance.activa,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
    };
