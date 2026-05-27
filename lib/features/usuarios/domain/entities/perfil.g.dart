// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Perfil _$PerfilFromJson(Map<String, dynamic> json) => _Perfil(
  id: json['id'] as String,
  nombre: json['nombre'] as String,
  email: json['email'] as String,
  activo: json['activo'] as bool,
  telefono: json['telefono'] as String?,
  rol: $enumDecode(_$TipoUsuarioEnumMap, json['rol']),
  sucursalId: json['sucursalId'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
);

Map<String, dynamic> _$PerfilToJson(_Perfil instance) => <String, dynamic>{
  'id': instance.id,
  'nombre': instance.nombre,
  'email': instance.email,
  'activo': instance.activo,
  'telefono': instance.telefono,
  'rol': _$TipoUsuarioEnumMap[instance.rol]!,
  'sucursalId': instance.sucursalId,
  'avatarUrl': instance.avatarUrl,
  'fechaCreacion': instance.fechaCreacion.toIso8601String(),
};

const _$TipoUsuarioEnumMap = {
  TipoUsuario.admin: 'admin',
  TipoUsuario.encargado: 'encargado',
  TipoUsuario.repartidor: 'repartidor',
  TipoUsuario.cliente: 'cliente',
};
