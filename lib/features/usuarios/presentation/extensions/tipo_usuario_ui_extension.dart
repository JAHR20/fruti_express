import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

extension TipoUsuarioUI on TipoUsuario {
  String get nombreUI {
    switch (this) {
      case TipoUsuario.admin:
        return 'Administrador';
      case TipoUsuario.encargado:
        return 'Encargado';
      case TipoUsuario.repartidor:
        return 'Repartidor';
      case TipoUsuario.cliente:
        return 'Cliente';
    }
  }
}