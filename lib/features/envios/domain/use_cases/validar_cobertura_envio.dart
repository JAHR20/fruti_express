import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/services/envio_service.dart';

class ValidarCoberturaEnvioUseCase {
  final EnvioRepository _repository;
  final EnvioService _service;

  ValidarCoberturaEnvioUseCase(this._repository, this._service);

  ResultTask<bool> call({
    required Sucursal sucursal,
    required Direccion direccion,
  }) {
    return _repository.obtenerConfiguracion(sucursal.id).map((configuracion) {
      if (configuracion == null) return false;
      return _service.validarCobertura(
        sucursal: sucursal,
        direccion: direccion,
        configuracion: configuracion,
      );
    });
  }
}