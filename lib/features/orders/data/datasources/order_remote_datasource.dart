import 'package:fruti_express_jahr_admin/features/orders/data/models/order_model.dart';
import 'package:fruti_express_jahr_admin/features/orders/data/models/order_preview_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel?> getById(String id);
  Future<List<OrderModel>> getByBranch(String branchId);
  Future<List<OrderModel>> getByStatus(String branchId, String status);
  Future<List<OrderModel>> getAll();
  Future<OrderModel> create(OrderModel model);
  Future<List<OrderModel>> getByUser(String userId);
  Future<int> countByStatus(String branchId, String status);
  Future<int> getTodaysSales(String branchId);
  Future<int> countTodaysOrders(String branchId);
  Future<OrderModel> updateStatus(String orderId, String newStatus);
  Future<OrderModel> assignDriver(String orderId, String driverId);
  Stream<List<OrderModel>> watchByBranch(String branchId);
  Stream<List<OrderModel>> watchByDriver(String driverId);

  Future<void> confirmDelivery({
    required String orderId,
    String? confirmationCode,
    String? evidenceUrl,
  });

  Future<String?> getConfirmationCode(String orderId);

  Future<OrderPreviewModel> getOrderPreview({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude, // 👈 nuevo
    double? customerLongitude, // 👈 nuevo
  });

  Future<void> confirmCashOrder({required String orderId});
}
