import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/errors/failure_code.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/pricing_strategy.dart';

class DistancePricingStrategy implements PricingStrategy {
  @override
  Either<Failure, int> getCost({ 
    required double distanceKm, 
    required List<ShippingRate> rates, 
  }) {
    final activeRates = rates.where((t) => t.isActive).toList(); 

    if (activeRates.isEmpty) {
      return const Left(Failure.validation(FailureCode.noActiveRatesFound));
    }

    try {
      final correspondingRate = activeRates.firstWhere(
        (t) => distanceKm >= t.minDistanceKm && distanceKm <= t.maxDistanceKm,
      );

      return Right(correspondingRate.cost);
      
    } catch (e) {
      return const Left(Failure.validation(FailureCode.noRateForDistance));
    }
  }
}