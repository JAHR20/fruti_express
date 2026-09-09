import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';

part 'driver_orders_state.freezed.dart';

@freezed
abstract class DriverOrdersState with _$DriverOrdersState {
  const factory DriverOrdersState.initial() = _Initial;
  const factory DriverOrdersState.loading() = _Loading;
  const factory DriverOrdersState.loaded(List<Order> orders) = _Loaded;
  
  const factory DriverOrdersState.errorWithOrders({
    required List<Order> orders,
    required String message,
  }) = _ErrorWithOrders;
  
  const factory DriverOrdersState.error(String message) = _Error;

  const factory DriverOrdersState.performingAction({
    required List<Order> orders,
    required String orderId,
  }) = _PerformingAction;
}