import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';

class DepartForDeliveryUseCase {
  final OrderRepository repository;

  DepartForDeliveryUseCase(this.repository);

  ResultTask<Order> execute(String orderId) {
    return repository.departForDelivery(orderId: orderId);
  }
}
