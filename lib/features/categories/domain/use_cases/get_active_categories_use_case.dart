import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';

class GetActiveCategoriesUseCase {
  final CategoryRepository _repository;
  
  GetActiveCategoriesUseCase(this._repository);

  ResultTask<List<Category>> execute() => _repository.getActive();
}