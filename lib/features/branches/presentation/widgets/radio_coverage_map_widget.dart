import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RadioCoverageMapWidget extends StatelessWidget {
  final LatLng center;
  final double radiusKm;
  final String mapUrl;

  const RadioCoverageMapWidget({
    super.key,
    required this.center,
    required this.radiusKm,
    required this.mapUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: FlutterMap(
          options: MapOptions(
            initialCenter: center,
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
                  point: center,
                  radius: radiusKm * 1000,
                  useRadiusInMeter: true,
                  color: colorScheme.primary.withValues(alpha: 0.15), 
                  borderColor: colorScheme.primary, // 👈 Borde sólido
                  borderStrokeWidth: 2,
                ),
              ],
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: center,
                  width: 40,
                  height: 40,
                  child: Icon(Icons.store, color: colorScheme.secondary, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}