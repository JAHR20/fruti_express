import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/coverage_strategy.dart';

class RadiusCoverageStrategy implements CoverageStrategy {
  @override
  bool hasCoverage({ 
    required double distanceKm, 
    required double maxRadiusKm, 
  }) {
    return distanceKm <= maxRadiusKm;
  }
}