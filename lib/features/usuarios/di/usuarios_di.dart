import 'package:fruti_express_jahr_admin/features/usuarios/presentation/cubits/usuarios_cubit.dart';
import 'package:get_it/get_it.dart';

// Data Sources
import '../data/datasources/usuario_remote_datasource.dart';
import '../data/datasources/usuario_remote_datasource_impl.dart';

// Repositories
import '../domain/repositories/usuario_repository.dart';
import '../data/repositories_impl/usuario_repository_impl.dart';

// Use Cases
import '../domain/use_cases/actualizar_perfil.dart';
import '../domain/use_cases/cambiar_estado_usuario.dart';
import '../domain/use_cases/cambiar_rol_usuario.dart';
import '../domain/use_cases/obtener_repartidores.dart';
import '../domain/use_cases/obtener_usuario_por_id.dart';
import '../domain/use_cases/obtener_usuarios.dart';
import '../domain/use_cases/obtener_clientes.dart';
import '../domain/use_cases/buscar_usuarios.dart';
import '../domain/use_cases/existe_encargado_en_sucursal.dart';
import '../domain/use_cases/contar_admins_activos.dart';

void initUsuarios(GetIt sl) {
  // --- 🧠 CASOS DE USO (Use Cases) ---
  // Listados y Búsqueda
  sl.registerLazySingleton(() => ObtenerUsuarios(sl()));
  sl.registerLazySingleton(() => ObtenerClientes(sl()));
  sl.registerLazySingleton(() => ObtenerRepartidores(sl()));
  sl.registerLazySingleton(() => BuscarUsuarios(sl()));
  sl.registerLazySingleton(() => ObtenerUsuarioPorId(sl()));

  // Gestión de Perfil y Roles
  sl.registerLazySingleton(() => ActualizarPerfil(sl()));
  sl.registerLazySingleton(() => CambiarRolUsuario(sl()));
  sl.registerLazySingleton(() => CambiarEstadoUsuario(sl()));

  // Reglas de Negocio y Seguridad
  sl.registerLazySingleton(() => ExisteEncargadoEnSucursal(sl()));
  sl.registerLazySingleton(() => ContarAdminsActivos(sl()));

  // --- 🤝 REPOSITORIO (Repository) ---
  sl.registerLazySingleton<UsuarioRepository>(
    () => UsuarioRepositoryImpl(sl()),
  );

  // --- 🛰️ FUENTE DE DATOS (Data Source) ---
  sl.registerLazySingleton<UsuarioRemoteDatasource>(
    () => UsuarioRemoteDatasourceImpl(sl()),
  );

  // --- 🧑‍💼 CUBIT (Cubit) ---
  sl.registerFactory<UsuariosCubit>(
    () => UsuariosCubit(
      actualizarPerfilUseCase: sl(),
      buscarUsuariosUseCase: sl(),
      cambiarEstadoUsuarioUseCase: sl(),
      cambiarRolUseCase: sl(),
      contarAdminsActivosUseCase: sl(),
      existeEncargadoActivoUseCase: sl(),
      obtenerClientesUseCase: sl(),
      obtenerRepartidoresUseCase: sl(),
      obtenerUsuarioPorIdUseCase: sl(),
      obtenerUsuariosUseCase: sl(),
    ),
  );
}
