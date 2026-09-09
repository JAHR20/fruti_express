
import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/mixins/order_validations.dart';

class UpdateOrderStatusUseCase with OrderValidations {
  final OrderRepository repository;

  UpdateOrderStatusUseCase(this.repository);

  ResultTask<Order> execute({
    required Order order,
    required OrderStatus newStatus,
  }) {
    return TaskEither.Do(($) async {
      await $(validateId(order.id, FailureCode.invalidOrderId));
      await $(_validateTransition(order.status, newStatus));
      
      return await $(
        repository.updateStatus(
          orderId: order.id,
          newStatus: newStatus,
        ),
      );
    });
  }

  ResultTask<Unit> _validateTransition(OrderStatus current, OrderStatus newStatus) {
    final isValid = switch (current) {
      OrderStatus.pendingPayment =>
        newStatus == OrderStatus.confirmed || newStatus == OrderStatus.cancelled,

      OrderStatus.confirmed =>
        newStatus == OrderStatus.preparing || newStatus == OrderStatus.cancelled,

      OrderStatus.preparing =>
        newStatus == OrderStatus.onTheWay || newStatus == OrderStatus.cancelled,

      OrderStatus.onTheWay => newStatus == OrderStatus.delivered,
      _ => false,
    };

    return isValid
        ? TaskEither.right(unit)
        : TaskEither.left(
            const Failure.validation(FailureCode.invalidStatusTransition),
          );
  }
}