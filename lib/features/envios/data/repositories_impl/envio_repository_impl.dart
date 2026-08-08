import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart'; // Tu clase de errores (Failure)
import 'package:fruti_express_jahr_admin/core/types/result.dart'; // Donde tienes ResultTask
import 'package:fruti_express_jahr_admin/features/envios/data/models/configuracion_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/tarifa_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/datasources/envios_remote_datasource.dart';

class EnvioRepositoryImpl implements EnvioRepository {
  final EnviosRemoteDatasource _remoteDatasource;

  EnvioRepositoryImpl(this._remoteDatasource);

  @override
  ResultTask<ConfiguracionEnvio?> obtenerConfiguracion(String sucursalId) {
    // TaskEither.tryCatch atrapa automáticamente cualquier crash o excepción
    return TaskEither.tryCatch(
      () async {
        final modelo = await _remoteDatasource.obtenerConfiguracion(sucursalId);

        // Si el modelo es null (no hay configuración), devolvemos null.
        // Si existe, lo convertimos a la Entidad pura de tu Dominio.
        return modelo?.toEntity();
      },
      (error, stackTrace) {
        // Si el error ya es un Failure (lanzado por el Datasource), lo pasamos tal cual
        if (error is Failure) return error;

        // Si es un error desconocido (ej. se cayó el internet a medio vuelo), lo envolvemos
        return Failure.server(error.toString());
      },
    );
  }

  @override
  ResultTask<List<TarifaEnvio>> obtenerTarifas(String sucursalId) {
    return TaskEither.tryCatch(
      () async {
        final modelos = await _remoteDatasource.obtenerTarifas(sucursalId);

        // Mapeamos la lista de Modelos a una lista de Entidades
        return modelos.map((modelo) => modelo.toEntity()).toList();
      },
      (error, stackTrace) {
        if (error is Failure) return error;

        return Failure.server(error.toString());
      },
    );
  }

  @override
  ResultTask<Unit> guardarConfiguracion(ConfiguracionEnvio configuracion) {
    return TaskEither.tryCatch(
      () async {
        final modelo = ConfiguracionEnvioModel.fromEntity(configuracion);
        await _remoteDatasource.guardarConfiguracion(modelo);
        return unit; // unit viene de fpdart
      },
      (error, stackTrace) =>
          error is Failure ? error : Failure.server(error.toString()),
    );
  }

  @override
  ResultTask<Unit> guardarTarifa(TarifaEnvio tarifa) {
    return TaskEither.tryCatch(
      () async {
        final modelo = TarifaEnvioModel.fromEntity(tarifa);
        await _remoteDatasource.guardarTarifa(modelo);
        return unit;
      },
      (error, stackTrace) =>
          error is Failure ? error : Failure.server(error.toString()),
    );
  }

  @override
  ResultTask<Unit> eliminarTarifa(String tarifaId) {
    return TaskEither.tryCatch(
      () async {
        await _remoteDatasource.eliminarTarifa(tarifaId);
        return unit;
      },
      (error, stackTrace) =>
          error is Failure ? error : Failure.server(error.toString()),
    );
  }
}
