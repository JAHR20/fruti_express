import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  ResultTask<Category> create(Category category); 
  ResultTask<Category> update(Category category); 
  ResultTask<Unit> changeStatus(String id, bool newState); 

  ResultTask<Category?> getById(String id); 
  ResultTask<Category?> getByName(String name); 
  ResultTask<List<Category>> getAll(); 
  ResultTask<List<Category>> getActive(); 
  ResultTask<List<Category>> getByParentCategory(String parentId); 

  ResultStream<List<Category>> watchAll(); 
}