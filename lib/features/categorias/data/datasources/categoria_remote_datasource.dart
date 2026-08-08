import 'package:fruti_express_jahr_admin/features/categorias/data/models/categoria_model.dart';

abstract class CategoriaRemoteDataSource {
  Future<List<CategoriaModel>> obtenerTodas();
  Future<List<CategoriaModel>> obtenerActivas();
  Future<CategoriaModel?> obtenerPorId(String id);
  Future<CategoriaModel?> obtenerPorNombre(String nombre);
  Future<List<CategoriaModel>> obtenerPorPadre(String? padreId);
  Stream<List<CategoriaModel>> watchTodas();
  Future<CategoriaModel> crear(CategoriaModel model);
  Future<CategoriaModel> actualizar(CategoriaModel model);
  Future<void> cambiarEstado(String id, bool nuevoEstado);
}
