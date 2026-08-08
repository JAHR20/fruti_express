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

  /// Confirma la salida de stock previamente reservado.
  /// Reduce tanto la disponibilidad física como la reserva lógica.
  ResultTask<Inventario> ejecutar({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      await $(_validarCantidad(cantidad));

      // 2️⃣ Seguridad de Capa de Dominio
      await $(_validarPermisos(usuarioActual, sucursalId));

      // 3️⃣ Obtener el estado actual del inventario
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

      // 4️⃣ 🚨 Regla Crítica: Validar que la reserva cubra la confirmación
      await $(_validarReservaSuficiente(inventario, cantidad));

      // 5️⃣ Transformación Atómica (Doble resta)
      final actualizado = inventario.copyWith(
        stockDisponible: inventario.stockDisponible - cantidad,
        stockReservado: inventario.stockReservado - cantidad,
        fechaActualizacion: DateTime.now(),
      );

      // 6️⃣ Persistencia
      return await $(repository.actualizar(actualizado));
    });
  }

  // --- 🧩 MICRO-PASOS DE LÓGICA ---

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
