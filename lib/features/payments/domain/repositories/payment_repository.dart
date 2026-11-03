import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/card_payment_result.dart';

abstract class PaymentRepository {
  ResultTask<CardPaymentResult> createCardPayment({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    required int installments,
  });

  ResultTask<String> verifyPayment({required String orderId});


  ResultTask<void> cancelUnpaidOrder({required String orderId});
}