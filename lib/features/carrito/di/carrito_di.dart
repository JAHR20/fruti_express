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

  // 2. Lo registramos globalmente para que cualquier feature pueda usarlo
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GuardarCarritoUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerCarritoUseCase(sl()));
  sl.registerLazySingleton(() => VaciarCarritoUseCase(sl()));

  // 3. Repositorio (Dominio -> Datos)
  sl.registerLazySingleton<CarritoRepository>(
    () => CarritoRepositoryImpl(localDataSource: sl()),
  );

  // 4. Data Source (Datos)
  // Aquí es donde ocurre la magia: le pedimos a GetIt (sl) que inyecte el SharedPreferences global
  sl.registerLazySingleton<CarritoLocalDatasource>(
    () => CarritoLocalDatasourceImpl(sharedPreferences: sl()),
  );

  // --- CUBIT ---
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
