import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/services/shipping_service.dart';

class ValidateShippingCoverageUseCase { 
  final ShippingRepository _repository;
  final ShippingService _service;

  ValidateShippingCoverageUseCase(this._repository, this._service);

  ResultTask<bool> execute({
    required Branch branch, 
    required Address address, 
  }) {
    if (branch.id.trim().isEmpty) {
      return TaskEither.left(const Failure.validation(FailureCode.invalidBranchId));
    }

    return _repository.getConfig(branch.id).map((config) {
      if (config == null) return false;
      
      if (!config.isActive) return false;

      return _service.validateCoverage(
        branch: branch,
        address: address,
        config: config,
      );
    });
  }
}