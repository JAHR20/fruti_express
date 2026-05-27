import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

part 'perfil.freezed.dart';
part 'perfil.g.dart';

@freezed
abstract class Perfil with _$Perfil {
  const factory Perfil({
    required String id,
    required String nombre,
    required String email,
    required bool activo,
    String? telefono,
    required TipoUsuario rol,
    String? sucursalId,
    String? avatarUrl,
    required DateTime fechaCreacion,
  }) = _Perfil;

  factory Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);
}
