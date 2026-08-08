import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/check_auth_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/login_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/domain/use_cases/register_use_case.dart';
import 'package:fruti_express_jahr_admin/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:get_it/get_it.dart';

void initAuth(GetIt sl) {
  // --- 🧠 CASOS DE USO (Use Cases) ---
  // Los registramos como LazySingletons porque no guardan estado, son puras acciones.
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthStatusUseCase(sl()));

  // --- 🤝 REPOSITORIOS (Repositories) ---
  // Registramos la Interfaz y le decimos que use la Implementación.
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // --- 🛰️ FUENTES DE DATOS (Data Sources) ---
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(
    loginUseCase: sl(),
    registerUseCase: sl(),
    logoutUseCase: sl(),
    checkAuthStatusUseCase: sl(),
  ));
}
