import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/unavailable_reason.dart'; // MotivoNoDisponible -> UnavailableReason

part 'shipping_quote.freezed.dart';

@freezed
abstract class ShippingQuote with _$ShippingQuote {
  const factory ShippingQuote({
    required String branchId, 
    required bool isAvailable,
    required double distanceKm,
    required int shippingCost, 
    UnavailableReason? reason, 
  }) = _ShippingQuote;
}