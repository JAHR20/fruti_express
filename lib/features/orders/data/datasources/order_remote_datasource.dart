import 'package:fruti_express_jahr_admin/features/orders/data/models/order_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_preview_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel?> getById(String id);
  Future<OrderModel> create(OrderModel model);
  Future<List<OrderModel>> getByUser(String userId);
  Future<int> countByStatus(String branchId, String status);
  Future<int> getTodaysSales(String branchId);
  Future<int> countTodaysOrders(String branchId);
  Stream<List<OrderModel>> watchByBranch(String branchId);
  Stream<List<OrderModel>> watchByDriver(String driverId);

  Future<void> assignDriverAndPrepare({
    required String orderId,
    required String driverId,
  });

  Future<void> confirmDelivery({
    required String orderId,
    String? confirmationCode,
    String? evidenceUrl,
  });

  Future<void> failDelivery({
    required String orderId,
    required String reason,
    String? note,
  });

  Future<OrderPreviewModel> getOrderPreview({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude,
    double? customerLongitude,
  });

  Future<void> confirmCashOrder({required String orderId});

  Future<void> cancelCashOrder({
    required String orderId,
    required String reason,
    String? note,
  });

  Future<OrderModel> departForDelivery(String orderId);
}
