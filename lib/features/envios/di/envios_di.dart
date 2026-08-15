import 'package:fruti_express_jahr_admin/features/envios/data/datasources/envios_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/datasources/envios_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/repositories_impl/envio_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/services_impl/envio_service_impl.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/strategies_impl/distance_pricing_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/strategies_impl/haversine_distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/strategies_impl/radius_coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/repositories/envios_repository.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/services/envio_service.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/strategies/pricing_strategy.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/calcular_cotizacion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/eliminar_tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/guardar_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/guardar_tarifa_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_sucursales_con_envio_configurado.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/obtener_tarifas_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/use_cases/validar_cobertura_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/coordinador_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/envios/presentation/cubits/envio_cliente_cubit.dart';
import 'package:get_it/get_it.dart';

void initEnvios(GetIt sl) {
  // --- ESTRATEGIAS ---
  sl.registerLazySingleton<DistanceStrategy>(() => HaversineDistanceStrategy());
  sl.registerLazySingleton<CoverageStrategy>(() => RadiusCoverageStrategy());
  sl.registerLazySingleton<PricingStrategy>(() => DistancePricingStrategy());

  // --- SERVICIOS ---
  sl.registerLazySingleton<EnvioService>(
    () => EnvioServiceImpl(
      distanceStrategy: sl(),
      coverageStrategy: sl(),
      pricingStrategy: sl(),
    ),
  );

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => CalcularCotizacionEnvioUseCase(sl(), sl()));
  sl.registerLazySingleton(() => ValidarCoberturaEnvioUseCase(sl(), sl()));
  sl.registerLazySingleton(() => ObtenerConfiguracionEnvioUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerTarifasEnvioUseCase(sl()));
  sl.registerLazySingleton(() => GuardarConfiguracionEnvioUseCase(sl()));
  sl.registerLazySingleton(() => GuardarTarifaEnvioUseCase(sl()));
  sl.registerLazySingleton(() => EliminarTarifaEnvioUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerSucursalesConEnvioConfiguradoUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<EnvioRepository>(() => EnvioRepositoryImpl(sl()));

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<EnviosRemoteDatasource>(
    () => EnviosRemoteDatasourceImpl(sl()),
  );

  // --- CUBITS ---
  sl.registerFactory(
    () => EnvioAdminCubit(
      obtenerConfiguracion: sl(),
      obtenerTarifas: sl(),
      guardarConfiguracion: sl(),
      guardarTarifa: sl(),
      eliminarTarifa: sl(),
    ),
  );

  sl.registerFactory(() => EnvioClienteCubit(obtenerConfiguracion: sl()));

  sl.registerFactory<CoordinadorClienteCubit>(
    () => CoordinadorClienteCubit(
      carritoCubit: sl(),
      productosCubit: sl(),
      sucursalCubit: sl(),
      envioClienteCubit: sl(),
      direccionesCubit: sl(),
    ),
  );
}
