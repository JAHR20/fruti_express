import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/extensions/category_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class UpdateCategoryUseCase {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  ResultTask<Category> execute({
    required AppUser currentUser,
    required String categoryId,
    String? name,
    String? description,
    String? imageUrl,
    String? parentCategoryId,
    bool? isActive,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));

      final original = await $(repository.getById(categoryId));
      if (original == null) {
        return await $(
          TaskEither.left(const Failure.notFound(FailureCode.categoryNotFound)),
        );
      }

      final newName = name?.trim();
      if (newName != null && newName != original.name) {
        await $(_validateUniqueName(newName, categoryId));
      }
      if (parentCategoryId != null &&
          parentCategoryId != original.parentCategoryId) {
        await $(_validateParentRelation(parentCategoryId, categoryId));
      }

      final updated = original.copyWith(
        name: newName ?? original.name,
        description: description ?? original.description,
        imageUrl: imageUrl ?? original.imageUrl,
        parentCategoryId: parentCategoryId ?? original.parentCategoryId,
        isActive: isActive ?? original.isActive,
      );

      await $(repository.update(updated));

      return updated;
    });
  }

  ResultTask<Unit> _validatePermissions(AppUser user) =>
      user.canEditCategory
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            FailureCode.noPermissionToPerformAction,
          ),
        );

  ResultTask<Unit> _validateUniqueName(String name, String currentId) =>
      repository
          .getByName(name)
          .flatMap(
            (existing) => (existing != null && existing.id != currentId)
                ? TaskEither.left(
                    const Failure.alreadyExists(
                      FailureCode.categoryNameAlreadyExists,
                    ),
                  )
                : TaskEither.right(unit),
          );

  ResultTask<Unit> _validateParentRelation(String parentId, String currentId) {
    if (parentId == currentId) {
      return TaskEither.left(
        const Failure.validation(FailureCode.categoryCannotBeItsOwnParent),
      );
    }
    return repository
        .getById(parentId)
        .flatMap(
          (parent) => parent == null
              ? TaskEither.left(
                  const Failure.validation(
                    FailureCode.parentCategoryNotFound,
                  ),
                )
              : TaskEither.right(unit),
        );
  }
}