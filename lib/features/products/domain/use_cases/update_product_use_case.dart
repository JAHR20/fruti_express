import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class UpdateProductUseCase {
  final ProductRepository repository;
  final CategoryRepository categoryRepository;

  UpdateProductUseCase({
    required this.repository,
    required this.categoryRepository,
  });

  ResultTask<Product> execute({
    required Profile currentUser,
    required String productId,
    required String categoryId,
    required String name,
    String? description,
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    String? imageUrl,
    required bool isActive,
  }) {
    final trimmedName = name.trim();

    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));
      await $(_validatePrices(currentPrice, comparisonPrice));

      final existingProduct = await $(repository.getById(productId));

      if (existingProduct.categoryId != categoryId) {
        await $(_validateNewCategory(categoryId));
      }

      if (existingProduct.name != trimmedName) {
        await $(_validateNewName(trimmedName));
      }

      final updatedProduct = existingProduct.copyWith(
        categoryId: categoryId,
        name: trimmedName,
        description: description,
        currentPrice: currentPrice,
        comparisonPrice: comparisonPrice,
        measurementUnit: measurementUnit,
        imageUrl: imageUrl,
        isActive: isActive,
      );

      return await $(repository.update(updatedProduct));
    });
  }

  ResultTask<Unit> _validatePermissions(Profile u) => u.canManageCatalog 
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction));

  ResultTask<Unit> _validatePrices(int current, int? comp) =>
      current > 0 && (comp == null || comp >= current)
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.validation(FailureCode.invalidPrices));

  ResultTask<Unit> _validateNewCategory(String id) => categoryRepository
      .getById(id)
      .flatMap(
        (cat) => cat != null
            ? TaskEither.right(unit)
            : TaskEither.left(const Failure.validation(FailureCode.categoryNotFound)),
      );

  ResultTask<Unit> _validateNewName(String name) => repository
      .existsByName(name)
      .flatMap(
        (exists) => exists
            ? TaskEither.left(const Failure.alreadyExists(FailureCode.productNameAlreadyExists))
            : TaskEither.right(unit),
      );
}