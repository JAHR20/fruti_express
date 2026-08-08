import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class LiberarReserva {
  final InventarioRepository repository;

  LiberarReserva(this.repository);

  /// Libera una cantidad reservada, volviendo a poner el stock disponible
  /// para otros pedidos. No afecta la disponibilidad física.
  ResultTask<Inventario> ejecutar({
    required Perfil usuarioActual,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      await $(_validarCantidad(cantidad));

      // 2️⃣ Seguridad de Dominio
      await $(_validarPermisos(usuarioActual, sucursalId));

      // 3️⃣ Obtener registro actual
      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'No se encontró el registro de inventario para liberar.',
            ),
          ),
        );
      }

      // 4️⃣ 🛡️ Regla de Negocio: Validar que hay suficiente reserva para liberar
      await $(_validarReservaDisponible(inventario, cantidad));

      // 5️⃣ Actualizar contadores (Solo liberamos la reserva lógica)
      final actualizado = inventario.copyWith(
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
            'La cantidad a liberar debe ser mayor a cero.',
          ),
        );

  ResultTask<Unit> _validarPermisos(Perfil u, String sId) =>
      u.puedeModificarInventario(sId)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para gestionar inventario en esta sucursal.',
          ),
        );

  ResultTask<Unit> _validarReservaDisponible(Inventario inv, int liberar) =>
      inv.stockReservado >= liberar
      ? TaskEither.right(unit)
      : TaskEither.left(
          Failure.validation(
            'Inconsistencia: Intentas liberar $liberar, pero solo hay ${inv.stockReservado} reservadas.',
          ),
        );
}
