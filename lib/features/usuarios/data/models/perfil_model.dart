import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

part 'perfil_model.freezed.dart';
part 'perfil_model.g.dart';

@freezed
abstract class PerfilModel with _$PerfilModel {
  const factory PerfilModel({
    required String id,
    required String nombre,
    @JsonKey(name: 'apellido_paterno') required String apellidoPaterno,
    @JsonKey(name: 'apellido_materno') String? apellidoMaterno,
    String? alias,
    required String email,
    required bool activo,
    String? telefono,
    required TipoUsuario rol,
    @JsonKey(name: 'sucursal_id') String? sucursalId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
  }) = _PerfilModel;

  factory PerfilModel.fromJson(Map<String, dynamic> json) =>
      _$PerfilModelFromJson(json);
}

extension PerfilModelX on PerfilModel {
  Perfil toDomain() => Perfil(
    id: id,
    nombre: nombre,
    apellidoPaterno: apellidoPaterno,
    apellidoMaterno: apellidoMaterno,
    alias: alias,
    email: email,
    activo: activo,
    telefono: telefono,
    rol: rol,
    sucursalId: sucursalId,
    avatarUrl: avatarUrl,
    fechaCreacion: fechaCreacion,
  );

  static PerfilModel fromDomain(Perfil p) => PerfilModel(
    id: p.id,
    nombre: p.nombre,
    apellidoPaterno: p.apellidoPaterno,
    apellidoMaterno: p.apellidoMaterno,
    alias: p.alias,
    email: p.email,
    activo: p.activo,
    telefono: p.telefono,
    rol: p.rol,
    sucursalId: p.sucursalId,
    avatarUrl: p.avatarUrl,
    fechaCreacion: p.fechaCreacion,
  );
}