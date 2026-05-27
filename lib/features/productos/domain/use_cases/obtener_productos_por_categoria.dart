import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductosPorCategoria {
  final ProductoRepository repository;

  ObtenerProductosPorCategoria({required this.repository});

  ResultTask<List<Producto>> ejecutar(String categoriaId) {
    final idLimpio = categoriaId.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación de entrada (Fail Fast)
      if (idLimpio.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El ID de la categoría es necesario para la búsqueda',
            ),
          ),
        );
      }

      // 2️⃣ Llamada al repositorio
      // El operador $ extrae la lista si el resultado es Right.
      // Si es Left (ej. error de conexión), el flujo se corta aquí.
      final productos = await $(repository.obtenerPorCategoria(idLimpio));

      // 3️⃣ Éxito: Devolvemos la lista (vacía o con datos).
      // La UI se encargará de renderizar un "Empty State" si productos.isEmpty.
      return productos;
    });
  }
}
