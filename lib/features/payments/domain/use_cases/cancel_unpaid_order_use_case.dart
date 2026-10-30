import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';

class CancelUnpaidOrderUseCase {
  final PaymentRepository _repository;

  CancelUnpaidOrderUseCase(this._repository);

  ResultTask<void> execute({required String orderId}) {
    return _repository.cancelUnpaidOrder(orderId: orderId);
  }
}