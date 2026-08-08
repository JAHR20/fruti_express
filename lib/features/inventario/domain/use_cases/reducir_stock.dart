import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/mixins/inventario_validations.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';


class ReducirStock with InventarioValidations {
  final InventarioRepository repository;

  ReducirStock(this.repository);

  ResultTask<Unit> ejecutar({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validamos
      await $(validarCantidad(cantidad));
      await $(validarPermisos(usuarioActual, sucursalId));

      final cantidadParaRestar = cantidad * -1;

      return await $(repository.ajustarStockAtomicamente(
        productoId: productoId,
        sucursalId: sucursalId,
        cantidadCambio: cantidadParaRestar, 
      ));
    });
  }
}