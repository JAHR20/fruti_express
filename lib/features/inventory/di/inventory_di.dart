import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/get_inventory_by_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/increase_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/confirm_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/release_reservation_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/get_inventory_by_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/get_current_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/decrease_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/use_cases/reserve_stock_use_case.dart';
import 'package:fruti_express_jahr_admin/features/inventory/presentation/cubits/inventory_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/inventory_remote_datasource.dart';
import '../data/datasources/inventory_remote_datasource_impl.dart';
import '../data/repositories_impl/inventory_repository_impl.dart';
import '../domain/repositories/inventory_repository.dart';

void initInventory(GetIt sl) {

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => IncreaseStockUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmStockUseCase(sl()));
  sl.registerLazySingleton(() => ReleaseReservationUseCase(sl()));
  sl.registerLazySingleton(() => GetInventoryByProductUseCase(sl()));
  sl.registerLazySingleton(() => GetInventoryByBranchUseCase(sl()));
  sl.registerLazySingleton(() => DecreaseStockUseCase(sl()));
  sl.registerLazySingleton(() => ReserveStockUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentStockUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(sl()),
  );

  // --- DATA SOURCES ---
  sl.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImpl(sl()),
  );

  // -- Cubits ----
  sl.registerFactory<InventoryCubit>(
    () => InventoryCubit(
      getInventoryByBranchUseCase: sl(),
      increaseStockUseCase: sl(),
      decreaseStockUseCase: sl()
    ),
  );
}
