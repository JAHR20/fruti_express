// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_payment_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardPaymentResultModel _$CardPaymentResultModelFromJson(
  Map<String, dynamic> json,
) => _CardPaymentResultModel(
  result: json['result'] as String,
  orderId: json['order_id'] as String,
  message: json['message'] as String?,
);

Map<String, dynamic> _$CardPaymentResultModelToJson(
  _CardPaymentResultModel instance,
) => <String, dynamic>{
  'result': instance.result,
  'order_id': instance.orderId,
  'message': instance.message,
};
