import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_preview.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/cancellation_reason.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/delivery_failure_reason.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';

abstract class OrderRepository {
  ResultTask<Order> getById(String id);

  ResultTask<Order> create(CreateOrderParams params);

  ResultTask<List<Order>> getByUser(String userId);

  ResultTask<int> countByStatus(String branchId, OrderStatus status);

  ResultTask<int> getTodaysSales(String branchId);

  ResultTask<int> countTodaysOrders(String branchId);


  ResultTask<Unit> assignDriverAndPrepare({
    required String orderId,
    required String driverId,
  });

  ResultStream<List<Order>> watchByBranch(String branchId);

  ResultStream<List<Order>> watchByDriver(String driverId);

  ResultTask<Unit> confirmDelivery(ConfirmDeliveryParams params);

  ResultTask<Unit> failDelivery({
    required String orderId,
    required DeliveryFailureReason reason,
    String? note,
  });

  ResultTask<OrderPreview> getOrderPreview({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude,
    double? customerLongitude,
  });

  ResultTask<Unit> confirmCashOrder({required String orderId});

  ResultTask<Unit> cancelCashOrder({
    required String orderId,
    required CancellationReason reason,
    String? note,
  });

  ResultTask<Order> departForDelivery({required String orderId});
}
