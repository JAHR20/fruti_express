import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_preview_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_preview.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/cancellation_reason.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/delivery_failure_reason.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart'; // Import corregido
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrderRepositoryImpl
    with SupabaseHandleException
    implements OrderRepository {
  final OrderRemoteDataSource remoteDatasource;

  OrderRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<Order> create(CreateOrderParams params) =>
      TaskEither.tryCatch(() async {
        final model = OrderModelX.fromParams(params);
        final created = await remoteDatasource.create(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Order> getById(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.getById(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Pedido no encontrado',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<List<Order>> getByUser(String userId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.getByUser(userId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<int> countByStatus(String branchId, OrderStatus status) =>
      TaskEither.tryCatch(
        () async => remoteDatasource.countByStatus(branchId, status.name),
        handleException,
      );

  @override
  ResultTask<int> getTodaysSales(String branchId) => TaskEither.tryCatch(
    () async => remoteDatasource.getTodaysSales(branchId),
    handleException,
  );

  @override
  ResultTask<int> countTodaysOrders(String branchId) => TaskEither.tryCatch(
    () async => remoteDatasource.countTodaysOrders(branchId),
    handleException,
  );


  @override
  ResultTask<Unit> assignDriverAndPrepare({
    required String orderId,
    required String driverId,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.assignDriverAndPrepare(
      orderId: orderId,
      driverId: driverId,
    );
    return unit;
  }, handleException);

  @override
  ResultStream<List<Order>> watchByBranch(String branchId) {
    return remoteDatasource
        .watchByBranch(branchId)
        .map<Either<Failure, List<Order>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError((e) => Left(handleException(e, StackTrace.current)));
  }

  @override
  ResultStream<List<Order>> watchByDriver(String driverId) {
    return remoteDatasource
        .watchByDriver(driverId)
        .map(
          (models) => Either<Failure, List<Order>>.right(
            models.map((m) => m.toDomain()).toList(),
          ),
        )
        .handleError(
          (e) => Either<Failure, List<Order>>.left(
            handleException(e, StackTrace.current),
          ),
        );
  }

  @override
  ResultTask<OrderPreview> getOrderPreview({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude,
    double? customerLongitude,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.getOrderPreview(
      branchId: branchId,
      items: items,
      deliveryMethod: deliveryMethod,
      couponId: couponId,
      customerLatitude: customerLatitude,
      customerLongitude: customerLongitude,
    );
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Unit> confirmDelivery(ConfirmDeliveryParams params) =>
      TaskEither.tryCatch(() async {
        await remoteDatasource.confirmDelivery(
          orderId: params.orderId,
          confirmationCode: params.confirmationCode,
          evidenceUrl: params.evidenceUrl,
        );
        return unit;
      }, handleException);

  @override
  ResultTask<Unit> confirmCashOrder({required String orderId}) =>
      TaskEither.tryCatch(() async {
        await remoteDatasource.confirmCashOrder(orderId: orderId);
        return unit;
      }, handleException);

  @override
  ResultTask<Unit> cancelCashOrder({
    required String orderId,
    required CancellationReason reason,
    String? note,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.cancelCashOrder(
      orderId: orderId,
      reason: reason.code,
      note: note,
    );
    return unit;
  }, handleException);

  @override
  ResultTask<Unit> failDelivery({
    required String orderId,
    required DeliveryFailureReason reason,
    String? note,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.failDelivery(
      orderId: orderId,
      reason: reason.code,
      note: note,
    );
    return unit;
  }, handleException);

  @override
  ResultTask<Order> departForDelivery({required String orderId}) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.departForDelivery(orderId);
        return model.toDomain();
      }, handleException);
}
