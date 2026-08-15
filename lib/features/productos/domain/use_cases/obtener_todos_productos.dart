import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerTodosLosProductos {
  final ProductoRepository repository;

  ObtenerTodosLosProductos({required this.repository});

  ResultTask<List<Producto>> ejecutar() {
    return TaskEither.Do(($) async {
      final productos = await $(repository.obtenerTodos());

      return productos;
    });
  }
}
