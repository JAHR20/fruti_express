import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

extension InventarioPermisos on Perfil {
  bool puedeModificarInventario(String sucursalIdInventario) {
    if (esAdmin) return true;
    if (esEncargado && sucursalId == sucursalIdInventario) {
      return true;
    }
    return false;
  }
}
