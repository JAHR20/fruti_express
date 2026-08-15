import 'package:fruti_express_jahr_admin/features/sucursales/data/repositories/sucursal_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/actualizar_cobertura_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/cambiar_estado_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/editar_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_cobertura.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/obtener_ubicacion_por_codigo_postal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/sucursal_cubit.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/presentation/cubits/wizard_sucursal_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/sucursal_remote_datasource.dart';
import '../data/datasources/sucursal_remote_datasource_impl.dart';
import '../domain/repositories/sucursal_repository.dart';
import '../domain/use_cases/obtener_sucursales.dart';
import '../domain/use_cases/crear_sucursal.dart';

void initSucursales(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerSucursales(sl()));
  sl.registerLazySingleton(() => CrearSucursal(sl()));
  sl.registerLazySingleton(() => CambiarEstadoSucursal(sl()));
  sl.registerLazySingleton(() => EditarSucursal(sl()));
  sl.registerLazySingleton(() => ObtenerCobertura(sl()));
  sl.registerLazySingleton(() => ActualizarCoberturaSucursal(sl()));
  sl.registerLazySingleton(()=> ObtenerUbicacionPorCodigoPostal(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<SucursalRepository>(
    () => SucursalRepositoryImpl(sl()),
  );

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<SucursalRemoteDatasource>(
    () => SucursalRemoteDatasourceImpl(sl()),
  );

  // --- CUBITS ---
  sl.registerFactory<SucursalCubit>(
    () => SucursalCubit(
      obtenerSucursalesUseCase: sl(),
      cambiarEstadoSucursalUseCase: sl(),
      obtenerSucursalesConEnvioConfiguradoUseCase: sl(),
    ),
  );

  sl.registerFactory<WizardSucursalCubit>(
    () => WizardSucursalCubit(
      crearSucursalUseCase: sl(),
      editarSucursalUseCase: sl(),
      obtenerCoberturaUseCase: sl(),
      obtenerUbicacionPorCodigoPostalUseCase: sl(),
      actualizarCoberturaSucursalUseCase: sl(),
      guardarConfiguracionEnvioUseCase: sl(),
      obtenerConfiguracionEnvioUseCase: sl()
    ),
  );
}
