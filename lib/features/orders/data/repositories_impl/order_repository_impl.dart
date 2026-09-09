import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/datasources/order_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
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
  ResultTask<List<Order>> getAll() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.getAll();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<List<Order>> getByBranch(String branchId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.getByBranch(branchId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<List<Order>> getByStatus({
    required String branchId,
    required OrderStatus status,
  }) => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.getByStatus(
      branchId,
      status.name,
    );
    return models.map((m) => m.toDomain()).toList();
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
  ResultTask<Order> updateStatus({
    required String orderId,
    required OrderStatus newStatus,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.updateStatus(
      orderId,
      newStatus.name,
    );
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Order> assignDriver({
    required String orderId,
    required String driverId,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.assignDriver(
      orderId,
      driverId,
    );
    return model.toDomain();
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
  ResultTask<Unit> confirmDelivery(ConfirmDeliveryParams params) =>
      TaskEither.tryCatch(() async {
        await remoteDatasource.confirmDelivery(
          orderId: params.orderId,
          confirmationCode: params.confirmationCode,
          evidenceUrl: params.evidenceUrl,
        );
        return unit;
      }, handleException);
}