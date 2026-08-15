import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductoPorNombre {
  final ProductoRepository repository;

  ObtenerProductoPorNombre({required this.repository});

  ResultTask<Producto> ejecutar(String nombre) {
    final nombreTrim = nombre.trim();

    return TaskEither.Do(($) async {
      if (nombreTrim.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El nombre de búsqueda no puede estar vacío',
            ),
          ),
        );
      }

      final producto = await $(repository.obtenerPorNombre(nombreTrim));

      return producto;
    });
  }
}
