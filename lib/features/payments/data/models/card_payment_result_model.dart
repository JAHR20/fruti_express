import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/card_payment_result.dart';

part 'card_payment_result_model.freezed.dart';
part 'card_payment_result_model.g.dart';

@freezed
abstract class CardPaymentResultModel with _$CardPaymentResultModel {
  const CardPaymentResultModel._();
  const factory CardPaymentResultModel({
    required String result,
    @JsonKey(name: 'order_id') required String orderId,
    String? message,
  }) = _CardPaymentResultModel;

  factory CardPaymentResultModel.fromJson(Map<String, dynamic> json) =>
      _$CardPaymentResultModelFromJson(json);

  CardPaymentResult toDomain() => CardPaymentResult(
        status: switch (result) {
          'approved' => CardPaymentStatus.approved,
          'rejected' => CardPaymentStatus.rejected,
          _ => CardPaymentStatus.pending,
        },
        orderId: orderId,
        message: message,
      );
}