import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
// 🌟 Asegúrate de que esta ruta apunte correctamente a tu extensión
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';

mixin InventarioValidations {
  
  // Regla 1: No puedes sumar o restar "0" o números negativos
  ResultTask<Unit> validarCantidad(int cantidad) {
    if (cantidad > 0) return TaskEither.right(unit);
    
    return TaskEither.left(
      const Failure.validation('La cantidad a modificar debe ser mayor a cero.'),
    );
  }

  // Regla 2: El usuario debe ser encargado de ESA sucursal o ser Admin
  ResultTask<Unit> validarPermisos(Perfil usuario, String sucursalId) {
    if (usuario.puedeModificarInventario(sucursalId)) {
      return TaskEither.right(unit);
    }
    
    return TaskEither.left(
      const Failure.unauthorized('No tienes permisos para modificar el inventario en esta sucursal.'),
    );
  }
}