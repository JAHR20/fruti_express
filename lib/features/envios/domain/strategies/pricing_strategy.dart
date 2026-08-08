import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';

abstract class PricingStrategy {
  Either<String, int> obtenerCosto({
    required double distanciaKm,
    required List<TarifaEnvio> tarifas,
  });
}