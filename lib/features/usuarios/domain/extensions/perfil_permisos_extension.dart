import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/enums/tipo_usuario.dart';

extension PermisosUsuario on Perfil {
  bool get esAdmin => rol == TipoUsuario.admin;
  bool get esEncargado => rol == TipoUsuario.encargado;
  bool get esRepartidor => rol == TipoUsuario.repartidor;
  bool get esCliente => rol == TipoUsuario.cliente;

  bool get esStaff => esAdmin || esEncargado;

  bool get puedeGestionarCatalogo => esAdmin;

  bool get puedeGestionarInventario => esStaff;

  bool get puedeGestionarPedidos => esStaff;

  bool get puedeGestionarBanners => esStaff;

  bool get puedeCrearSucursal => esAdmin;

  bool puedeDesactivarReactivarUsuario(Perfil objetivo) {
    if (esAdmin) return true;
    if (esEncargado &&
        objetivo.esRepartidor &&
        sucursalId == objetivo.sucursalId) {
      return true;
    }
    return false;
  }

  bool get puedeReactivarUsuario => esAdmin || esEncargado;

  bool get puedeHacerRepartidorUsuario => esAdmin || esEncargado;

  bool get puedeHacerEncargadoUsuario => esAdmin;
}
