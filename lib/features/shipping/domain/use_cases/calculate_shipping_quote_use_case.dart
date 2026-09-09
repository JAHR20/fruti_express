import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_quote.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/services/shipping_service.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';

class CalculateShippingQuoteUseCase { 
  final ShippingRepository _repository;
  final ShippingService _service;

  CalculateShippingQuoteUseCase(this._repository, this._service);

  ResultTask<ShippingQuote> execute({
    required Branch branch, 
    required Address address, 
  }) {
    return _repository.getConfig(branch.id).flatMap((config) {
      if (config == null) {
        return TaskEither.left(
          const Failure.notFound(FailureCode.shippingConfigNotFound),
        );
      }

      return _repository.getRates(branch.id).flatMap((rates) {
        final calculationResult = _service.calculateQuote(
          branch: branch,
          address: address,
          config: config,
          rates: rates,
        );

        return TaskEither.fromEither(calculationResult);
      });
    });
  }
}