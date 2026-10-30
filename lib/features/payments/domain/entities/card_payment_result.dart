import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_payment_result.freezed.dart';

enum CardPaymentStatus { approved, rejected, pending }

@freezed
abstract class CardPaymentResult with _$CardPaymentResult {
  const factory CardPaymentResult({
    required CardPaymentStatus status,
    required String orderId,
    String? message,
  }) = _CardPaymentResult;
}