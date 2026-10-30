import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fruti_express_jahr_admin/core/types/coordinates.dart';
import 'package:fruti_express_jahr_admin/core/widgets/map_selector_page.dart';
import 'package:latlong2/latlong.dart';
import 'location_service.dart';

class MapboxServiceImpl implements LocationService {
  // Pega aquí tu token gratuito de Mapbox
  final String _mapboxToken = dotenv.get('MAPBOX_PUBLIC_TOKEN');

  @override
  // Usamos el estilo 'streets-v12' de Mapbox, que es súper limpio y profesional.
  // El '@2x' al final hace que el mapa se vea en alta resolución (Retina).
  String get mapProviderUrl =>
      'https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/256/{z}/{x}/{y}@2x?access_token=$_mapboxToken';

  @override
  Future<Coordinates?> selectOnMap(
    BuildContext context, {
    Coordinates? initialLocation,
  }) async {
    return await Navigator.push<Coordinates>(
      context,
      MaterialPageRoute<Coordinates>(
        // 1. Agregamos <Coordinates> aquí
        builder: (_) => MapSelectorPage(
          // 2. Cambiamos (context) por (_)
          mapProviderUrl: mapProviderUrl,
          initialLocation: initialLocation,
        ),
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
    final meters = distance(LatLng(lat1, lon1), LatLng(lat2, lon2));
    return meters / 1000.0;
  }
}
