import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

part 'shipping_admin_state.freezed.dart';

@freezed
abstract class ShippingAdminState with _$ShippingAdminState {
  const factory ShippingAdminState({
    @Default(false) bool isLoading,
    ShippingConfig? config, 
    @Default(<ShippingRate>[]) List<ShippingRate> rates, 
    @Default(5.0) double tempRadiusKm, 
    @Default(false) bool tempRequireZipCode, 
    int? tempFreeShippingAmount, 
    String? error,
    String? successMessage, 
    String? processingRateId, 
  }) = _ShippingAdminState;
}