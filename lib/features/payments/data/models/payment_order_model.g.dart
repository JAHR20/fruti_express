// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentOrderModel _$PaymentOrderModelFromJson(Map<String, dynamic> json) =>
    _PaymentOrderModel(
      orderId: json['order_id'] as String,
      mercadoPagoOrderId: json['mercado_pago_order_id'] as String,
      checkoutUrl: json['checkout_url'] as String,
    );

Map<String, dynamic> _$PaymentOrderModelToJson(_PaymentOrderModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'mercado_pago_order_id': instance.mercadoPagoOrderId,
      'checkout_url': instance.checkoutUrl,
    };
