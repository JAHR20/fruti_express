import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/mixins/inventory_validations.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/entities/app_user.dart';

class ReserveStockUseCase with InventoryValidations {
  final InventoryRepository repository;

  ReserveStockUseCase(this.repository);

  ResultTask<Inventory> execute({
    required AppUser currentUser,
    required String productId,
    required String branchId,
    required int quantity,
  }) {
    return TaskEither.Do(($) async {
      await $(validateQuantity(quantity));
      await $(validatePermissions(currentUser, branchId));

      final inventory = await $(
        repository.get(productId: productId, branchId: branchId),
      );

      if (inventory == null) {
        return await $(
          TaskEither.left(
            const Failure.notFound(FailureCode.inventoryRecordNotFound),
          ),
        );
      }

      await $(_validateSufficientStock(inventory, quantity));

      final updated = inventory.copyWith(
        reservedStock: inventory.reservedStock + quantity,
        updatedAt: DateTime.now(),
      );

      return await $(repository.update(updated));
    });
  }

  ResultTask<Unit> _validateSufficientStock(Inventory inv, int requested) {
    final realStock = inv.availableStock - inv.reservedStock;

    return realStock >= requested
        ? TaskEither.right(unit)
        : TaskEither.left(
            const Failure.validation(FailureCode.insufficientAvailableStock),
          );
  }
}