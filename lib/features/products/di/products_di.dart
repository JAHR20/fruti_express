import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/search_products_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_branch_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/upload_product_image_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/presentation/cubits/product_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/product_remote_datasource.dart';
import '../data/datasources/product_remote_datasource_impl.dart';
import '../data/repositories_impl/product_repository_impl.dart';
import '../domain/repositories/product_repository.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/change_product_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_product_by_name_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/use_cases/get_all_products_use_case.dart';
import '../domain/use_cases/get_product_by_id_use_case.dart';
import '../domain/use_cases/create_product_use_case.dart';

void initProducts(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetAllProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetProductByNameUseCase(repository: sl()));
  sl.registerLazySingleton(
    () => GetProductsByCategoryUseCase(repository: sl()),
  );
  sl.registerLazySingleton(
    () => CreateProductUseCase(repository: sl(), categoryRepository: sl()),
  );
  sl.registerLazySingleton(
    () => UpdateProductUseCase(repository: sl(), categoryRepository: sl()),
  );
  sl.registerLazySingleton(() => ChangeProductStatusUseCase(repository: sl()));
  sl.registerLazySingleton(() => UploadProductImageUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchProductsUseCase(repository:  sl()));
  sl.registerLazySingleton(() => GetProductsByBranchUseCase(repository: sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  // --- DATA SOURCE---
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  // --- CUBIT ---
  sl.registerFactory<ProductCubit>(
    () => ProductCubit(
      updateProductUseCase: sl(),
      changeProductStatusUseCase: sl(),
      createProductUseCase: sl(),
      getProductByIdUseCase: sl(),
      getProductByNameUseCase: sl(),
      getProductsByCategoryUseCase: sl(),
      getAllProductsUseCase: sl(),
      uploadProductImageUseCase: sl(),
      searchProductsUseCase: sl(),
      getProductsByBranchUseCase: sl(),
    ),
  );
}
