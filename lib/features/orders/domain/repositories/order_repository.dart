import 'package:fpdart/fpdart.dart' hide Order;
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/enums/order_status.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/confirm_delivery_params.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';

abstract class OrderRepository {
  ResultTask<Order> getById(String id);
  
  ResultTask<List<Order>> getByBranch(String branchId);
  
  ResultTask<List<Order>> getByStatus({
    required String branchId,
    required OrderStatus status,
  });

  ResultTask<Order> create(CreateOrderParams params);
  
  ResultTask<List<Order>> getByUser(String userId);
  
  ResultTask<List<Order>> getAll();
  
  ResultTask<int> countByStatus(String branchId, OrderStatus status);
  
  ResultTask<int> getTodaysSales(String branchId); 
  
  ResultTask<int> countTodaysOrders(String branchId); 

  ResultTask<Order> updateStatus({
    required String orderId,
    required OrderStatus newStatus,
  });

  ResultTask<Order> assignDriver({
    required String orderId,
    required String driverId, 
  });

  ResultStream<List<Order>> watchByBranch(String branchId);
  
  ResultStream<List<Order>> watchByDriver(String driverId);
  
  ResultTask<Unit> confirmDelivery(ConfirmDeliveryParams params);
  
}