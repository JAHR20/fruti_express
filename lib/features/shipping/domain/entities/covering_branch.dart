// lib/features/shipping/domain/entities/covering_branch.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'covering_branch.freezed.dart';

/// Sucursal que cubre una dirección, según `find_covering_branch`.
/// Las listas llegan ordenadas: primero la de envío más barato y,
/// si empatan, la más cercana.
@freezed
abstract class CoveringBranch with _$CoveringBranch {
  const factory CoveringBranch({
    required String branchId,
    required double distanceKm,
    required int shippingCost,
  }) = _CoveringBranch;
}