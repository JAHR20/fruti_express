import 'package:fruti_express_jahr_admin/core/services/storage/storage_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/services/contacto_service_impl.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/asignar_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/actualizar_estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/confirmar_entrega.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_use_case.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_estado.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_todos.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_usuario_use_case.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedido_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_cliente_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_repartidor_cubit.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/repartidores_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/pedido_remote_datasource.dart';
import '../data/datasources/pedido_remote_datasource_impl.dart';
import '../data/repositories_impl/pedido_repository_impl.dart';
import '../domain/repositories/pedido_repository.dart';

void initPedidos(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => ObtenerTodosLosPedidos(sl()));
  sl.registerLazySingleton(() => ObtenerPedidosPorEstado(sl()));
  sl.registerLazySingleton(() => ActualizarEstadoPedido(sl()));
  sl.registerLazySingleton(() => AsignarRepartidor(sl(), sl()));
  sl.registerLazySingleton(() => ObtenerPedidosSucursal(sl()));
  sl.registerLazySingleton(() => CrearPedidoUseCase(sl(), sl()));
  sl.registerLazySingleton(() => ObtenerPedidosUsuarioUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerPedidosRepartidor(sl()));
  sl.registerLazySingleton(() => ConfirmarEntrega(sl()));

  //---- Services-----
  sl.registerLazySingleton<ContactoService>(() => ContactoServiceImpl());

  // --- REPOSITORIO ---
  sl.registerLazySingleton<PedidoRepository>(() => PedidoRepositoryImpl(sl()));

  // --- DATA SOURCES ---
  sl.registerLazySingleton<PedidoRemoteDatasource>(
    () => PedidoRemoteDatasourceImpl(sl()),
  );

  // --- CUBITS ------------
  sl.registerFactory<PedidoCubit>(
    () => PedidoCubit(crearPedidoUseCase: sl()),
  );

  sl.registerFactory<PedidosEncargadoCubit>(
    () => PedidosEncargadoCubit(repository: sl()),
  );
  sl.registerFactory<RepartidoresCubit>(
    () => RepartidoresCubit(obtenerRepartidores: sl()),
  );

  sl.registerFactory<PedidosRepartidorCubit>(
    () => PedidosRepartidorCubit(
      obtenerPedidos: sl(),
      repository: sl(),
      confirmarEntrega: sl(),
      storageService: sl<StorageService>(),
    ),
  );

  sl.registerFactory<PedidosClienteCubit>(
    () => PedidosClienteCubit(obtenerPedidos: sl()),
  );
}
