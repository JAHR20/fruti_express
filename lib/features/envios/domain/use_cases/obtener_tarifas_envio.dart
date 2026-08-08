import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';

class ObtenerTarifasEnvioUseCase {
  final EnvioRepository _repository;

  ObtenerTarifasEnvioUseCase(this._repository);

  ResultTask<List<TarifaEnvio>> call(String sucursalId) {
    return _repository.obtenerTarifas(sucursalId);
  }
}