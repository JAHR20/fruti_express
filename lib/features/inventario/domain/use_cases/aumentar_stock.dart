import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/extensions/inventario_permisos_extension.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';

class AumentarStock {
  final InventarioRepository repository;

  AumentarStock(this.repository);

  ResultTask<Inventario> ejecutar({
    required Perfil usuario,
    required String productoId,
    required String sucursalId,
    required int cantidad,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación de entrada (Fail Fast)
      await $(_validarCantidad(cantidad));

      // 2️⃣ Validación de Seguridad
      await $(_validarPermisos(usuario, sucursalId));

      // 3️⃣ Obtener registro actual
      // Si el repo devuelve null en el Right, lanzamos Failure.notFound
      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'No existe un registro de inventario para este producto en la sucursal.',
            ),
          ),
        );
      }

      // 4️⃣ Aplicar lógica de aumento (Inmutabilidad)
      final actualizado = inventario.copyWith(
        cantidadDisponible: inventario.cantidadDisponible + cantidad,
        ultimaActualizacion: DateTime.now(),
      );

      // 5️⃣ Persistencia
      // El repositorio ya se encarga de capturar excepciones y devolver Left(Failure)
      return await $(repository.actualizar(actualizado));
    });
  }

  // --- 🧩 MICRO-PASOS DE LÓGICA ---

  ResultTask<Unit> _validarCantidad(int cant) => cant > 0
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.validation(
            'La cantidad a aumentar debe ser mayor a cero.',
          ),
        );

  ResultTask<Unit> _validarPermisos(Perfil u, String sId) =>
      u.puedeModificarInventario(sId)
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            'No tienes permisos para modificar el inventario en esta sucursal.',
          ),
        );
}
