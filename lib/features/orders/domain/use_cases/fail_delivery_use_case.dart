import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/delivery_failure_reason.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';

class FailDeliveryUseCase {
  final OrderRepository _repository;

  FailDeliveryUseCase(this._repository);

  ResultTask<Unit> execute({
    required String orderId,
    required DeliveryFailureReason reason,
    String? note,
  }) {
    return _repository.failDelivery(
      orderId: orderId,
      reason: reason,
      note: note,
    );
  }
}