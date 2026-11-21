// lib/features/shipping/data/models/covering_branch_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/covering_branch.dart';

part 'covering_branch_model.freezed.dart';
part 'covering_branch_model.g.dart';

@freezed
abstract class CoveringBranchModel with _$CoveringBranchModel {
  const CoveringBranchModel._();

  const factory CoveringBranchModel({
    @JsonKey(name: 'branch_id') required String branchId,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'shipping_cost') required int shippingCost,
  }) = _CoveringBranchModel;

  factory CoveringBranchModel.fromJson(Map<String, dynamic> json) =>
      _$CoveringBranchModelFromJson(json);

  CoveringBranch toEntity() => CoveringBranch(
        branchId: branchId,
        distanceKm: distanceKm,
        shippingCost: shippingCost,
      );
}