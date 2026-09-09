import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_rate.freezed.dart';

@freezed
abstract class ShippingRate with _$ShippingRate {
  const factory ShippingRate({
    required String id,
    required String branchId,
    required String name, 
    required double minDistanceKm,
    required double maxDistanceKm,
    required int cost, 
    required bool isActive, 
    required DateTime createdAt, 
  }) = _ShippingRate;
}