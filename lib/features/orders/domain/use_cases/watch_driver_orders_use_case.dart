import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';

class WatchDriverOrdersUseCase {
  final OrderRepository repository;
  
  WatchDriverOrdersUseCase(this.repository);

  ResultStream<List<Order>> execute(String driverId) {
    return repository.watchByDriver(driverId);
  }
}