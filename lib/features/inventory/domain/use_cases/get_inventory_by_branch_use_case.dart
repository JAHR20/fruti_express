import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';

class GetInventoryByBranchUseCase {
  final InventoryRepository repository;

  GetInventoryByBranchUseCase(this.repository);

  ResultTask<List<Inventory>> execute({required String branchId}) {
    return TaskEither.Do(($) async {
      if (branchId.trim().isEmpty) {
        return await $(TaskEither.left(
          const Failure.validation(FailureCode.branchIdRequired),
        ));
      }
      return await $(repository.getByBranch(branchId));
    });
  }
}