import 'package:fruti_express_jahr_admin/features/carrito/data/datasources/carrito_local_datasource.dart';
import 'package:fruti_express_jahr_admin/features/carrito/data/datasources/carrito_local_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/carrito/data/repositories_impl/carrito_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/repositories/carrito_repository.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/guardar_carrito_usecase.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/obtener_carrito_usecase.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/use_cases/vaciar_carrito_usecase.dart';
import 'package:fruti_express_jahr_admin/features/carrito/presentation/cubits/carrito_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initCarrito(GetIt sl) async {

  final sharedPreferences = await SharedPreferences.getInstance();

  // REGSITRO DE SHARED PREFERENCES
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GuardarCarritoUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerCarritoUseCase(sl()));
  sl.registerLazySingleton(() => VaciarCarritoUseCase(sl()));

  // --- REPOSITORIES ---
  sl.registerLazySingleton<CarritoRepository>(
    () => CarritoRepositoryImpl(localDataSource: sl()),
  );

  // --- DATA SOURCES ----
  sl.registerLazySingleton<CarritoLocalDatasource>(
    () => CarritoLocalDatasourceImpl(sharedPreferences: sl()),
  );

  // --- CUBITS ---
  sl.registerFactory<CarritoCubit>(
    () => CarritoCubit(
      obtenerCarrito: sl(),
      guardarCarrito: sl(),
      vaciarCarritoUseCase: sl(),
      ubicacionService: sl(),
      obtenerStockActual: sl(),
    ),
  );
}
