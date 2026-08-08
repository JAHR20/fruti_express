import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/cotizacion_envio.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/services/envio_service.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

class CalcularCotizacionEnvioUseCase {
  final EnvioRepository _repository;
  final EnvioService _service;

  CalcularCotizacionEnvioUseCase(this._repository, this._service);

  ResultTask<CotizacionEnvio> call({
    required Sucursal sucursal, // 👈 Recibimos la entidad completa
    required Direccion direccion,
  }) {
    // Usamos el ID de la sucursal para traer sus configuraciones
    return _repository.obtenerConfiguracion(sucursal.id).flatMap((configuracion) {
      if (configuracion == null) {
        return TaskEither.left(
          const Failure.notFound('No se encontró configuración de envío.'),
        );
      }

      return _repository.obtenerTarifas(sucursal.id).flatMap((tarifas) {
        
        final calculoResult = _service.calcularCotizacion(
          sucursal: sucursal, // 👈 Pasamos la entidad al servicio
          direccion: direccion,
          configuracion: configuracion,
          tarifas: tarifas,
        );

        return calculoResult.fold(
          (error) => TaskEither.left(Failure.validation(error)), 
          (cotizacion) => TaskEither.right(cotizacion),
        );
      });
    });
  }
}