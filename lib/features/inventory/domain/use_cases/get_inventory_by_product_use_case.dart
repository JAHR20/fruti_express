import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';

class GetInventoryByProductUseCase {
  final InventoryRepository repository;

  GetInventoryByProductUseCase(this.repository);
  
  ResultTask<Inventory> execute({
    required String productId,
    required String branchId,
  }) {
    return TaskEither.Do(($) async {
      await $(_validateInputs(productId, branchId));

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

      return inventory;
    });
  }

  ResultTask<Unit> _validateInputs(String pId, String bId) {
    if (pId.trim().isEmpty || bId.trim().isEmpty) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidProductIdOrBranchId),
      );
    }
    return TaskEither.right(unit);
  }
}