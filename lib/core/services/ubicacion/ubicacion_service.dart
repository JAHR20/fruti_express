import 'package:flutter/material.dart';
import 'package:fruti_express_jahr_admin/core/types/coordenadas.dart';

abstract class UbicacionService {
  Future<Coordenadas?> seleccionarEnMapa(
    BuildContext context, {
    Coordenadas? ubicacionInicial,
  });

  String get urlProveedorMapas;

  double calcularDistancia({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  });
}