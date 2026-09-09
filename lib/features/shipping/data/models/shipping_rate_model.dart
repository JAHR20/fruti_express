import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

part 'shipping_rate_model.freezed.dart';
part 'shipping_rate_model.g.dart';

@freezed
abstract class ShippingRateModel with _$ShippingRateModel {
  const ShippingRateModel._();

  const factory ShippingRateModel({
    required String id,
    @JsonKey(name: 'branch_id') required String branchId,
    required String name,
    @JsonKey(name: 'min_distance_km') required double minDistanceKm,
    @JsonKey(name: 'max_distance_km') required double maxDistanceKm,
    required int cost,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ShippingRateModel;

  factory ShippingRateModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingRateModelFromJson(json);

  ShippingRate toEntity() {
    return ShippingRate(
      id: id,
      branchId: branchId,
      name: name,
      minDistanceKm: minDistanceKm,
      maxDistanceKm: maxDistanceKm,
      cost: cost,
      isActive: isActive,
      createdAt: createdAt,
    );
  }

  factory ShippingRateModel.fromEntity(ShippingRate entity) {
    return ShippingRateModel(
      id: entity.id,
      branchId: entity.branchId,
      name: entity.name,
      minDistanceKm: entity.minDistanceKm,
      maxDistanceKm: entity.maxDistanceKm,
      cost: entity.cost,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> toJsonForInsert() {
    final json = toJson();
    json.remove('id');
    json.remove('created_at');
    return json;
  }
}
