// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PerfilModel _$PerfilModelFromJson(Map<String, dynamic> json) => _PerfilModel(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  apellidoPaterno: json['apellido_paterno'] as String,
  apellidoMaterno: json['apellido_materno'] as String?,
  alias: json['alias'] as String?,
  email: json['email'] as String,
  activo: json['activo'] as bool,
  telefono: json['telefono'] as String?,
  rol: $enumDecode(_$TipoUsuarioEnumMap, json['rol']),
  sucursalId: json['sucursal_id'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  fechaCreacion: DateTime.parse(json['fecha_creacion'] as String),
);

Map<String, dynamic> _$PerfilModelToJson(_PerfilModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'apellido_paterno': instance.apellidoPaterno,
      'apellido_materno': instance.apellidoMaterno,
      'alias': instance.alias,
      'email': instance.email,
      'activo': instance.activo,
      'telefono': instance.telefono,
      'rol': _$TipoUsuarioEnumMap[instance.rol]!,
      'sucursal_id': instance.sucursalId,
      'avatar_url': instance.avatarUrl,
      'fecha_creacion': instance.fechaCreacion.toIso8601String(),
    };

const _$TipoUsuarioEnumMap = {
  TipoUsuario.admin: 'admin',
  TipoUsuario.encargado: 'encargado',
  TipoUsuario.repartidor: 'repartidor',
  TipoUsuario.cliente: 'cliente',
};
