import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/edit_profile_cubit.dart';
import 'package:fruti_express_jahr_admin/features/users/presentation/cubits/users_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/user_remote_datasource.dart';
import '../data/datasources/user_remote_datasource_impl.dart';
import '../domain/repositories/user_repository.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import '../domain/use_cases/update_profile_use_case.dart';
import '../domain/use_cases/change_user_status_use_case.dart';
import '../domain/use_cases/change_user_role_use_case.dart';
import '../domain/use_cases/get_delivery_persons_use_case.dart';
import '../domain/use_cases/get_user_by_id_use_case.dart';
import '../domain/use_cases/get_all_users_use_case.dart';
import '../domain/use_cases/get_customers_use_case.dart';
import '../domain/use_cases/search_users_use_case.dart';
import '../domain/use_cases/manager_exists_in_branch_use_case.dart';
import '../domain/use_cases/count_active_admins_use_case.dart';

void initUsers(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetAllUsersUseCase(sl()));
  sl.registerLazySingleton(() => GetCustomersUseCase(sl()));
  sl.registerLazySingleton(() => GetDeliveryPersonsUseCase(sl()));
  sl.registerLazySingleton(() => SearchUsersUseCase(sl()));
  sl.registerLazySingleton(() => GetUserByIdUseCase(sl()));

  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));
  sl.registerLazySingleton(() => ChangeUserRoleUseCase(sl()));
  sl.registerLazySingleton(() => ChangeUserStatusUseCase(sl()));

  sl.registerLazySingleton(() => ManagerExistsInBranchUseCase(sl()));
  sl.registerLazySingleton(() => CountActiveAdminsUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl()),
  );

  // --- DATA SOURCES ---
  sl.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl(sl()),
  );

  // --- CUBITS ---
  sl.registerFactory<UsersCubit>(
    () => UsersCubit(
      searchUsersUseCase: sl(),
      changeUserStatusUseCase: sl(),
      changeUserRoleUseCase: sl(),
      countActiveAdminsUseCase: sl(),
      managerExistsInBranchUseCase: sl(),
      getCustomersUseCase: sl(),
      getDeliveryPersonsUseCase: sl(),
      getUserByIdUseCase: sl(),
      getAllUsersUseCase: sl(),
    ),
  );

  sl.registerFactory<EditProfileCubit>(
    () => EditProfileCubit(
      updateProfileUseCase: sl(),
    ),
  );
}
