import 'package:fruti_express_jahr_admin/features/sucursales/data/repositories/sucursal_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/desactivar_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/use_cases/editar_sucursal.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/sucursal_remote_datasource.dart';
import '../data/datasources/sucursal_remote_datasource_impl.dart';
import '../domain/repositories/sucursal_repository.dart';
import '../domain/use_cases/obtener_sucursales.dart';
import '../domain/use_cases/crear_sucursal.dart';

void initSucursales(GetIt sl) {
  // --- 🧠 CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerSucursales(sl()));
  sl.registerLazySingleton(() => CrearSucursal(sl()));
  sl.registerLazySingleton(() => DesactivarSucursal(sl()));
  sl.registerLazySingleton(() => EditarSucursal(sl()));

  // --- 🤝 REPOSITORIO ---
  sl.registerLazySingleton<SucursalRepository>(
    () => SucursalRepositoryImpl(sl()),
  );

  // --- 🛰️ FUENTE DE DATOS ---
  sl.registerLazySingleton<SucursalRemoteDatasource>(
    () => SucursalRemoteDatasourceImpl(sl()),
  );
}
