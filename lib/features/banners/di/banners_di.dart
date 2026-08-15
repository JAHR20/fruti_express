import 'package:fruti_express_jahr_admin/features/banners/data/datasources/banner_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/datasources/banner_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/repositories_impl/banner_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/repositories/banner_repository.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/actualizar_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/cambiar_estado_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/crear_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/eliminar_banner.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/obtener_banners_activos.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/use_cases/obtener_todos_los_banners.dart';
import 'package:fruti_express_jahr_admin/features/banners/presentation/cubits/banner_cubit.dart';
import 'package:get_it/get_it.dart';

void initBanners(GetIt sl) async {

  // --- DATA SOURCES
  sl.registerLazySingleton<BannerRemoteDatasource>(
    () => BannerRemoteDatasourceImpl(sl()),
  );

  // 2. --- REPOSITORIES ---
  sl.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(sl()));

  // 3. --- CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerBannersActivos(sl()));
  sl.registerLazySingleton(() => ObtenerTodosLosBanners(sl()));
  sl.registerLazySingleton(() => CrearBanner(sl()));
  sl.registerLazySingleton(() => ActualizarBanner(sl()));
  sl.registerLazySingleton(() => CambiarEstadoBanner(sl()));
  sl.registerLazySingleton(() => EliminarBanner(sl()));

 // --- CUBITS ---
  sl.registerFactory(
    () => BannerCubit(
      obtenerBannersActivos: sl(),
      obtenerTodosLosBanners: sl(),
      crearBanner: sl(),
      actualizarBanner: sl(),
      cambiarEstadoBanner: sl(),
      eliminarBanner: sl(),
    ),
  );
}
