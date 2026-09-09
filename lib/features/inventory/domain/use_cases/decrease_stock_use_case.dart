import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/mixins/inventory_validations.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/profile.dart';

class DecreaseStockUseCase with InventoryValidations {
  final InventoryRepository repository;

  DecreaseStockUseCase(this.repository);

  ResultTask<Unit> execute({
    required Profile currentUser,
    required String productId,
    required String branchId,
    required int quantity,
  }) {
    return TaskEither.Do(($) async {
      await $(validateQuantity(quantity));
      await $(validatePermissions(currentUser, branchId));

      final quantityToSubtract = quantity * -1;

      return await $(repository.adjustStockAtomically(
        productId: productId,
        branchId: branchId,
        quantityChange: quantityToSubtract, 
      ));
    });
  }
}