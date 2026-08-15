import 'package:fruti_express_jahr_admin/features/envios/data/models/configuracion_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/tarifa_envio_model.dart';

abstract class EnviosRemoteDatasource {
  Future<ConfiguracionEnvioModel?> obtenerConfiguracion(String sucursalId);
  Future<List<TarifaEnvioModel>> obtenerTarifas(String sucursalId);
  Future<void> guardarConfiguracion(ConfiguracionEnvioModel configuracion);
  Future<void> guardarTarifa(TarifaEnvioModel tarifa);
  Future<void> eliminarTarifa(String tarifaId);
  Future<Set<String>> obtenerSucursalesConEnvioConfigurado();
}