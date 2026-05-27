import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class ReducirStock {
  final InventarioRepository repository;

  ReducirStock(this.repository);

  ResultTask<Inventario> ejecutar({
    required Perfil usuarioActual, // 🛡️ Agregamos seguridad por consistencia
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación de entrada
      await $(_validarCantidad(cantidad));

      // 2️⃣ Seguridad: ¿Puede este usuario tocar el inventario?
      await $(_validarPermisos(usuarioActual, sucursalId));

      // 3️⃣ Localizar el registro
      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'El producto no existe en el inventario de esta sucursal.',
            ),
          ),
        );
      }

      // 4️⃣ 🛡️ REGLA DE ORO: Validar disponibilidad
      await $(_validarDisponibilidad(inventario, cantidad));

      // 5️⃣ Aplicar reducción (Inmutabilidad)
      final actualizado = inventario.copyWith(
        cantidadDisponible: inventario.cantidadDisponible - cantidad,
        ultimaActualizacion: DateTime.now(),
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
            'La cantidad a reducir debe ser mayor a cero.',
          ),
        );

  ResultTask<Unit> _validarPermisos(Perfil u, String sId) =>
      u.puedeModificarInventario(sId)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para modificar inventario.',
          ),
        );

  ResultTask<Unit> _validarDisponibilidad(Inventario inv, int solicitado) =>
      inv.cantidadDisponible >= solicitado
      ? TaskEither.right(unit)
      : TaskEither.left(
          Failure.validation(
            'Stock insuficiente. Disponible: ${inv.cantidadDisponible}, Solicitado: $solicitado',
          ),
        );
}
