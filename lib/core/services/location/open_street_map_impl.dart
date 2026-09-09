import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';
import 'package:fruti_express_jahr_admin/core/widgets/map_selector_page.dart'; // mapa_selector_page -> map_selector_page
import 'package:latlong2/latlong.dart';
import 'location_service.dart';

class OpenStreetMapServiceImpl implements LocationService {
  @override
  String get mapProviderUrl =>
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  Future<Coordinates?> selectOnMap(
    BuildContext context, {
    Coordinates? initialLocation,
  }) async {
    return await Navigator.push<Coordinates>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MapSelectorPage(initialLocation: initialLocation), // MapaSelectorPage -> MapSelectorPage
      ),
    );
  }

  @override
  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const distance = Distance(); 

    final meters = distance(LatLng(lat1, lon1), LatLng(lat2, lon2)); // metros -> meters

    return meters / 1000.0; 
  }
}