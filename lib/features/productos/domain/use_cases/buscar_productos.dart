import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class BuscarProductos {
  final ProductoRepository repository;

  BuscarProductos({required this.repository});

  // 🌟 Devuelve una LISTA de productos, recibe el texto y la sucursal
  ResultTask<List<Producto>> ejecutar(String query, String sucursalId) {
    final queryLimpio = query.trim();
    final sucursalLimpia = sucursalId.trim();

    return TaskEither.Do(($) async {
      // 1️⃣ Validación de entrada (Fail Fast)
      // Si el usuario presiona "buscar" sin escribir nada o falta la sucursal, lo frenamos.
      if (queryLimpio.isEmpty || sucursalLimpia.isEmpty) {
        return await $(
          TaskEither.left(
            const Failure.validation(
              'El término de búsqueda y la sucursal son necesarios.',
            ),
          ),
        );
      }

      // 2️⃣ Llamada al repositorio enviando ambos parámetros limpios
      final productos = await $(repository.buscarProductos(queryLimpio, sucursalLimpia));

      // 3️⃣ Éxito: Devolvemos la lista resultante
      return productos;
    });
  }
}