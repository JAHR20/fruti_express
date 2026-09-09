import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/shipping_strategy.dart';

part 'shipping_config_model.freezed.dart';
part 'shipping_config_model.g.dart';

@freezed
abstract class ShippingConfigModel with _$ShippingConfigModel {
  const ShippingConfigModel._();

  const factory ShippingConfigModel({
    required String id,
    @JsonKey(name: 'branch_id') required String branchId,
    required ShippingStrategy strategy, 
    @JsonKey(name: 'max_radius_km') required double maxRadiusKm,
    @JsonKey(includeToJson: false) @Default([]) List<String> allowedZipCodes,
    @JsonKey(name: 'require_zip_code_validation') @Default(false) bool requireZipCodeValidation,
    @JsonKey(name: 'min_amount_for_free_shipping') int? minAmountForFreeShipping,
    @JsonKey(name: 'is_active') required bool isActive, 
    @JsonKey(name: 'created_at') required DateTime createdAt, 
  }) = _ShippingConfigModel;

  factory ShippingConfigModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingConfigModelFromJson(json);

  factory ShippingConfigModel.fromSupabase(Map<String, dynamic> json) {
    if (json['branch_coverage'] != null) {
      final relationList = json['branch_coverage'] as List<dynamic>;
      json['allowedZipCodes'] = relationList
          .map((e) => e['zip_code'].toString())
          .toList();
    }
    return ShippingConfigModel.fromJson(json);
  }

  ShippingConfig toEntity() {
    return ShippingConfig(
      id: id,
      branchId: branchId,
      strategy: strategy,
      maxRadiusKm: maxRadiusKm,
      allowedZipCodes: allowedZipCodes,
      requireZipCodeValidation: requireZipCodeValidation,
      minAmountForFreeShipping: minAmountForFreeShipping,
      isActive: isActive,
      createdAt: createdAt,
    );
  }

  factory ShippingConfigModel.fromEntity(ShippingConfig entity) {
    return ShippingConfigModel(
      id: entity.id,
      branchId: entity.branchId,
      strategy: entity.strategy,
      maxRadiusKm: entity.maxRadiusKm,
      allowedZipCodes: entity.allowedZipCodes,
      requireZipCodeValidation: entity.requireZipCodeValidation,
      minAmountForFreeShipping: entity.minAmountForFreeShipping,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJsonForInsert() {
    return {
      'branch_id': branchId,
      'strategy': strategy.name,
      'max_radius_km': maxRadiusKm,
      'is_active': isActive,
      'require_zip_code_validation': requireZipCodeValidation,
      'min_amount_for_free_shipping': minAmountForFreeShipping,
    };
  }
}