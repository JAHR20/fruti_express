import 'package:fruti_express_jahr_admin/features/payments/data/models/card_payment_result_model.dart';

abstract class PaymentRemoteDataSource {
  Future<CardPaymentResultModel> createCardPayment({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    required int installments,
  });

  Future<String> verifyPayment({required String orderId});


  Future<void> cancelUnpaidOrder({required String orderId});
}