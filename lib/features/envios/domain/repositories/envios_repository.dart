import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';


abstract class EnvioRepository {
  // --- ⚙️ CONFIGURACIÓN ---
  ResultTask<ConfiguracionEnvio?> obtenerConfiguracion(String sucursalId);
  ResultTask<Unit> guardarConfiguracion(ConfiguracionEnvio configuracion);

  // --- 💰 TARIFAS ---
  ResultTask<List<TarifaEnvio>> obtenerTarifas(String sucursalId);
  ResultTask<Unit> guardarTarifa(TarifaEnvio tarifa);
  ResultTask<Unit> eliminarTarifa(String tarifaId);
}