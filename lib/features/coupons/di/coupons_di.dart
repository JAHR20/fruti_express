import 'package:fruti_express_jahr_admin/features/coupons/data/datasources/coupon_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/coupons/data/datasources/coupon_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/coupons/data/repositories_impl/coupon_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/repositories/coupon_repository.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/change_coupon_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/create_coupon_use_case.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/get_coupons_use_case.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/update_coupon_use_case.dart';
import 'package:fruti_express_jahr_admin/features/coupons/domain/use_cases/validate_and_apply_coupon_use_case.dart';
import 'package:fruti_express_jahr_admin/features/coupons/presentation/cubits/coupon_cubit.dart';
import 'package:get_it/get_it.dart';

void initCoupons(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => CreateCouponUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCouponUseCase(sl()));
  sl.registerLazySingleton(() => GetCouponsUseCase(sl()));
  sl.registerLazySingleton(() => ChangeCouponStatusUseCase(sl()));
  sl.registerLazySingleton(() => ValidateAndApplyCouponUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<CouponRepository>(
    () => CouponRepositoryImpl(sl()),
  );

  // --- DATA SOURCE ---
  sl.registerLazySingleton<CouponRemoteDataSource>(
    () => CouponRemoteDataSourceImpl(sl()),
  );

  // --- CUBIT ---
  sl.registerFactory<CouponCubit>(() => CouponCubit(
    createCouponUseCase: sl(),
    updateCouponUseCase: sl(),
    getCouponsUseCase: sl(),
    changeCouponStatusUseCase: sl(),
  ));
}
