import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/card_payment_result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';

class CreateCardPaymentUseCase {
  final PaymentRepository _repository;

  CreateCardPaymentUseCase(this._repository);

  ResultTask<CardPaymentResult> execute({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    required int installments,
  }) {
    return _repository.createCardPayment(
      orderId: orderId,
      token: token,
      paymentMethodId: paymentMethodId,
      paymentTypeId: paymentTypeId,
      installments: installments,
    );
  }
}