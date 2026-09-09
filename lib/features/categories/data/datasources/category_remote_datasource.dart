import 'package:fruti_express_jahr_admin/features/categories/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getAll();
  Future<List<CategoryModel>> getActive();
  Future<CategoryModel?> getById(String id);
  Future<CategoryModel?> getByName(String name);
  Future<List<CategoryModel>> getByParent(String? parentId);
  Stream<List<CategoryModel>> watchAll();
  Future<CategoryModel> create(CategoryModel model);
  Future<CategoryModel> update(CategoryModel model);
  Future<void> changeStatus(String id, bool newState);
}