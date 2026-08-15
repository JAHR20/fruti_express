import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/pricing_strategy.dart';

class DistancePricingStrategy implements PricingStrategy {
  @override
  Either<String, int> obtenerCosto({
    required double distanciaKm,
    required List<TarifaEnvio> tarifas,
  }) {
    final tarifasActivas = tarifas.where((t) => t.activa).toList();

    if (tarifasActivas.isEmpty) {
      return const Left('No hay tarifas de envío activas en esta sucursal.');
    }

    try {
      final tarifaCorrespondiente = tarifasActivas.firstWhere(
        (t) => distanciaKm >= t.distanciaMinKm && distanciaKm <= t.distanciaMaxKm,
      );

      return Right(tarifaCorrespondiente.costo);
      
    } catch (e) {
      return Left('No se encontró una tarifa para la distancia de ${distanciaKm.toStringAsFixed(1)} km.');
    }
  }
}