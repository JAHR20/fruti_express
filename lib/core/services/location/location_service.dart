import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';

abstract class LocationService {
  Future<Coordinates?> selectOnMap(
    BuildContext context, {
    Coordinates? initialLocation, 
  });

  String get mapProviderUrl;

  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  });
}