import 'package:get_it/get_it.dart';

// Data Sources
import '../data/datasources/direccion_remote_datasource.dart';
import '../data/datasources/direccion_remote_datasource_impl.dart';

// Repositories
import '../data/repositories_impl/direccion_repository_impl.dart';
import '../domain/repositories/direccion_repository.dart';

// Use Cases
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/actualizar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/crear_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/eliminar_direccion_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/establecer_direccion_principal_use_case.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/use_cases/obtener_direcciones_use_case.dart';

void initDirecciones(GetIt sl) {
  // --- 🧠 CASOS DE USO (Use Cases) ---

  // Obtener direcciones de un usuario específico
  sl.registerLazySingleton(() => ObtenerDireccionesUseCase(sl()));

  // Gestión de direcciones (CRUD)
  // Nota: Si CrearDireccion necesita validar al usuario,
  // puedes pasarle usuarioRepository: sl() igual que hicimos en productos.
  sl.registerLazySingleton(() => CrearDireccionUseCase(sl()));
  sl.registerLazySingleton(() => ActualizarDireccionUseCase(sl()));
  sl.registerLazySingleton(() => EliminarDireccionUseCase(sl()));

  // Regla de negocio: Solo puede haber una dirección predeterminada
  sl.registerLazySingleton(() => EstablecerDireccionPrincipalUseCase(sl()));

  // --- 🤝 REPOSITORIO (Repository) ---
  sl.registerLazySingleton<DireccionRepository>(
    () => DireccionRepositoryImpl(sl()),
  );

  // --- 🛰️ FUENTE DE DATOS (Data Source) ---
  sl.registerLazySingleton<DireccionRemoteDatasource>(
    () => DireccionRemoteDatasourceImpl(sl()),
  );
}
