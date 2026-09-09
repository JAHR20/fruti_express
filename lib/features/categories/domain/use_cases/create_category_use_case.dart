import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/extensions/category_permissions_extension.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class CreateCategoryUseCase {
  final CategoryRepository repository;

  CreateCategoryUseCase(this.repository);

  ResultTask<Category> execute({
    required Profile currentUser,
    required String name,
    String? description,
    String? imageUrl,
    String? parentCategoryId,
  }) {
    final trimmedName = name.trim();

    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));
      await $(_validateInputName(trimmedName));
      await $(_validateUniqueName(trimmedName));

      if (parentCategoryId != null) {
        await $(_validateParentExistence(parentCategoryId));
      }

      final newCategory = Category(
        id: '',
        name: trimmedName,
        description: description,
        imageUrl: imageUrl,
        isActive: true,
        parentCategoryId: parentCategoryId,
        createdAt: DateTime.now(),
      );

      return await $(repository.create(newCategory));
    });
  }

  ResultTask<Unit> _validatePermissions(Profile user) =>
      user.canCreateCategory
      ? TaskEither.right(unit)
      : TaskEither.left(
          const Failure.unauthorized(
            FailureCode.noPermissionToPerformAction,
          ),
        );

  ResultTask<Unit> _validateInputName(String name) => name.isEmpty
      ? TaskEither.left(
          const Failure.validation(
            FailureCode.invalidCategoryName,
          ),
        )
      : TaskEither.right(unit);

  ResultTask<Unit> _validateUniqueName(String name) => repository
      .getByName(name)
      .flatMap(
        (existing) => existing != null
            ? TaskEither.left(
                const Failure.alreadyExists(
                  FailureCode.categoryNameAlreadyExists,
                ),
              )
            : TaskEither.right(unit),
      );

  ResultTask<Unit> _validateParentExistence(String id) => repository
      .getById(id)
      .flatMap(
        (parent) => parent != null
            ? TaskEither.right(unit)
            : TaskEither.left(
                const Failure.validation(
                  FailureCode.parentCategoryNotFound,
                ),
              ),
      );
}