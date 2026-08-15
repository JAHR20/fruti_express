import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

part 'perfil.freezed.dart';

@freezed
abstract class Perfil with _$Perfil {
  const factory Perfil({
    required String id,
    required String nombre,
    required String apellidoPaterno,
    String? apellidoMaterno,
    String? alias,
    required String email,
    required bool activo,
    String? telefono,
    required TipoUsuario rol,
    String? sucursalId,
    String? avatarUrl,
    required DateTime fechaCreacion,
  }) = _Perfil;
}

extension PerfilFormatX on Perfil {
  String get nombreCompletoSnapshot {
    final materno = apellidoMaterno != null ? ' $apellidoMaterno' : '';
    return '$nombre $apellidoPaterno$materno'.trim();
  }
}

extension DireccionFormatX on Direccion {
  String get formateadaSnapshot {
    final interior = (numInt != null && numInt!.isNotEmpty)
        ? ' Int. $numInt'
        : '';
    return '$calle #$numExt$interior, $colonia, C.P. $codigoPostal';
  }
}