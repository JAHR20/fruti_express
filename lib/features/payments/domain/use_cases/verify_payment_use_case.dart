import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';

class VerifyPaymentUseCase {
  final PaymentRepository _repository;

  VerifyPaymentUseCase(this._repository);

  ResultTask<String> execute({required String orderId}) =>
      _repository.verifyPayment(orderId: orderId);
}