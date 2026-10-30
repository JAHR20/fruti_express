import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_verification_state.freezed.dart';

@freezed
class PaymentVerificationState with _$PaymentVerificationState {
  const factory PaymentVerificationState.initial() = _Initial;
  const factory PaymentVerificationState.status(String status) = _Status;
  const factory PaymentVerificationState.error(String message) = _Error;
}