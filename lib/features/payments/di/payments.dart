import 'package:fruti_express_jahr_admin/features/payments/data/datasources/payment_remote_data_source.dart';
import 'package:fruti_express_jahr_admin/features/payments/data/datasources/payment_remote_datasource_impl.dart';
import 'package:fruti_express_jahr_admin/features/payments/data/repositories_impl/payment_repository_impl.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/cancel_unpaid_order_use_case.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/create_card_payment_use_case.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/create_payment_order_use_case.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/use_cases/verify_payment_use_case.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/card_payment_cubit.dart';
import 'package:fruti_express_jahr_admin/features/payments/presentation/cubits/payment_verification_cubit.dart';
import 'package:get_it/get_it.dart';

void initPayments(GetIt sl) {
  // Casos de uso
  sl.registerLazySingleton(() => CreatePaymentOrderUseCase(sl()));
  sl.registerLazySingleton(() => VerifyPaymentUseCase(sl()));
  sl.registerLazySingleton(() => CreateCardPaymentUseCase(sl()));
  sl.registerLazySingleton(() => CancelUnpaidOrderUseCase(sl()));

  // Repositorios
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );

  // Datasources
  sl.registerLazySingleton<PaymentRemoteDataSource>(
    () => PaymentRemoteDataSourceImpl(sl()),
  );

  // Cubits
  sl.registerFactory(
    () => CardPaymentCubit(
      createCardPaymentUseCase: sl(),
      cancelUnpaidOrderUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => PaymentVerificationCubit(verifyPaymentUseCase: sl()),
  );
}
