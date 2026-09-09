import 'package:fruti_express_jahr_admin/features/banners/data/datasources/promo_banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/promo_banner_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/repositories_impl/promo_banner_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/promo_banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/update_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/change_promo_banner_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/create_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/delete_promo_banner_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/get_active_promo_banners_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/get_all_promo_banners_use_case.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/promo_banner_cubit.dart';
import 'package:get_it/get_it.dart';

void initBanners(GetIt sl) async {

  // --- DATA SOURCES
  sl.registerLazySingleton<PromoBannerRemoteDataSource>(
    () => PromoBannerRemoteDataSourceImpl(sl()),
  );

  // 2. --- REPOSITORIES ---
  sl.registerLazySingleton<PromoBannerRepository>(() => PromoBannerRepositoryImpl(sl()));

  // 3. --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetActivePromoBannersUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPromoBannersUseCase(sl()));
  sl.registerLazySingleton(() => CreatePromoBannerUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePromoBannerUseCase(sl()));
  sl.registerLazySingleton(() => ChangePromoBannerStatusUseCase(sl()));
  sl.registerLazySingleton(() => DeletePromoBannerUseCase(sl()));

 // --- CUBITS ---
  sl.registerFactory(
    () => PromoBannerCubit(
      getActivePromoBannersUseCase: sl(),
      getAllPromoBannersUseCase: sl(),
      createPromoBannerUseCase: sl(),
      updatePromoBannerUseCase: sl(),
      changePromoBannerStatusUseCase: sl(),
      deleteBanner: sl(),
    ),
  );
}
