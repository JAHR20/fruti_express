
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';

class GetBranchOrdersUseCase with OrderValidations {
  final OrderRepository repository;

  GetBranchOrdersUseCase(this.repository);

  ResultTask<List<Order>> execute(String branchId) {
    return TaskEither.Do(($) async {
      await $(validateId(branchId, FailureCode.invalidBranchId));

      // 2. Realizamos la consulta
      return await $(repository.getByBranch(branchId.trim()));
    });
  }
}