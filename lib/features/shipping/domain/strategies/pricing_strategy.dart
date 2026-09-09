import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/entities/shipping_rate.dart';

abstract class PricingStrategy {
  Either<Failure, int> getCost({
    required double distanceKm,
    required List<ShippingRate> rates,
  });
}