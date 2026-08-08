import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/desactivar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/editar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias_activas.dart';
import 'package:fruti_express_jahr_admin/features/categorias/presentation/cubits/categoria_cubit.dart';
import 'package:get_it/get_it.dart';

// Data Sources
import '../data/datasources/categoria_remote_datasource.dart';
import '../data/datasources/categoria_remote_datasource_impl.dart';

// Repositories
import '../data/repositories_impl/categoria_repository_impl.dart';

// Use Cases
import '../domain/use_cases/crear_categoria.dart';

void initCategorias(GetIt sl) {
  // --- CASOS DE USO (Use Cases) ---
  sl.registerLazySingleton(() => ObtenerCategorias(sl()));
  sl.registerLazySingleton(() => CrearCategoria(sl()));
  sl.registerLazySingleton(() => CambiarEstadoCategoria(sl()));
  sl.registerLazySingleton(() => EditarCategoria(sl()));
  sl.registerLazySingleton(() => ObtenerCategoriasActivas(sl()));

  // --- REPOSITORIO (Repository) ---
  sl.registerLazySingleton<CategoriaRepository>(
    () => CategoriaRepositoryImpl(sl()),
  );

  // --- FUENTE DE DATOS (Data Source) ---
  sl.registerLazySingleton<CategoriaRemoteDataSource>(
    () => CategoriaRemoteDataSourceImpl(sl()),
  );

  // --- CUBIT ---
  sl.registerFactory<CategoriaCubit>(() => CategoriaCubit(
    crearCategoriaUseCase: sl(),
    cambiarEstadoCategoriaUseCase: sl(),
    editarCategoriaUseCase: sl(),
    obtenerCategoriasUseCase: sl(),
    obtenerCategoriasActivasUseCase: sl(),
    storageService: sl(),
  ));
}
