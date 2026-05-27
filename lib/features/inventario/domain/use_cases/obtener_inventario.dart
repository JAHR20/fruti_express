import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class ObtenerInventario {
  final InventarioRepository repository;

  ObtenerInventario(this.repository);

  /// Obtiene el estado detallado de inventario de un producto en una sucursal.
  ResultTask<Inventario> ejecutar({
    required String productoId,
    required String sucursalId,
  }) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación Fail-Fast
      // Si los IDs vienen vacíos, ni siquiera molestamos al repositorio.
      await $(_validarInputs(productoId, sucursalId));

      // 2️⃣ Llamada al Repositorio
      // El operador $ extrae el Inventario? (nullable) del ResultTask.
      final inventario = await $(
        repository.obtener(productoId: productoId, sucursalId: sucursalId),
      );

      // 3️⃣ Manejo Semántico del Nulo
      // Si es nulo, lo mapeamos a un error de "No encontrado" específico.
      if (inventario == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(
              'No se encontró información de inventario para este producto en la sucursal.',
            ),
          ),
        );
      }

      return inventario;
    });
  }

  // --- 🧩 MICRO-PASOS ---

  ResultTask<Unit> _validarInputs(String pId, String sId) {
    if (pId.trim().isEmpty || sId.trim().isEmpty) {
      return TaskEither.left(
        const Failure.validation(
          'El ID del producto y de la sucursal son obligatorios.',
        ),
      );
    }
    return TaskEither.right(unit);
  }
}
