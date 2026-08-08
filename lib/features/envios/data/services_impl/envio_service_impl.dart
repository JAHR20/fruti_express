import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/cotizacion_envio.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/motivo_noDisponible.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/services/envio_service.dart';

// Importamos las estrategias
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/pricing_strategy.dart';

class EnvioServiceImpl implements EnvioService {
  final DistanceStrategy _distanceStrategy;
  final CoverageStrategy _coverageStrategy;
  final PricingStrategy _pricingStrategy;

  EnvioServiceImpl({
    required DistanceStrategy distanceStrategy,
    required CoverageStrategy coverageStrategy,
    required PricingStrategy pricingStrategy,
  })  : _distanceStrategy = distanceStrategy,
        _coverageStrategy = coverageStrategy,
        _pricingStrategy = pricingStrategy;

  @override
  Either<String, CotizacionEnvio> calcularCotizacion({
    required Sucursal sucursal,
    required Direccion direccion,
    required ConfiguracionEnvio configuracion,
    required List<TarifaEnvio> tarifas,
  }) {
    if (!configuracion.activa) {
      return Right(CotizacionEnvio(
        sucursalId: sucursal.id,
        disponible: false,
        distanciaKm: 0,
        costoEnvio: 0,
        motivo: MotivoNoDisponible.sucursalSinEnvios,
      ));
    }

    if (sucursal.latitud == null || sucursal.longitud == null) {
      return const Left('Error crítico: La sucursal no tiene coordenadas GPS.');
    }

    // 1. Delegamos el cálculo de distancia
    final distanciaKm = _distanceStrategy.calcularKm(
      lat1: sucursal.latitud!,
      lng1: sucursal.longitud!,
      lat2: direccion.latitud,
      lng2: direccion.longitud,
    );

    // 2. Delegamos la validación de cobertura
    if (!_coverageStrategy.tieneCobertura(
      distanciaKm: distanciaKm,
      radioMaxKm: configuracion.radioMaximoKm,
    )) {
      return Right(CotizacionEnvio(
        sucursalId: sucursal.id,
        disponible: false,
        distanciaKm: double.parse(distanciaKm.toStringAsFixed(2)),
        costoEnvio: 0,
        motivo: MotivoNoDisponible.fueraDeCobertura,
      ));
    }

    // 3. Delegamos el cálculo del precio
    final precioResult = _pricingStrategy.obtenerCosto(
      distanciaKm: distanciaKm,
      tarifas: tarifas,
    );

    // Mapeamos el resultado de la estrategia de precios
    return precioResult.fold(
      (error) => Left(error), // Ej: "No hay tarifa para la distancia de 8.5km"
      (costo) => Right(CotizacionEnvio(
        sucursalId: sucursal.id,
        disponible: true,
        distanciaKm: double.parse(distanciaKm.toStringAsFixed(2)),
        costoEnvio: costo,
      )),
    );
  }

  @override
  bool validarCobertura({
    required Sucursal sucursal,
    required Direccion direccion,
    required ConfiguracionEnvio configuracion,
  }) {
    if (!configuracion.activa || sucursal.latitud == null || sucursal.longitud == null) {
      return false;
    }

    final distancia = _distanceStrategy.calcularKm(
      lat1: sucursal.latitud!,
      lng1: sucursal.longitud!,
      lat2: direccion.latitud,
      lng2: direccion.longitud,
    );

    return _coverageStrategy.tieneCobertura(
      distanciaKm: distancia,
      radioMaxKm: configuracion.radioMaximoKm,
    );
  }
}