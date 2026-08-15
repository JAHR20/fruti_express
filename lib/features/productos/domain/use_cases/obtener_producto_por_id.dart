import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart'; // 🌟 No olvides este import
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductoPorId {
  final ProductoRepository repository;

  ObtenerProductoPorId({required this.repository});

  ResultTask<Producto> ejecutar(String id) {
    final idLimpio = id.trim();

    return TaskEither.Do(($) async {
      // Validación de entrada
      if (idLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation('El ID del producto es necesario.'),
          ),
        );
      }

      // Llamada al repositorio
      final producto = await $(repository.obtenerPorId(idLimpio));
      return producto;
    });
  }
}