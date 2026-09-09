import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';

class GetCurrentStockUseCase {
  final InventoryRepository _repository;

  GetCurrentStockUseCase(this._repository);

  ResultTask<int> execute(String productId, String branchId) =>
      TaskEither.Do(($) async {
        final validProductId = await $(
          TaskEither.fromPredicate(
            productId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation(FailureCode.invalidProductId),
          ),
        );

        final validBranchId = await $(
          TaskEither.fromPredicate(
            branchId,
            (id) => id.trim().isNotEmpty,
            (id) => const Failure.validation(FailureCode.invalidBranchId),
          ),
        );

        final stock = await $(
          _repository.getCurrentStock(validProductId, validBranchId)
        );

        return stock;
      });
}