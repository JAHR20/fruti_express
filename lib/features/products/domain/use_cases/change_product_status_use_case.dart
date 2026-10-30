import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/extensions/profile_permissions_extension.dart';

class ChangeProductStatusUseCase {
  final ProductRepository repository;

  ChangeProductStatusUseCase({required this.repository});

  ResultTask<Product> execute({
    required AppUser currentUser,
    required String productId,
    required bool newState,
  }) {
    return TaskEither.Do(($) async {
      await $(_validatePermissions(currentUser));

      final product = await $(repository.getById(productId));

      await $(_validateNecessaryChange(product, newState));

      final updatedProduct = product.copyWith(isActive: newState);

      return await $(repository.update(updatedProduct));
    });
  }

  ResultTask<Unit> _validatePermissions(AppUser u) => u.canManageCatalog 
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.unauthorized(FailureCode.noPermissionToPerformAction));

  ResultTask<Unit> _validateNecessaryChange(Product p, bool newState) =>
      p.isActive != newState
      ? TaskEither.right(unit)
      : TaskEither.left(const Failure.validation(FailureCode.productAlreadyInRequestedState));
}