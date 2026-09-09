import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/shipping_strategy.dart'; // EstrategiaEnvio -> ShippingStrategy

part 'shipping_config.freezed.dart';

@freezed
abstract class ShippingConfig with _$ShippingConfig {
  const factory ShippingConfig({
    required String id,
    required String branchId, 
    required ShippingStrategy strategy, 
    required double maxRadiusKm, 
    @Default([]) List<String> allowedZipCodes,
    @Default(false) bool requireZipCodeValidation,
    final int? minAmountForFreeShipping, 
    @Default(true) bool isActive, 
    required DateTime createdAt, 
  }) = _ShippingConfig;
}