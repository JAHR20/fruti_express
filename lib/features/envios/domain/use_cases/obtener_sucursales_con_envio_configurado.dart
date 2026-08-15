import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';

class ObtenerSucursalesConEnvioConfiguradoUseCase {
  final EnvioRepository _repository;

  ObtenerSucursalesConEnvioConfiguradoUseCase(this._repository);

  ResultTask<Set<String>> call() {
    return _repository.obtenerSucursalesConEnvioConfigurado();
  }
}