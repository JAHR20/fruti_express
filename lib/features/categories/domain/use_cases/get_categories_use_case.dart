import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  ResultTask<List<Category>> execute({String? parentId}) {
    return TaskEither.Do(($) async {
      if (parentId != null && parentId.isNotEmpty) {
        return await $(repository.getByParentCategory(parentId));
      }
      return await $(repository.getAll());
    });
  }
}