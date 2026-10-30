import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/extensions/category_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class ChangeCategoryStatusUseCase {
  final CategoryRepository repository;

  ChangeCategoryStatusUseCase(this.repository);

  ResultTask<Category> execute({
    required AppUser currentUser,
    required String categoryId,
    required bool newState,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));

      final category = await $(repository.getById(categoryId));
      if (category == null) {
        return await $(
          TaskEither.left(const Failure.notFound(FailureCode.categoryNotFound)),
        );
      }
      await $(_validateNecessaryChange(category, newState));

      if (!newState) {
        await $(_validateSubcategoriesIntegrity(categoryId));
      }

      final updated = category.copyWith(isActive: newState);
      await $(repository.update(updated));

      return updated;
    });
  }

  ResultTask<Unit> _validatePermissions(AppUser user) =>
      user.canDeactivateCategory
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            FailureCode.noPermissionToPerformAction,
          ),
        );

  ResultTask<Unit> _validateNecessaryChange(Category cat, bool newState) =>
      cat.isActive != newState
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.validation(
            FailureCode.categoryAlreadyInRequestedState,
          ),
        );

  ResultTask<Unit> _validateSubcategoriesIntegrity(String id) => repository
      .getByParentCategory(id)
      .flatMap(
        (subcategories) => subcategories.any((c) => c.isActive)
            ? TaskEither.left(
                const Failure.validation(
                  FailureCode.categoryHasActiveSubcategories,
                ),
              )
            : TaskEither.right(unit),
      );
}