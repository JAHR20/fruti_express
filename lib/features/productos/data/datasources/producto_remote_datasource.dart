import 'package:fruti_express_jahr_admin/features/productos/domain/entities/producto.dart';

abstract class ProductoRemoteDatasource {
  Future<List<Producto>> obtenerTodos();
  Future<List<Producto>> obtenerPorCategoria(String categoriaId);
  Future<Producto?> obtenerPorId(String id);
  Future<Producto?> obtenerPorNombre(String nombre);
  Future<bool> existePorNombre(String nombre);
  Future<Producto> crear(Producto producto);
  Future<Producto> actualizar(Producto producto);
  Future<void> eliminar(String id); // Recordamos: Soft Delete (activa: false)
}
