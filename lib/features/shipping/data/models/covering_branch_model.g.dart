// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covering_branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoveringBranchModel _$CoveringBranchModelFromJson(Map<String, dynamic> json) =>
    _CoveringBranchModel(
      branchId: json['branch_id'] as String,
      distanceKm: (json['distance_km'] as num).toDouble(),
      shippingCost: (json['shipping_cost'] as num).toInt(),
    );

Map<String, dynamic> _$CoveringBranchModelToJson(
  _CoveringBranchModel instance,
) => <String, dynamic>{
  'branch_id': instance.branchId,
  'distance_km': instance.distanceKm,
  'shipping_cost': instance.shippingCost,
};
