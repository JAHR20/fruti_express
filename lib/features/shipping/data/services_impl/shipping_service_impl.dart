import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_quote.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/entities/address.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_config.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/enums/unavailable_reason.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/services/shipping_service.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/pricing_strategy.dart';

class ShippingServiceImpl implements ShippingService {
  final DistanceStrategy _distanceStrategy;
  final CoverageStrategy _coverageStrategy;
  final PricingStrategy _pricingStrategy;

  ShippingServiceImpl({
    required DistanceStrategy distanceStrategy,
    required CoverageStrategy coverageStrategy,
    required PricingStrategy pricingStrategy,
  })  : _distanceStrategy = distanceStrategy,
        _coverageStrategy = coverageStrategy,
        _pricingStrategy = pricingStrategy;

  @override
  Either<Failure, ShippingQuote> calculateQuote({
    required Branch branch,
    required Address address,
    required ShippingConfig config,
    required List<ShippingRate> rates,
  }) {
    if (!config.isActive) {
      return Right(ShippingQuote(
        branchId: branch.id,
        isAvailable: false,
        distanceKm: 0,
        shippingCost: 0,
        reason: UnavailableReason.branchWithoutShipping,
      ));
    }

    if (branch.latitude == null || branch.longitude == null) {
      return const Left(Failure.validation(FailureCode.branchWithoutCoordinates));
    }

    final distanceKm = _distanceStrategy.calculateKm(
      lat1: branch.latitude!,
      lng1: branch.longitude!,
      lat2: address.latitude,
      lng2: address.longitude,
    );

    if (!_coverageStrategy.hasCoverage(
      distanceKm: distanceKm,
      maxRadiusKm: config.maxRadiusKm,
    )) {
      return Right(ShippingQuote(
        branchId: branch.id,
        isAvailable: false,
        distanceKm: double.parse(distanceKm.toStringAsFixed(2)),
        shippingCost: 0,
        reason: UnavailableReason.outOfCoverage,
      ));
    }

    final priceResult = _pricingStrategy.getCost(
      distanceKm: distanceKm,
      rates: rates,
    );

    return priceResult.fold(
      (failure) => Left(failure),
      (cost) => Right(ShippingQuote(
        branchId: branch.id,
        isAvailable: true,
        distanceKm: double.parse(distanceKm.toStringAsFixed(2)),
        shippingCost: cost,
      )),
    );
  }

  @override
  bool validateCoverage({
    required Branch branch,
    required Address address,
    required ShippingConfig config,
  }) {
    if (!config.isActive || branch.latitude == null || branch.longitude == null) {
      return false;
    }

    final distance = _distanceStrategy.calculateKm(
      lat1: branch.latitude!,
      lng1: branch.longitude!,
      lat2: address.latitude,
      lng2: address.longitude,
    );

    return _coverageStrategy.hasCoverage(
      distanceKm: distance,
      maxRadiusKm: config.maxRadiusKm,
    );
  }
}