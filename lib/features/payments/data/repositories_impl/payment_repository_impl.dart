import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/payments/data/datasources/payment_remote_data_source.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/card_payment_result.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/entities/payment_order.dart';
import 'package:fruti_express_jahr_admin/features/payments/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl
    with SupabaseHandleException
    implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<CardPaymentResult> createCardPayment({
    required String orderId,
    required String token,
    required String paymentMethodId,
    required String paymentTypeId,
    required int installments,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDataSource.createCardPayment(
      orderId: orderId,
      token: token,
      paymentMethodId: paymentMethodId,
      paymentTypeId: paymentTypeId,
      installments: installments,
    );
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<String> verifyPayment({required String orderId}) =>
      TaskEither.tryCatch(
        () => remoteDataSource.verifyPayment(orderId: orderId),
        handleException,
      );

  @override
  ResultTask<PaymentOrder> createPaymentOrder({required String orderId}) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.createPaymentOrder(
          orderId: orderId,
        );
        return model.toDomain();
      }, handleException);

  @override
  ResultTask<void> cancelUnpaidOrder({required String orderId}) =>
      TaskEither.tryCatch(
        () => remoteDataSource.cancelUnpaidOrder(orderId: orderId),
        handleException,
      );
}
