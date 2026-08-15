import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/buscar_productos.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_productos_por_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/subir_imagen_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/presentation/cubits/productos_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/producto_remote_datasource.dart';
import '../data/datasources/producto_remote_datasource_impl.dart';
import '../data/repositories_impl/producto_repository_impl.dart';
import '../domain/repositories/producto_repository.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/actualizar_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/cambiar_estado_producto.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_producto_por_nombre.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_productos_por_categoria.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/use_cases/obtener_todos_productos.dart';
import '../domain/use_cases/obtener_producto_por_id.dart';
import '../domain/use_cases/crear_producto.dart';

void initProductos(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerTodosLosProductos(repository: sl()));
  sl.registerLazySingleton(() => ObtenerProductoPorId(repository: sl()));
  sl.registerLazySingleton(() => ObtenerProductoPorNombre(repository: sl()));
  sl.registerLazySingleton(
    () => ObtenerProductosPorCategoria(repository: sl()),
  );
  sl.registerLazySingleton(
    () => CrearProducto(repository: sl(), categoriaRepository: sl()),
  );
  sl.registerLazySingleton(
    () => ActualizarProducto(repository: sl(), categoriaRepository: sl()),
  );
  sl.registerLazySingleton(() => CambiarEstadoProducto(repository: sl()));
  sl.registerLazySingleton(() => SubirImagenProducto(repository: sl()));
  sl.registerLazySingleton(() => BuscarProductos(repository:  sl()));
  sl.registerLazySingleton(() => ObtenerProductosPorSucursal(repository: sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<ProductoRepository>(
    () => ProductoRepositoryImpl(sl()),
  );

  // --- DATA SOURCE---
  sl.registerLazySingleton<ProductoRemoteDatasource>(
    () => ProductoRemoteDatasourceImpl(sl()),
  );

  // --- CUBIT ---
  sl.registerFactory<ProductosCubit>(
    () => ProductosCubit(
      actualizarProductoUseCase: sl(),
      cambiarEstadoProductoUseCase: sl(),
      crearProductoUseCase: sl(),
      obtenerProductoPorIdUseCase: sl(),
      obtenerProductoPorNombreUseCase: sl(),
      obtenerProductosPorCategoriaUseCase: sl(),
      obtenerTodosProductosUseCase: sl(),
      subirImagenProductoUseCase: sl(),
      buscarProductosUseCase: sl(),
      obtenerProductosPorSucursalUseCase: sl(),
    ),
  );
}
