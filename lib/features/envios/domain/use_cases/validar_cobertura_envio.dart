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
    required Sucursal sucursal, // 👈 Ahora pedimos la entidad completa
    required Direccion direccion,
  }) {
    // Usamos el id de la sucursal para traer su configuración
    return _repository.obtenerConfiguracion(sucursal.id).map((configuracion) {
      
      // Si la sucursal no tiene reglas configuradas, asumimos que no hay cobertura
      if (configuracion == null) return false;

      // Retornamos directamente el resultado síncrono del servicio, pasando la sucursal
      return _service.validarCobertura(
        sucursal: sucursal, // 👈 Le pasamos la sucursal al servicio matemático
        direccion: direccion,
        configuracion: configuracion,
      );
    });
  }
}