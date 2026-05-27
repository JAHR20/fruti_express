import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/asignar_repartidor.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/cambiar_estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_use_case.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_estado.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_sucursal.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_todos.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/obtener_pedidos_usuario_use_case.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/pedido_remote_datasource.dart';
import '../data/datasources/pedido_remote_datasource_impl.dart';
import '../data/repositories_impl/pedido_repository_impl.dart';
import '../domain/repositories/pedido_repository.dart';

void initPedidos(GetIt sl) {
  // --- 🧠 CASOS DE USO (Use Cases) ---
  sl.registerLazySingleton(() => ObtenerTodosLosPedidos(sl()));
  sl.registerLazySingleton(() => ObtenerPedidosPorEstado(sl()));
  sl.registerLazySingleton(() => ActualizarEstadoPedido(sl()));
  sl.registerLazySingleton(() => AsignarRepartidor(sl(), sl()));
  sl.registerLazySingleton(() => ObtenerPedidosSucursal(sl()));
  sl.registerLazySingleton(() => CrearPedidoUseCase(sl()));
  sl.registerLazySingleton(() => ObtenerPedidosUsuarioUseCase(sl()));

  // --- 🤝 REPOSITORIO (Repository) ---
  sl.registerLazySingleton<PedidoRepository>(() => PedidoRepositoryImpl(sl()));

  // --- 🛰️ FUENTE DE DATOS (Data Source) ---
  sl.registerLazySingleton<PedidoRemoteDatasource>(
    () => PedidoRemoteDatasourceImpl(sl()),
  );
}
