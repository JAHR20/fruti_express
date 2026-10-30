import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/entities/order_preview.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/repositories/order_repository.dart';

class GetOrderPreviewUseCase {
  final OrderRepository repository;

  GetOrderPreviewUseCase(this.repository);

  ResultTask<OrderPreview> call({
    required String branchId,
    required List<Map<String, dynamic>> items,
    required String deliveryMethod,
    String? couponId,
    double? customerLatitude,
    double? customerLongitude,
  }) {
    return repository.getOrderPreview(
      branchId: branchId,
      items: items,
      deliveryMethod: deliveryMethod,
      couponId: couponId,
      customerLatitude: customerLatitude,
      customerLongitude: customerLongitude,
    );
  }
}
