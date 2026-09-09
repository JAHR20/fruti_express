import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';

class GetShippingRatesUseCase { 
  final ShippingRepository _repository;

  GetShippingRatesUseCase(this._repository);

  ResultTask<List<ShippingRate>> execute(String branchId) { 
    if (branchId.trim().isEmpty) {
      return TaskEither.left(const Failure.validation(FailureCode.invalidBranchId));
    }

    return _repository.getRates(branchId);
  }
}