import 'package:fruti_express_jahr_admin/features/cart/data/datasources/cart_local_datasource.dart';
import 'package:fruti_express_jahr_admin/features/cart/data/datasources/cart_local_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/cart/data/repositories_impl/cart_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/repositories/cart_repository.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/clear_cart_use_case.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:fruti_express_jahr_admin/features/cart/domain/use_cases/save_cart_use_case.dart';
import 'package:fruti_express_jahr_admin/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initCart(GetIt sl) async {

  final sharedPreferences = await SharedPreferences.getInstance();

  // REGSITRO DE SHARED PREFERENCES
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => SaveCartUseCase(sl()));
  sl.registerLazySingleton(() => GetCartUseCase(sl()));
  sl.registerLazySingleton(() => ClearCartUseCase(sl()));

  // --- REPOSITORIES ---
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(localDataSource: sl()),
  );

  // --- DATA SOURCES ----
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // --- CUBITS ---
  sl.registerFactory<CartCubit>(
    () => CartCubit(
      getCartUseCase: sl(),
      saveCartUseCase: sl(),
      clearCartUseCase: sl(),
      locationService: sl(),
      getCurrentStockUseCase: sl(),
      validateAndApplyCouponUseCase: sl(),
      getOrderPreviewUseCase: sl()
    ),
  );
}
