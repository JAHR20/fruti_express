import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';

part 'customer_orders_state.freezed.dart';

@freezed
abstract class CustomerOrdersState with _$CustomerOrdersState {
  const factory CustomerOrdersState.initial() = _Initial; 
  const factory CustomerOrdersState.loading() = _Loading; 
  const factory CustomerOrdersState.loaded(List<Order> orders) = _Loaded; 
  const factory CustomerOrdersState.error(String message) = _Error;
}