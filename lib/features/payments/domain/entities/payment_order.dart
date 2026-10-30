
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_order.freezed.dart';

@freezed
abstract class PaymentOrder with _$PaymentOrder {
  const factory PaymentOrder({
    required String orderId,
    required String mercadoPagoOrderId,
    required String checkoutUrl,
  }) = _PaymentOrder;
}
