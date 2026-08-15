import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaRadioCoberturaWidget extends StatelessWidget {
  final LatLng centro;
  final double radioKm;
  final String mapUrl;

  const MapaRadioCoberturaWidget({
    super.key,
    required this.centro,
    required this.radioKm,
    required this.mapUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: centro,
            initialZoom: 13.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: mapUrl,
            ),
            CircleLayer(
              circles: [
                CircleMarker(
                  point: centro,
                  radius: radioKm * 1000,
                  useRadiusInMeter: true,
                  color: Colors.blue.withValues(alpha: 0.2),
                  borderColor: Colors.blue,
                  borderStrokeWidth: 2,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: centro,
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.store, color: Colors.red, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}