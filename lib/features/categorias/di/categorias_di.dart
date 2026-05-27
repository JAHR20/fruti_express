import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/desactivar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/editar_categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/use_cases/obtener_categorias.dart';
import 'package:get_it/get_it.dart';

// Data Sources
import '../data/datasources/categoria_remote_datasource.dart';
import '../data/datasources/categoria_remote_datasource_impl.dart';

// Repositories
import '../data/repositories_impl/categoria_repository_impl.dart';

// Use Cases
import '../domain/use_cases/crear_categoria.dart';

void initCategorias(GetIt sl) {
  // --- 🧠 CASOS DE USO (Use Cases) ---
  sl.registerLazySingleton(() => ObtenerCategorias(sl()));
  sl.registerLazySingleton(() => CrearCategoria(sl()));
  sl.registerLazySingleton(() => CambiarEstadoCategoria(sl()));
  sl.registerLazySingleton(() => EditarCategoria(sl()));

  // --- 🤝 REPOSITORIO (Repository) ---
  sl.registerLazySingleton<CategoriaRepository>(
    () => CategoriaRepositoryImpl(sl()),
  );

  // --- 🛰️ FUENTE DE DATOS (Data Source) ---
  sl.registerLazySingleton<CategoriaRemoteDataSource>(
    () => CategoriaRemoteDataSourceImpl(sl()),
  );
}
