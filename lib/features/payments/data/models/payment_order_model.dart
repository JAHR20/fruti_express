
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/payment_order.dart';

part 'payment_order_model.freezed.dart';
part 'payment_order_model.g.dart';

@freezed
abstract class PaymentOrderModel with _$PaymentOrderModel {
  const PaymentOrderModel._();

  const factory PaymentOrderModel({
    @JsonKey(name: 'order_id')
    required String orderId,

    @JsonKey(name: 'mercado_pago_order_id')
    required String mercadoPagoOrderId,

    @JsonKey(name: 'checkout_url')
    required String checkoutUrl,
  }) = _PaymentOrderModel;

  factory PaymentOrderModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderModelFromJson(json);

  PaymentOrder toDomain() => PaymentOrder(
        orderId: orderId,
        mercadoPagoOrderId: mercadoPagoOrderId,
        checkoutUrl: checkoutUrl,
      );
}
