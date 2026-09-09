import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';

part 'order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();
  const factory OrderState.initial() = _Initial;
  const factory OrderState.processing() = _Processing; 
  const factory OrderState.awaitingPayment(Order order) = _AwaitingPayment;
  const factory OrderState.confirmingPayment() = _ConfirmingPayment; 
  const factory OrderState.completed(Order order) = _Completed;
  const factory OrderState.error(String message) = _Error;
}