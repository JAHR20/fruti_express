import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/coverage_strategy.dart';

class RadiusCoverageStrategy implements CoverageStrategy {
  @override
  bool tieneCobertura({
    required double distanciaKm,
    required double radioMaxKm,
  }) {
    return distanciaKm <= radioMaxKm;
  }
}