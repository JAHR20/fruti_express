import 'package:fruti_express_jahr_admin/features/delivery_preferences/data/datasources/preferences_delivery_local_datasource.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/data/datasources/preferences_delivery_local_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/data/repositories/preferences_delivery_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/repositories/preferences_delivery_repository.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/use_cases/get_selected_address_use_case.dart';
import 'package:fruti_express_jahr_admin/features/delivery_preferences/domain/use_cases/save_selected_address_use_case.dart';
import 'package:get_it/get_it.dart';

void initDeliveryPreferences(GetIt sl) {
  // --- DATA SOURCE ---
  sl.registerLazySingleton<PreferencesDeliveryLocalDatasource>(
    () => PreferencesDeliveryLocalDatasourceImpl(sharedPreferences: sl()),
  );

  // --- REPOSITORY ---
  sl.registerLazySingleton<PreferencesDeliveryRepository>(
    () => PreferencesDeliveryRepositoryImpl(sl()),
  );

  // --- USE CASES ---
  sl.registerLazySingleton(() => SaveSelectedAddressUseCase(sl()));
  sl.registerLazySingleton(() => GetSelectedAddressUseCase(sl()));
}
