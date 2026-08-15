import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';
import 'package:fruti_express_jahr_admin/core/widgets/mapa_selector_page.dart';
import 'package:latlong2/latlong.dart';
import 'ubicacion_service.dart';

class OpenStreetMapServiceImpl implements UbicacionService {
  @override
  String get urlProveedorMapas =>
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  Future<Coordenadas?> seleccionarEnMapa(
    BuildContext context, {
    Coordenadas? ubicacionInicial,
  }) async {
    return await Navigator.push<Coordenadas>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MapaSelectorPage(ubicacionInicial: ubicacionInicial),
      ),
    );
  }

  @override
  double calcularDistancia({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const distance = Distance(); 

    final metros = distance(LatLng(lat1, lon1), LatLng(lat2, lon2));

    return metros / 1000.0; 
  }
}
