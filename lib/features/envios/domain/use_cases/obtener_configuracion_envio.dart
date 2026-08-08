import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';

class ObtenerConfiguracionEnvioUseCase {
  final EnvioRepository _repository;

  ObtenerConfiguracionEnvioUseCase(this._repository);

  ResultTask<ConfiguracionEnvio?> call(String sucursalId) {
    return _repository.obtenerConfiguracion(sucursalId);
  }
}