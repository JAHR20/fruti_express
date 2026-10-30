
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/payment_order.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';

class CreatePaymentOrderUseCase {
  final PaymentRepository _repository;

  CreatePaymentOrderUseCase(this._repository);

  ResultTask<PaymentOrder> execute({
    required String orderId,
  }) {
    return _repository.createPaymentOrder(orderId: orderId);
  }
}
