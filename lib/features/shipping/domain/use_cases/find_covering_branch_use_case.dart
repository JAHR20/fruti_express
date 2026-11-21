// lib/features/shipping/domain/use_cases/find_covering_branch_use_case.dart
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/covering_branch.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';

/// Pide al servidor las sucursales que cubren una dirección.
/// La lista llega ordenada: primero la de envío más barato y, si empatan,
/// la más cercana. Una lista vacía significa "sin cobertura".
class FindCoveringBranchUseCase {
  final ShippingRepository _repository;

  FindCoveringBranchUseCase(this._repository);

  ResultTask<List<CoveringBranch>> execute({required Address address}) {
    return _repository.findCoveringBranches(
      latitude: address.latitude,
      longitude: address.longitude,
      zipCode: address.zipCode,
    );
  }
}