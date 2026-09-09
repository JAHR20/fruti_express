import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
part 'coupon.freezed.dart';

@freezed
abstract class Coupon with _$Coupon {
  const Coupon._();

  const factory Coupon({
    required String id,
    required String code,
    required DiscountType discountType,
    required int discountValue,
    required int minPurchaseAmount,
    required DateTime validFrom,
    DateTime? validUntil,
    int? usageLimit,
    required int usedCount,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Coupon;

  bool get isValidNow {
    if (!isActive) return false;
    
    final now = DateTime.now();
    
    if (now.isBefore(validFrom)) return false;
    
    if (validUntil != null && now.isAfter(validUntil!)) return false;
    
    if (usageLimit != null && usedCount >= usageLimit!) return false;

    return true;
  }

  bool isApplicableForAmount(int cartSubtotal) {
    return cartSubtotal >= minPurchaseAmount;
  }
}