import 'package:fruti_express_jahr_admin/features/direcciones/presentation/cubits/direcciones_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/direccion_remote_datasource.dart';
import '../data/datasources/direccion_remote_datasource_impl.dart';
import '../data/repositories_impl/direccion_repository_impl.dart';
import '../domain/repositories/direccion_repository.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/actualizar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/crear_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/eliminar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/establecer_direccion_principal_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/obtener_direcciones_use_case.dart';

void initDirecciones(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerDireccionesUseCase(sl()));
  sl.registerLazySingleton(() => CrearDireccionUseCase(sl()));
  sl.registerLazySingleton(() => ActualizarDireccionUseCase(sl()));
  sl.registerLazySingleton(() => EliminarDireccionUseCase(sl()));
  sl.registerLazySingleton(() => EstablecerDireccionPrincipalUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<DireccionRepository>(
    () => DireccionRepositoryImpl(sl()),
  );

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<DireccionRemoteDatasource>(
    () => DireccionRemoteDatasourceImpl(sl()),
  );


  // --- CUBITS ---
  sl.registerFactory<DireccionesCubit>(
    () => DireccionesCubit(
      obtenerDirecciones: ObtenerDireccionesUseCase(sl()),
      crearDireccion: CrearDireccionUseCase(sl()),
      actualizarDireccion: ActualizarDireccionUseCase(sl()),
      eliminarDireccion: EliminarDireccionUseCase(sl()),
      establecerPrincipal: EstablecerDireccionPrincipalUseCase(sl()),
    ),
  );
}
