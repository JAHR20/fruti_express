import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class ConfirmarStock {
  final InventarioRepository repository;

  ConfirmarStock(this.repository);
  ResultTask<Inventario> ejecutar({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      await $(_validarCantidad(cantidad));
      await $(_validarPermisos(usuarioActual, sucursalId));
      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'No se encontró el registro de inventario para confirmar.',
            ),
          ),
        );
      }

      await $(_validarReservaSuficiente(inventario, cantidad));
      final actualizado = inventario.copyWith(
        stockDisponible: inventario.stockDisponible - cantidad,
        stockReservado: inventario.stockReservado - cantidad,
        fechaActualizacion: DateTime.now(),
      );
      return await $(repository.actualizar(actualizado));
    });
  }


  ResultTask<Unit> _validarCantidad(int cant) => cant > 0
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.validation(
            'La cantidad a confirmar debe ser mayor a cero.',
          ),
        );

  ResultTask<Unit> _validarPermisos(Perfil u, String sId) =>
      u.puedeModificarInventario(sId)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para confirmar stock en esta sucursal.',
          ),
        );

  ResultTask<Unit> _validarReservaSuficiente(Inventario inv, int confirmado) =>
      inv.stockReservado >= confirmado
      ? TaskEither.right(unit)
      : TaskEither.left(
          Failure.validation(
            'Inconsistencia: Intentas confirmar $confirmado, pero solo hay ${inv.stockReservado} reservadas.',
          ),
        );
}
