import 'package:fruti_express_jahr_admin/features/addresses/presentation/cubits/address_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/address_remote_datasource.dart';
import '../data/datasources/address_remote_datasource_impl.dart';
import '../data/repositories_impl/address_repository_impl.dart';
import '../domain/repositories/address_repository.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/update_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/create_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/delete_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/set_main_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/addresses/domain/use_cases/get_addresses_use_case.dart';

void initAddress(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetAddressesUseCase(sl()));
  sl.registerLazySingleton(() => CreateAddressUseCase(sl()));
  sl.registerLazySingleton(() => UpdateAddressUseCase(sl()));
  sl.registerLazySingleton(() => DeleteAddressUseCase(sl()));
  sl.registerLazySingleton(() => SetMainAddressUseCase(sl()));

  // --- REPOSITORIO ---
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(sl()),
  );

  // --- FUENTE DE DATOS ---
  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(sl()),
  );


  // --- CUBITS ---
  sl.registerFactory<AddressCubit>(
    () => AddressCubit(
      getAddressesUseCase: sl(),
      createAddressUseCase: sl(),
      updateAddressUseCase: sl(),
      deleteAddressUseCase: sl(),
      setMainAddressUseCase: sl(),
    ),
  );
}
