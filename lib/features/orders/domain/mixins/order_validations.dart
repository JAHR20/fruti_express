import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';

mixin OrderValidations {
  ResultTask<Unit> validateId(String id, FailureCode code) {
    if (id.trim().isEmpty) {
      return TaskEither.left(Failure.validation(code));
    }
    return TaskEither.right(unit);
  }

  ResultTask<Unit> validateDeliveryEvidence(ConfirmDeliveryParams params) {
    final hasCode =
        params.confirmationCode != null &&
        params.confirmationCode!.trim().isNotEmpty;
    final hasEvidence =
        params.evidenceUrl != null && params.evidenceUrl!.trim().isNotEmpty;

    if (!hasCode && !hasEvidence) {
      return TaskEither.left(
        const Failure.validation(FailureCode.missingDeliveryEvidence),
      );
    }

    return TaskEither.right(unit);
  }

  ResultTask<Unit> validateCreateOrder(CreateOrderParams params) {
    if (params.items.isEmpty) {
      return TaskEither.left(
        const Failure.validation(FailureCode.emptyOrderItems),
      );
    }
    if (params.total < 0) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidOrderTotal),
      );
    }
    if (params.branchId.trim().isEmpty) {
      return TaskEither.left(
        const Failure.validation(FailureCode.invalidBranchId),
      );
    }
    return TaskEither.right(unit);
  }
}
