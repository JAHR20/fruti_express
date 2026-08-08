import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/mixins/inventario_validations.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';


class AumentarStock with InventarioValidations {
  final InventarioRepository repository;

  AumentarStock(this.repository);

  ResultTask<Unit> ejecutar({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Usamos las validaciones de tu mixin de forma súper limpia
      await $(validarCantidad(cantidad));
      await $(validarPermisos(usuarioActual, sucursalId));

      // 2️⃣ Mandamos la orden atómica a la Base de Datos (en positivo)
      return await $(repository.ajustarStockAtomicamente(
        productoId: productoId,
        sucursalId: sucursalId,
        cantidadCambio: cantidad, 
      ));
    });
  }
}