import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';

part 'customer_shipping_state.freezed.dart';

@freezed
abstract class CustomerShippingState with _$CustomerShippingState {
  const factory CustomerShippingState({
    @Default(false) bool isLoading,
    @Default([]) List<ShippingConfig> configs, 
    String? error,
  }) = _CustomerShippingState;
}