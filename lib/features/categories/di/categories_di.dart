import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/change_category_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/update_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/get_active_categories_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/use_cases/upload_category_image_use_case.dart';
import 'package:fruti_express_jahr_admin/features/categories/presentation/cubits/category_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/category_remote_datasource.dart';
import '../data/datasources/category_remote_datasource_impl.dart';
import '../data/repositories_impl/category_repository_impl.dart';
import '../domain/use_cases/create_category_use_case.dart';

void initCategories(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => CreateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => ChangeCategoryStatusUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => GetActiveCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => UploadCategoryImageUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl()),
  );

  // --- DATA SOURCE ---
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(sl()),
  );

  // --- CUBIT ---
  sl.registerFactory<CategoryCubit>(() => CategoryCubit(
    createCategoryUseCase: sl(),
    changeCategoryStatusUseCase: sl(),
    updateCategoryUseCase: sl(),
    getCategoriesUseCase: sl(),
    getActiveCategoriesUseCase: sl(),
    uploadCategoryImageUseCase: sl(),
  ));
}
