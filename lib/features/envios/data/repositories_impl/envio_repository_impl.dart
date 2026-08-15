import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/configuracion_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/tarifa_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/datasources/envios_remote_datasource.dart';

class EnvioRepositoryImpl with SupabaseHandleException implements EnvioRepository {
  final EnviosRemoteDatasource _remoteDatasource;

  EnvioRepositoryImpl(this._remoteDatasource);

  @override
  ResultTask<ConfiguracionEnvio?> obtenerConfiguracion(String sucursalId) {
    return TaskEither.tryCatch(
      () async {
        final modelo = await _remoteDatasource.obtenerConfiguracion(sucursalId);
        return modelo?.toEntity();
      },
      handleException
    );
  }

  @override
  ResultTask<List<TarifaEnvio>> obtenerTarifas(String sucursalId) {
    return TaskEither.tryCatch(
      () async {
        final modelos = await _remoteDatasource.obtenerTarifas(sucursalId);
        return modelos.map((modelo) => modelo.toEntity()).toList();
      },
      handleException
    );
  }

  @override
  ResultTask<Unit> guardarConfiguracion(ConfiguracionEnvio configuracion) {
    return TaskEither.tryCatch(
      () async {
        final modelo = ConfiguracionEnvioModel.fromEntity(configuracion);
        await _remoteDatasource.guardarConfiguracion(modelo);
        return unit;
      },
      handleException
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
      handleException
    );
  }

  @override
  ResultTask<Unit> eliminarTarifa(String tarifaId) {
    return TaskEither.tryCatch(
      () async {
        await _remoteDatasource.eliminarTarifa(tarifaId);
        return unit;
      },
      handleException
    );
  }

  @override
  ResultTask<Set<String>> obtenerSucursalesConEnvioConfigurado() {
    return TaskEither.tryCatch(
      () async {
        return await _remoteDatasource.obtenerSucursalesConEnvioConfigurado();
      },
      handleException
    );
  }
}
