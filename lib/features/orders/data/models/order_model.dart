import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/enums/delivery_method.dart';
import 'package:fruti_express_jahr_admin/features/orders/domain/use_cases/create_order_params.dart';
import '../../domain/entities/order.dart';
import '../../domain/enums/order_status.dart';
import 'order_item_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'branch_id') required String branchId,
    @JsonKey(name: 'coupon_id') String? couponId,
    @JsonKey(name: 'delivery_person_id') String? deliveryDriverId,
    @JsonKey(name: 'customer_name_snapshot') required String customerNameSnapshot,
    @JsonKey(name: 'customer_phone_snapshot') required String customerPhoneSnapshot,
    @JsonKey(name: 'address_snapshot') required String addressSnapshot,
    required int subtotal,
    @JsonKey(name: 'shipping_cost') required int shippingCost,
    @JsonKey(name: 'applied_discounts') required int appliedDiscounts,
    required int total,
    required OrderStatus status,
    @JsonKey(name: 'delivery_proof_url') String? deliveryEvidenceUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'delivery_mode') required DeliveryMethod deliveryMethod,
    @JsonKey(name: 'estimated_delivery_date') DateTime? estimatedDeliveryDate,
    @JsonKey(name: 'delivery_date') DateTime? deliveredAt,
    @JsonKey(name: 'idempotency_key') String? idempotencyKey,
    @JsonKey(includeFromJson: false, includeToJson: false) String? confirmationCode,
    @JsonKey(name: 'order_details') @Default([]) List<OrderItemModel> items,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

extension OrderModelX on OrderModel {
  Order toDomain() => Order(
    id: id,
    customerId: customerId,
    branchId: branchId,
    deliveryDriverId: deliveryDriverId,
    customerNameSnapshot: customerNameSnapshot,
    customerPhoneSnapshot: customerPhoneSnapshot,
    addressSnapshot: addressSnapshot,
    subtotal: subtotal,
    shippingCost: shippingCost,
    appliedDiscounts: appliedDiscounts,
    total: total,
    status: status,
    deliveryEvidenceUrl: deliveryEvidenceUrl,
    createdAt: createdAt,
    deliveryMethod: deliveryMethod,
    estimatedDeliveryDate: estimatedDeliveryDate,
    deliveredAt: deliveredAt,
    confirmationCode: confirmationCode,
    items: items.map((i) => i.toDomain()).toList(),
  );

  static OrderModel fromDomain(Order o) => OrderModel(
    id: o.id,
    customerId: o.customerId,
    branchId: o.branchId,
    deliveryDriverId: o.deliveryDriverId,
    customerNameSnapshot: o.customerNameSnapshot,
    customerPhoneSnapshot: o.customerPhoneSnapshot,
    addressSnapshot: o.addressSnapshot,
    subtotal: o.subtotal,
    shippingCost: o.shippingCost,
    appliedDiscounts: o.appliedDiscounts,
    total: o.total,
    status: o.status,
    deliveryEvidenceUrl: o.deliveryEvidenceUrl,
    createdAt: o.createdAt,
    deliveryMethod: o.deliveryMethod,
    estimatedDeliveryDate: o.estimatedDeliveryDate,
    deliveredAt: o.deliveredAt,
    confirmationCode: o.confirmationCode,
    items: o.items.map((i) => OrderItemModelX.fromDomain(i)).toList(),
  );

  static OrderModel fromParams(CreateOrderParams p) => OrderModel(
    id: '',
    customerId: p.customerId,
    branchId: p.branchId,
    couponId: p.couponId,
    customerNameSnapshot: p.customerNameSnapshot,
    customerPhoneSnapshot: p.customerPhoneSnapshot,
    addressSnapshot: p.addressSnapshot,
    subtotal: p.subtotal,
    shippingCost: p.shippingCost,
    appliedDiscounts: p.appliedDiscounts,
    total: p.total,
    status: OrderStatus.pendingPayment,
    createdAt: DateTime.now(),
    deliveryMethod: p.deliveryMethod,
    items: p.items
        .map(
          (i) => OrderItemModel(
            id: '',
            orderId: '',
            productId: i.productId,
            productNameSnapshot: i.productNameSnapshot,
            quantity: i.quantity,
            unitPriceSnapshot: i.unitPriceSnapshot,
            measurementUnit: i.measurementUnit,
          ),
        )
        .toList(),
  );
}