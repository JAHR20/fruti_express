import 'package:fruti_express_jahr_admin/features/shipping/data/datasources/shipping_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/datasources/shipping_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/repositories_impl/shipping_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/services_impl/shipping_service_impl.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/strategies_impl/distance_pricing_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/strategies_impl/haversine_distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/data/strategies_impl/radius_coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/repositories/shipping_repository.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/services/shipping_service.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/coverage_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/distance_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/strategies/pricing_strategy.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/calculate_shipping_quote_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/delete_and_merge_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/edit_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_config_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_branches_with_configured_shipping_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/get_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/save_shipping_rates_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/split_shipping_rate_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/domain/use_cases/validate_shipping_coverage_use_case.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_coordinator_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/shipping_admin_cubit.dart';
import 'package:fruti_express_jahr_admin/features/shipping/presentation/cubits/customer_shipping_cubit.dart';
import 'package:get_it/get_it.dart';

void initShipping(GetIt sl) {
  // --- ESTRATEGIAS ---
  sl.registerLazySingleton<DistanceStrategy>(() => HaversineDistanceStrategy());
  sl.registerLazySingleton<CoverageStrategy>(() => RadiusCoverageStrategy());
  sl.registerLazySingleton<PricingStrategy>(() => DistancePricingStrategy());

  // --- SERVICIOS ---
  sl.registerLazySingleton<ShippingService>(
    () => ShippingServiceImpl(
      distanceStrategy: sl(),
      coverageStrategy: sl(),
      pricingStrategy: sl(),
    ),
  );

  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => CalculateShippingQuoteUseCase(sl(), sl()));
  sl.registerLazySingleton(() => ValidateShippingCoverageUseCase(sl(), sl()));
  sl.registerLazySingleton(() => GetShippingConfigUseCase(sl()));
  sl.registerLazySingleton(() => GetShippingRatesUseCase(sl()));
  sl.registerLazySingleton(() => SaveShippingConfigUseCase(sl()));
  sl.registerLazySingleton(() => SaveShippingRatesUseCase(sl()));
  sl.registerLazySingleton(
    () => GetBranchesWithConfiguredShippingUseCase(sl()),
  );
  sl.registerLazySingleton(() => const SplitShippingRateUseCase());
  sl.registerLazySingleton(() => const DeleteAndMergeShippingRateUseCase());
  sl.registerLazySingleton(() => const EditShippingRateUseCase());

  // --- REPOSITORIO ---
  sl.registerLazySingleton<ShippingRepository>(
    () => ShippingRepositoryImpl(sl()),
  );

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<ShippingRemoteDataSource>(
    () => ShippingRemoteDataSourceImpl(sl()),
  );

  // --- CUBITS ---
  sl.registerFactory(
    () => ShippingAdminCubit(
      getConfigUseCase: sl(),
      getRatesUseCase: sl(),
      saveConfigUseCase: sl(),
      saveRatesUseCase: sl(),
      splitRateUseCase: sl(),
      deleteAndMergeRateUseCase: sl(),
      editRateUseCase: sl()
    ),
  );

  sl.registerFactory(() => CustomerShippingCubit(getConfig: sl()));

  sl.registerFactory<CustomerCoordinatorCubit>(
    () => CustomerCoordinatorCubit(
      cartCubit: sl(),
      customerProductsCubit: sl(),
      branchCubit: sl(),
      customerShippingCubit: sl(),
      addressCubit: sl(),
      getSelectedAddressUseCase: sl(),
      saveSelectedAddressUseCase: sl(),
      calculateShippingQuoteUseCase: sl(),
    ),
  );
}
