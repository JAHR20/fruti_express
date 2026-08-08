import 'dart:math' as math;
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/distance_strategy.dart';

class HaversineDistanceStrategy implements DistanceStrategy {
  static const double _radioTierraKm = 6371.0;

  @override
  double calcularKm({
    required double lat1,
    required double lng1,
    required double lat2,
    required double lng2,
  }) {
    final dLat = _gradosARadianes(lat2 - lat1);
    final dLon = _gradosARadianes(lng2 - lng1);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_gradosARadianes(lat1)) *
            math.cos(_gradosARadianes(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return _radioTierraKm * c;
  }

  double _gradosARadianes(double grados) {
    return grados * (math.pi / 180.0);
  }
}