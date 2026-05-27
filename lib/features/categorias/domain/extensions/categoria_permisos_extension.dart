import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/extensions/perfil_permisos_extension.dart';

extension PermisosCategoria on Perfil {
  bool puedeCrearCategoria() {
    return esAdmin;
  }

  bool puedeEditarCategoria() {
    return esAdmin;
  }

  bool puedeDesactivarCategoria() {
    return esAdmin;
  }

  bool puedeVerCategoria(Categoria categoria) {
    if (esAdmin) return true;
    return categoria.activa;
  }
}
