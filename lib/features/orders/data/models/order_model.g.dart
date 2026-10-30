// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  customerId: json['customer_id'] as String,
  branchId: json['branch_id'] as String,
  couponId: json['coupon_id'] as String?,
  deliveryDriverId: json['delivery_person_id'] as String?,
  customerNameSnapshot: json['customer_name_snapshot'] as String,
  customerPhoneSnapshot: json['customer_phone_snapshot'] as String,
  addressSnapshot: json['address_snapshot'] as String,
  subtotal: (json['subtotal'] as num).toInt(),
  shippingCost: (json['shipping_cost'] as num).toInt(),
  appliedDiscounts: (json['applied_discounts'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  deliveryEvidenceUrl: json['delivery_proof_url'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  deliveryMethod: $enumDecode(_$DeliveryMethodEnumMap, json['delivery_mode']),
  estimatedDeliveryDate: json['estimated_delivery_date'] == null
      ? null
      : DateTime.parse(json['estimated_delivery_date'] as String),
  deliveredAt: json['delivery_date'] == null
      ? null
      : DateTime.parse(json['delivery_date'] as String),
  idempotencyKey: json['idempotency_key'] as String?,
  paymentMethod: json['payment_method'] as String?,
  customerLatitude: (json['customer_latitude'] as num?)?.toDouble(),
  customerLongitude: (json['customer_longitude'] as num?)?.toDouble(),
  addressId: json['address_id'] as String?,
  items:
      (json['order_details'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$OrderModelToJson(
  _OrderModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'customer_id': instance.customerId,
  'branch_id': instance.branchId,
  'coupon_id': instance.couponId,
  'delivery_person_id': instance.deliveryDriverId,
  'customer_name_snapshot': instance.customerNameSnapshot,
  'customer_phone_snapshot': instance.customerPhoneSnapshot,
  'address_snapshot': instance.addressSnapshot,
  'subtotal': instance.subtotal,
  'shipping_cost': instance.shippingCost,
  'applied_discounts': instance.appliedDiscounts,
  'total': instance.total,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'delivery_proof_url': instance.deliveryEvidenceUrl,
  'created_at': instance.createdAt.toIso8601String(),
  'delivery_mode': _$DeliveryMethodEnumMap[instance.deliveryMethod]!,
  'estimated_delivery_date': instance.estimatedDeliveryDate?.toIso8601String(),
  'delivery_date': instance.deliveredAt?.toIso8601String(),
  'idempotency_key': instance.idempotencyKey,
  'payment_method': instance.paymentMethod,
  'customer_latitude': instance.customerLatitude,
  'customer_longitude': instance.customerLongitude,
  'address_id': instance.addressId,
  'order_details': instance.items,
};

const _$OrderStatusEnumMap = {
  OrderStatus.pendingPayment: 'pendingPayment',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.onTheWay: 'onTheWay',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};

const _$DeliveryMethodEnumMap = {
  DeliveryMethod.homeDelivery: 'delivery',
  DeliveryMethod.pickUp: 'pick_up',
};
