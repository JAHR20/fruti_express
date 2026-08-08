import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/pricing_strategy.dart';

class DistancePricingStrategy implements PricingStrategy {
  @override
  Either<String, int> obtenerCosto({
    required double distanciaKm,
    required List<TarifaEnvio> tarifas,
  }) {
    // Filtramos solo las tarifas que estén activas
    final tarifasActivas = tarifas.where((t) => t.activa).toList();

    if (tarifasActivas.isEmpty) {
      return const Left('No hay tarifas de envío activas en esta sucursal.');
    }

    try {
      // Buscamos la tarifa donde la distancia caiga dentro del rango min y max
      final tarifaCorrespondiente = tarifasActivas.firstWhere(
        (t) => distanciaKm >= t.distanciaMinKm && distanciaKm <= t.distanciaMaxKm,
      );

      return Right(tarifaCorrespondiente.costo);
      
    } catch (e) {
      // firstWhere lanza un StateError si no encuentra ninguna coincidencia
      return Left('No se encontró una tarifa para la distancia de ${distanciaKm.toStringAsFixed(1)} km.');
    }
  }
}