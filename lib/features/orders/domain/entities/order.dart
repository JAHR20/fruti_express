import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/core/enums/payment_method_type.dart';
import '../enums/order_status.dart'; // estado_pedido.dart -> order_status.dart
import 'order_item.dart';

part 'order.freezed.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    required String customerId, 
    required String branchId, 
    String? deliveryDriverId, 
    required String customerNameSnapshot,
    required String customerPhoneSnapshot,
    required String addressSnapshot,
    required int subtotal,
    required int shippingCost,
    required int appliedDiscounts,
    required int total,
    required OrderStatus status, 
    String? deliveryEvidenceUrl, 
    required DateTime createdAt, 
    required DeliveryMethod deliveryMethod,
    DateTime? estimatedDeliveryDate, 
    DateTime? deliveredAt, 
    String? idempotencyKey,
    PaymentMethodType? paymentMethod,
    String? confirmationCode,
    required List<OrderItem> items,
  }) = _Order;
}