import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';

mixin InventarioValidations {
  
  ResultTask<Unit> validarCantidad(int cantidad) {
    if (cantidad > 0) return TaskEither.right(unit);
    
    return TaskEither.left(
      const Failure.validation('La cantidad a modificar debe ser mayor a cero.'),
    );
  }

  ResultTask<Unit> validarPermisos(Perfil usuario, String sucursalId) {
    if (usuario.puedeModificarInventario(sucursalId)) {
      return TaskEither.right(unit);
    }
    
    return TaskEither.left(
      const Failure.unauthorized('No tienes permisos para modificar el inventario en esta sucursal.'),
    );
  }
}