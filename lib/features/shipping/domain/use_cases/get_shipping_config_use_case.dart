import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';

class GetShippingConfigUseCase { 
  final ShippingRepository _repository;

  GetShippingConfigUseCase(this._repository);

  ResultTask<ShippingConfig?> execute(String branchId) { 
    if (branchId.trim().isEmpty) {
      return TaskEither.left(const Failure.validation(FailureCode.invalidBranchId));
    }
    
    return _repository.getConfig(branchId);
  }
}