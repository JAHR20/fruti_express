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
      // 1️⃣ Validación de entrada (Fail Fast)
      if (nombreTrim.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El nombre de búsqueda no puede estar vacío',
            ),
          ),
        );
      }

      // 2️⃣ Llamada al repositorio
      // El $ extrae el Producto? del TaskEither
      final producto = await $(repository.obtenerPorNombre(nombreTrim));

      // 3️⃣ Validación de existencia (Semántica de Negocio)

      return producto;
    });
  }
}
