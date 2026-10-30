import 'package:fruti_express_jahr_admin/features/branches/data/repositories/branch_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_branches_with_configured_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/update_branch_coverage_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/change_branch_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_coverage_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/get_location_by_postal_code_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/update_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/use_cases/watch_branches_use_case.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/branch_cubit.dart';
import 'package:fruti_express_jahr_admin/features/branches/presentation/cubits/wizard_branch_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/branch_remote_datasource.dart';
import '../data/datasources/branch_remote_datasource_impl.dart';
import '../domain/repositories/branch_repository.dart';
import '../domain/use_cases/get_all_branches_use_case.dart';
import '../domain/use_cases/create_branch_use_case.dart';

void initBranches(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetAllBranchesUseCase(sl()));
  sl.registerLazySingleton(() => CreateBranchUseCase(sl()));
  sl.registerLazySingleton(() => ChangeBranchStatusUseCase(sl()));
  sl.registerLazySingleton(() => UpdateBranchCoverageUseCase(sl()));
  sl.registerLazySingleton(() => GetCoverageUseCase(sl()));
  sl.registerLazySingleton(() => UpdateBranchUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationByPostalCodeUseCase(sl()));
  sl.registerLazySingleton(() => WatchBranchesUseCase(sl()));
  sl.registerLazySingleton(() => GetBranchesWithConfiguredShippingRatesUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(sl()));

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<BranchRemoteDatasource>(
    () => BranchRemoteDatasourceImpl(sl()),
  );

  // --- CUBITS ---
  sl.registerFactory<BranchCubit>(
    () => BranchCubit(
      getAllBranchesUseCase: sl(),
      changeBranchStatusUseCase: sl(),
      getBranchesWithConfiguredShippingUseCase: sl(),
      watchBranchesUseCase: sl(),
      getBranchesWithConfiguredShippingRatesUseCase: sl(),
    ),
  );

  sl.registerFactory<WizardBranchCubit>(
    () => WizardBranchCubit(
      createBranchUseCase: sl(),
      updateBranchUseCase: sl(),
      getCoverageUseCase: sl(),
      getLocationByPostalCodeUseCase: sl(),
      updateBranchCoverageUseCase: sl(),
      saveShippingConfigUseCase: sl(),
      getShippingConfigUseCase: sl(),
      logger: sl()
    ),
  );
}
