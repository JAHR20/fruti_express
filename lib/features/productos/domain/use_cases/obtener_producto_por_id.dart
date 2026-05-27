import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/repositories/producto_repository.dart';

class ObtenerProductoPorId {
  final ProductoRepository repository;

  ObtenerProductoPorId({required this.repository});

  ResultTask<Producto> ejecutar(String id) {
    return TaskEither.Do(($) async {
      // 1️⃣ Llamada directa al repositorio
      // Si el producto no existe, el repo ya devuelve Left(Failure.notFound)
      // El operador $ detecta el Left y aborta el flujo automáticamente.
      final producto = await $(repository.obtenerPorId(id));

      // 2️⃣ Validación de seguridad extra (opcional)
      // Solo necesaria si tu repositorio permite devolver null en el Right

      return producto;
    });
  }
}
