import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class CreateProductUseCase {
  final ProductRepository repository;
  final CategoryRepository categoryRepository;

  CreateProductUseCase({
    required this.repository, 
    required this.categoryRepository
  });

  ResultTask<Product> execute({
    required AppUser currentUser,
    required String categoryId,
    required String name,
    String? description,
    required int currentPrice,
    int? comparisonPrice,
    required MeasurementUnit measurementUnit,
    String? imageUrl,
  }) {
    final trimmedName = name.trim();

    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));
      await $(_validatePrices(currentPrice, comparisonPrice));

      await $(_validateExistingCategory(categoryId));
      await $(_validateUniqueName(trimmedName));

      final product = Product(
        id: '',
        categoryId: categoryId,
        name: trimmedName,
        description: description,
        currentPrice: currentPrice,
        comparisonPrice: comparisonPrice,
        measurementUnit: measurementUnit,
        imageUrl: imageUrl,
        isActive: true,
        createdAt: DateTime.now(), 
      );

      return await $(repository.create(product));
    });
  }

  ResultTask<Unit> _validatePermissions(AppUser u) => u.canManageCatalog
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction));

  ResultTask<Unit> _validatePrices(int current, int? comp) =>
      current > 0 && (comp == null || comp >= current)
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.validation(FailureCode.invalidPrices));

  ResultTask<Unit> _validateExistingCategory(String id) => categoryRepository
      .getById(id)
      .flatMap(
        (category) => category != null
            ? TaskEither.right(unit)
            : TaskEither.left(const Failure.validation(FailureCode.categoryNotFound)),
      );

  ResultTask<Unit> _validateUniqueName(String name) => repository
      .existsByName(name)
      .flatMap(
        (exists) => exists
            ? TaskEither.left(const Failure.alreadyExists(FailureCode.productNameAlreadyExists))
            : TaskEither.right(unit),
      );
}