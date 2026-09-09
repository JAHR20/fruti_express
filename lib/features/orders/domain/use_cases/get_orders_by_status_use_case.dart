import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; // Corregido
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';

class GetOrdersByStatusUseCase with OrderValidations {
  final OrderRepository repository;

  GetOrdersByStatusUseCase(this.repository);

  ResultTask<List<Order>> execute({
    required String branchId,
    required OrderStatus status,
  }) {
    return TaskEither.Do(($) async {
      await $(validateId(branchId, FailureCode.invalidBranchId));

      return await $(
        repository.getByStatus(
          branchId: branchId.trim(),
          status: status,
        ),
      );
    });
  }
}