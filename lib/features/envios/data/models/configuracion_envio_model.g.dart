// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracion_envio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfiguracionEnvioModel _$ConfiguracionEnvioModelFromJson(
  Map<String, dynamic> json,
) => _ConfiguracionEnvioModel(
  id: json['id'] as String,
  sucursalId: json['sucursal_id'] as String,
  estrategia: $enumDecode(_$EstrategiaEnvioEnumMap, json['estrategia']),
  radioMaximoKm: (json['radio_max_km'] as num).toDouble(),
  codigosPostalesPermitidos:
      (json['codigosPostalesPermitidos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  requerirValidacionCP: json['requerir_validacion_cp'] as bool? ?? false,
  montoMinimoEnvioGratis: (json['monto_minimo_envio_gratis'] as num?)
      ?.toDouble(),
  activa: json['activa'] as bool,
  fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
);

Map<String, dynamic> _$ConfiguracionEnvioModelToJson(
  _ConfiguracionEnvioModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sucursal_id': instance.sucursalId,
  'estrategia': _$EstrategiaEnvioEnumMap[instance.estrategia]!,
  'radio_max_km': instance.radioMaximoKm,
  'requerir_validacion_cp': instance.requerirValidacionCP,
  'monto_minimo_envio_gratis': instance.montoMinimoEnvioGratis,
  'activa': instance.activa,
  'fecha_creacion': instance.fechaCreacion.toIso8601String(),
};

const _$EstrategiaEnvioEnumMap = {
  EstrategiaEnvio.haversine: 'haversine',
  EstrategiaEnvio.codigoPostal: 'codigoPostal',
  EstrategiaEnvio.geocerca: 'geocerca',
  EstrategiaEnvio.hibrida: 'hibrida',
};
