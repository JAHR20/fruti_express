import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/cotizacion_envio.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';


abstract class EnvioService {
  Either<String, CotizacionEnvio> calcularCotizacion({
    required Sucursal sucursal, 
    required Direccion direccion,
    required ConfiguracionEnvio configuracion,
    required List<TarifaEnvio> tarifas,
  });

  bool validarCobertura({
    required Sucursal sucursal,
    required Direccion direccion,
    required ConfiguracionEnvio configuracion,
  });
}