import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class ObtenerInventarioPorSucursal {
  final InventarioRepository repository;

  ObtenerInventarioPorSucursal(this.repository);

  ResultTask<List<Inventario>> ejecutar({required String sucursalId}) {
    return TaskEither.Do(($) async {
      // 1️⃣ Validación rápida (Fail Fast)
      if (sucursalId.trim().isEmpty) {
        return await $(TaskEither.left(
          const Failure.validation('El ID de la sucursal es obligatorio.'),
        ));
      }

      // 2️⃣ Pedimos la lista completa de inventario al repositorio
      return await $(repository.obtenerPorSucursal(sucursalId));
    });
  }
}