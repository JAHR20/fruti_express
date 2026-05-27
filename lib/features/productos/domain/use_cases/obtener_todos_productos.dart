import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerTodosLosProductos {
  final ProductoRepository repository;

  ObtenerTodosLosProductos({required this.repository});

  /// Obtiene la lista completa de productos del catálogo.
  ResultTask<List<Producto>> ejecutar() {
    return TaskEither.Do(($) async {
      // 1️⃣ Delegación al repositorio
      // Si el repositorio ya devuelve un ResultTask (TaskEither),
      // el operador $ se encarga de desenvolverlo o propagar el Failure.
      final productos = await $(repository.obtenerTodos());

      // 2️⃣ Éxito: Retornamos la lista.
      // Al ser una consulta de "Todos", una lista vacía [] es un éxito (Right),
      // no un error, indicando que el catálogo está vacío actualmente.
      return productos;
    });
  }
}
