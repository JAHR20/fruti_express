import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart'; 

class MapaSelectorPage extends StatefulWidget {
  final Coordenadas? ubicacionInicial;

  const MapaSelectorPage({
    super.key,
    this.ubicacionInicial,
  });

  @override
  State<MapaSelectorPage> createState() => _MapaSelectorPageState();
}

class _MapaSelectorPageState extends State<MapaSelectorPage> {
  late LatLng _posicionActual;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    if (widget.ubicacionInicial != null) {
      _posicionActual = LatLng(
        widget.ubicacionInicial!.latitud,
        widget.ubicacionInicial!.longitud,
      );
    } else {
      _posicionActual = const LatLng(19.4326, -99.1332); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Ubicación'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _posicionActual,
              initialZoom: 15.0,
              onTap: (tapPosition, point) {
                setState(() {
                  _posicionActual = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.tuempresa.frutiexpressadmin', 
              ),
              // La capa donde dibujamos el marcador rojo
              MarkerLayer(
                markers: [
                  Marker(
                    point: _posicionActual,
                    width: 50.0,
                    height: 50.0,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: const [
                    Icon(Icons.touch_app, color: Color(0xFF1E3A8A)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Toca cualquier punto en el mapa para mover el marcador.',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 16,
            bottom: 80, 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  mini: true,
                  heroTag: 'btnZoomIn',
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.add, color: Colors.black87),
                  onPressed: () {
                    final zoomActual = _mapController.camera.zoom;
                    _mapController.move(_mapController.camera.center, zoomActual + 1);
                  },
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  mini: true,
                  heroTag: 'btnZoomOut',
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.remove, color: Colors.black87),
                  onPressed: () {
                    final zoomActual = _mapController.camera.zoom;
                    _mapController.move(_mapController.camera.center, zoomActual - 1);
                  },
                ),
              ],
            ),
          ),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.check),
        label: const Text('Confirmar Ubicación', style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          final seleccion = Coordenadas(
            latitud: _posicionActual.latitude,
            longitud: _posicionActual.longitude,
          );
          Navigator.of(context).pop(seleccion);
        },
      ),
    );
  }
}