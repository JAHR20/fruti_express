import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/enums/discount_type.dart';
import '../../domain/entities/coupon.dart';

part 'coupon_model.freezed.dart';
part 'coupon_model.g.dart';

@freezed
abstract class CouponModel with _$CouponModel {
  const CouponModel._();

  const factory CouponModel({
    required String id,
    required String code,
    @JsonKey(name: 'discount_type') required DiscountType discountType,
    @JsonKey(name: 'discount_value') required int discountValue,
    @JsonKey(name: 'min_purchase_amount') required int minPurchaseAmount,
    @JsonKey(name: 'valid_from') required DateTime validFrom,
    @JsonKey(name: 'valid_until') DateTime? validUntil,
    @JsonKey(name: 'usage_limit') int? usageLimit,
    @JsonKey(name: 'used_count') required int usedCount,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _CouponModel;

  factory CouponModel.fromJson(Map<String, dynamic> json) => 
      _$CouponModelFromJson(json);

  Coupon toEntity() {
    return Coupon(
      id: id,
      code: code,
      discountType: discountType,
      discountValue: discountValue,
      minPurchaseAmount: minPurchaseAmount,
      validFrom: validFrom,
      validUntil: validUntil,
      usageLimit: usageLimit,
      usedCount: usedCount,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory CouponModel.fromEntity(Coupon entity) {
    return CouponModel(
      id: entity.id,
      code: entity.code,
      discountType: entity.discountType,
      discountValue: entity.discountValue,
      minPurchaseAmount: entity.minPurchaseAmount,
      validFrom: entity.validFrom,
      validUntil: entity.validUntil,
      usageLimit: entity.usageLimit,
      usedCount: entity.usedCount,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  Map<String, dynamic> toJsonForInsert() {
    final data = toJson();
    data.remove('id');
    data.remove('created_at');
    data.remove('updated_at');
    data.remove('used_count');
    return data;
  }
  
  Map<String, dynamic> toJsonForUpdate() {
    final data = toJson();
    data.remove('created_at');
    data.remove('updated_at'); 
    return data;
  }
}