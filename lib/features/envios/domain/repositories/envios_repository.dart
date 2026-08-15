import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';


abstract class EnvioRepository {
  ResultTask<ConfiguracionEnvio?> obtenerConfiguracion(String sucursalId);
  ResultTask<Unit> guardarConfiguracion(ConfiguracionEnvio configuracion);
  ResultTask<List<TarifaEnvio>> obtenerTarifas(String sucursalId);
  ResultTask<Set<String>> obtenerSucursalesConEnvioConfigurado();
  ResultTask<Unit> guardarTarifa(TarifaEnvio tarifa);
  ResultTask<Unit> eliminarTarifa(String tarifaId);
}