import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';

part 'manager_orders_state.freezed.dart';

@freezed
abstract class ManagerOrdersState with _$ManagerOrdersState {
  const factory ManagerOrdersState.initial() = _Initial;
  const factory ManagerOrdersState.loading() = _Loading; 
  const factory ManagerOrdersState.loaded(List<Order> orders) = _Loaded; 
  const factory ManagerOrdersState.error(String message) = _Error;
  const factory ManagerOrdersState.performingAction({ 
    required List<Order> orders,
    required String orderId,
  }) = _PerformingAction;
}