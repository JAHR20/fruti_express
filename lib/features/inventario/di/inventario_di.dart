import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/aumentar_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/confirmar_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/liberar_reserva.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/obtener_inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/obtener_inventario_por_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/obtener_stock_actual.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/reducir_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/use_cases/reservar_stock.dart';
import 'package:fruti_express_jahr_admin/features/inventario/presentation/cubits/inventario_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/inventario_remote_datasource.dart';
import '../data/datasources/inventario_remote_datasource_impl.dart';
import '../data/repositories_impl/inventario_repository_impl.dart';
import '../domain/repositories/inventario_repository.dart';

void initInventario(GetIt sl) {

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => AumentarStock(sl()));
  sl.registerLazySingleton(() => ConfirmarStock(sl()));
  sl.registerLazySingleton(() => LiberarReserva(sl()));
  sl.registerLazySingleton(() => ObtenerInventarioPorProducto(sl()));
  sl.registerLazySingleton(() => ObtenerInventarioPorSucursal(sl()));
  sl.registerLazySingleton(() => ReducirStock(sl()));
  sl.registerLazySingleton(() => ReservarStock(sl()));
  sl.registerLazySingleton(() => ObtenerStockActual(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<InventarioRepository>(
    () => InventarioRepositoryImpl(sl()),
  );

  // --- DATA SOURCES ---
  sl.registerLazySingleton<InventarioRemoteDatasource>(
    () => InventarioRemoteDatasourceImpl(sl()),
  );

  // -- Cubits ----
  sl.registerFactory<InventarioCubit>(
    () => InventarioCubit(
      obtenerInventarioPorSucursalUseCase: sl(),
      aumentarStockUseCase: sl(),
      reducirStockUseCase: sl()
    ),
  );
}
