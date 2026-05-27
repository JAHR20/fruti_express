import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

abstract class CategoriaRemoteDataSource {
  Future<List<Categoria>> obtenerTodas();
  Future<Categoria?> obtenerPorId(String id);
  Future<Categoria?> obtenerPorNombre(String nombre);
  Future<List<Categoria>> obtenerPorPadre(String? padreId);
  Stream<List<Categoria>> watchTodas();
  Future<Categoria> crear(Categoria categoria);
  Future<Categoria> actualizar(Categoria categoria);
  Future<void> desactivar(String id); // Soft delete
}
