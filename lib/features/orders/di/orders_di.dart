import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/services/contact_service_impl.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/assign_driver_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/depart_for_delivery_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_order_preview_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/update_order_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_orders_by_status_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/upload_delivery_evidence_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/watch_driver_orders_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_branch_orders_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_all_orders_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/get_user_orders_use_case.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/order_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/customer_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/manager_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/driver_orders_cubit.dart';
import 'package:fruti_express_jahr_admin/features/orders/presentation/cubits/drivers_cubit.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/order_remote_datasource.dart';
import '../data/datasources/order_remote_datasource_impl.dart';
import '../data/repositories_impl/order_repository_impl.dart';
import '../domain/repositories/order_repository.dart';

void initOrders(GetIt sl) {
  // --- CASOS DE USO ---
  sl.registerLazySingleton(() => GetAllOrdersUseCase(sl()));
  sl.registerLazySingleton(() => GetOrdersByStatusUseCase(sl()));
  sl.registerLazySingleton(() => UpdateOrderStatusUseCase(sl()));
  sl.registerLazySingleton(() => AssignDriverUseCase(sl(), sl()));
  sl.registerLazySingleton(() => GetBranchOrdersUseCase(sl()));
  sl.registerLazySingleton(() => CreateOrderUseCase(sl(), sl()));
  sl.registerLazySingleton(() => GetUserOrdersUseCase(sl()));
  sl.registerLazySingleton(() => WatchDriverOrdersUseCase(sl()));
  sl.registerLazySingleton(() => ConfirmDeliveryUseCase(sl()));
  sl.registerLazySingleton(() => DepartForDeliveryUseCase(sl()));
  sl.registerLazySingleton(() => UploadDeliveryEvidenceUseCase(sl()));
  sl.registerLazySingleton(() => GetOrderPreviewUseCase(sl()));

  //---- Services-----
  sl.registerLazySingleton<ContactService>(() => ContactServiceImpl());

  // --- REPOSITORIO ---
  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(sl()));

  // --- DATA SOURCES ---
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(sl()),
  );

  // --- CUBITS ------------
  sl.registerFactory<OrderCubit>(
    () => OrderCubit(createOrderUseCase: sl()),
  );

  sl.registerFactory<ManagerOrdersCubit>(
    () => ManagerOrdersCubit(repository: sl()),
  );
  sl.registerFactory<DriversCubit>(
    () => DriversCubit(getDeliveryPersons: sl()),
  );

  sl.registerFactory<DriverOrdersCubit>(
    () => DriverOrdersCubit(
      watchOrdersUseCase: sl(),
      departForDeliveryUseCase: sl(),
      confirmDeliveryUseCase: sl(),
      uploadEvidenceUseCase: sl(),
    ),
  );

  sl.registerFactory<CustomerOrdersCubit>(
    () => CustomerOrdersCubit(getUserOrdersUseCase: sl()),
  );
}
