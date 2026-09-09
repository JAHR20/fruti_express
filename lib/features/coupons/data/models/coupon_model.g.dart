// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CouponModel _$CouponModelFromJson(Map<String, dynamic> json) => _CouponModel(
  id: json['id'] as String,
  code: json['code'] as String,
  discountType: $enumDecode(_$DiscountTypeEnumMap, json['discount_type']),
  discountValue: (json['discount_value'] as num).toInt(),
  minPurchaseAmount: (json['min_purchase_amount'] as num).toInt(),
  validFrom: DateTime.parse(json['valid_from'] as String),
  validUntil: json['valid_until'] == null
      ? null
      : DateTime.parse(json['valid_until'] as String),
  usageLimit: (json['usage_limit'] as num?)?.toInt(),
  usedCount: (json['used_count'] as num).toInt(),
  isActive: json['is_active'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CouponModelToJson(_CouponModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount_type': _$DiscountTypeEnumMap[instance.discountType]!,
      'discount_value': instance.discountValue,
      'min_purchase_amount': instance.minPurchaseAmount,
      'valid_from': instance.validFrom.toIso8601String(),
      'valid_until': instance.validUntil?.toIso8601String(),
      'usage_limit': instance.usageLimit,
      'used_count': instance.usedCount,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$DiscountTypeEnumMap = {
  DiscountType.percentage: 'percentage',
  DiscountType.fixed: 'fixed',
};
