import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_payment_state.freezed.dart';

@freezed
class CardPaymentState with _$CardPaymentState {
  const factory CardPaymentState.initial() = _Initial;
  const factory CardPaymentState.processing() = _Processing;
  const factory CardPaymentState.approved(String orderId) = _Approved;
  const factory CardPaymentState.pending(String orderId) = _Pending;
  const factory CardPaymentState.rejected(String message) = _Rejected;
  const factory CardPaymentState.error(String message) = _Error;
}