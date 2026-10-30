// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 String get id;@JsonKey(name: 'customer_id') String get customerId;@JsonKey(name: 'branch_id') String get branchId;@JsonKey(name: 'coupon_id') String? get couponId;@JsonKey(name: 'delivery_person_id') String? get deliveryDriverId;@JsonKey(name: 'customer_name_snapshot') String get customerNameSnapshot;@JsonKey(name: 'customer_phone_snapshot') String get customerPhoneSnapshot;@JsonKey(name: 'address_snapshot') String get addressSnapshot; int get subtotal;@JsonKey(name: 'shipping_cost') int get shippingCost;@JsonKey(name: 'applied_discounts') int get appliedDiscounts; int get total; OrderStatus get status;@JsonKey(name: 'delivery_proof_url') String? get deliveryEvidenceUrl;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'delivery_mode') DeliveryMethod get deliveryMethod;@JsonKey(name: 'estimated_delivery_date') DateTime? get estimatedDeliveryDate;@JsonKey(name: 'delivery_date') DateTime? get deliveredAt;@JsonKey(name: 'idempotency_key') String? get idempotencyKey;@JsonKey(name: 'payment_method') String? get paymentMethod;@JsonKey(name: 'customer_latitude') double? get customerLatitude;@JsonKey(name: 'customer_longitude') double? get customerLongitude;@JsonKey(name: 'address_id') String? get addressId;@JsonKey(includeFromJson: false, includeToJson: false) String? get confirmationCode;@JsonKey(name: 'order_details') List<OrderItemModel> get items;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.deliveryDriverId, deliveryDriverId) || other.deliveryDriverId == deliveryDriverId)&&(identical(other.customerNameSnapshot, customerNameSnapshot) || other.customerNameSnapshot == customerNameSnapshot)&&(identical(other.customerPhoneSnapshot, customerPhoneSnapshot) || other.customerPhoneSnapshot == customerPhoneSnapshot)&&(identical(other.addressSnapshot, addressSnapshot) || other.addressSnapshot == addressSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.appliedDiscounts, appliedDiscounts) || other.appliedDiscounts == appliedDiscounts)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryEvidenceUrl, deliveryEvidenceUrl) || other.deliveryEvidenceUrl == deliveryEvidenceUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.estimatedDeliveryDate, estimatedDeliveryDate) || other.estimatedDeliveryDate == estimatedDeliveryDate)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customerLatitude, customerLatitude) || other.customerLatitude == customerLatitude)&&(identical(other.customerLongitude, customerLongitude) || other.customerLongitude == customerLongitude)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.confirmationCode, confirmationCode) || other.confirmationCode == confirmationCode)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,couponId,deliveryDriverId,customerNameSnapshot,customerPhoneSnapshot,addressSnapshot,subtotal,shippingCost,appliedDiscounts,total,status,deliveryEvidenceUrl,createdAt,deliveryMethod,estimatedDeliveryDate,deliveredAt,idempotencyKey,paymentMethod,customerLatitude,customerLongitude,addressId,confirmationCode,const DeepCollectionEquality().hash(items)]);

@override
String toString() {
  return 'OrderModel(id: $id, customerId: $customerId, branchId: $branchId, couponId: $couponId, deliveryDriverId: $deliveryDriverId, customerNameSnapshot: $customerNameSnapshot, customerPhoneSnapshot: $customerPhoneSnapshot, addressSnapshot: $addressSnapshot, subtotal: $subtotal, shippingCost: $shippingCost, appliedDiscounts: $appliedDiscounts, total: $total, status: $status, deliveryEvidenceUrl: $deliveryEvidenceUrl, createdAt: $createdAt, deliveryMethod: $deliveryMethod, estimatedDeliveryDate: $estimatedDeliveryDate, deliveredAt: $deliveredAt, idempotencyKey: $idempotencyKey, paymentMethod: $paymentMethod, customerLatitude: $customerLatitude, customerLongitude: $customerLongitude, addressId: $addressId, confirmationCode: $confirmationCode, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'customer_id') String customerId,@JsonKey(name: 'branch_id') String branchId,@JsonKey(name: 'coupon_id') String? couponId,@JsonKey(name: 'delivery_person_id') String? deliveryDriverId,@JsonKey(name: 'customer_name_snapshot') String customerNameSnapshot,@JsonKey(name: 'customer_phone_snapshot') String customerPhoneSnapshot,@JsonKey(name: 'address_snapshot') String addressSnapshot, int subtotal,@JsonKey(name: 'shipping_cost') int shippingCost,@JsonKey(name: 'applied_discounts') int appliedDiscounts, int total, OrderStatus status,@JsonKey(name: 'delivery_proof_url') String? deliveryEvidenceUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'delivery_mode') DeliveryMethod deliveryMethod,@JsonKey(name: 'estimated_delivery_date') DateTime? estimatedDeliveryDate,@JsonKey(name: 'delivery_date') DateTime? deliveredAt,@JsonKey(name: 'idempotency_key') String? idempotencyKey,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'customer_latitude') double? customerLatitude,@JsonKey(name: 'customer_longitude') double? customerLongitude,@JsonKey(name: 'address_id') String? addressId,@JsonKey(includeFromJson: false, includeToJson: false) String? confirmationCode,@JsonKey(name: 'order_details') List<OrderItemModel> items
});




}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? couponId = freezed,Object? deliveryDriverId = freezed,Object? customerNameSnapshot = null,Object? customerPhoneSnapshot = null,Object? addressSnapshot = null,Object? subtotal = null,Object? shippingCost = null,Object? appliedDiscounts = null,Object? total = null,Object? status = null,Object? deliveryEvidenceUrl = freezed,Object? createdAt = null,Object? deliveryMethod = null,Object? estimatedDeliveryDate = freezed,Object? deliveredAt = freezed,Object? idempotencyKey = freezed,Object? paymentMethod = freezed,Object? customerLatitude = freezed,Object? customerLongitude = freezed,Object? addressId = freezed,Object? confirmationCode = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as String?,deliveryDriverId: freezed == deliveryDriverId ? _self.deliveryDriverId : deliveryDriverId // ignore: cast_nullable_to_non_nullable
as String?,customerNameSnapshot: null == customerNameSnapshot ? _self.customerNameSnapshot : customerNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,customerPhoneSnapshot: null == customerPhoneSnapshot ? _self.customerPhoneSnapshot : customerPhoneSnapshot // ignore: cast_nullable_to_non_nullable
as String,addressSnapshot: null == addressSnapshot ? _self.addressSnapshot : addressSnapshot // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,appliedDiscounts: null == appliedDiscounts ? _self.appliedDiscounts : appliedDiscounts // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryEvidenceUrl: freezed == deliveryEvidenceUrl ? _self.deliveryEvidenceUrl : deliveryEvidenceUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod,estimatedDeliveryDate: freezed == estimatedDeliveryDate ? _self.estimatedDeliveryDate : estimatedDeliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,customerLatitude: freezed == customerLatitude ? _self.customerLatitude : customerLatitude // ignore: cast_nullable_to_non_nullable
as double?,customerLongitude: freezed == customerLongitude ? _self.customerLongitude : customerLongitude // ignore: cast_nullable_to_non_nullable
as double?,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,confirmationCode: freezed == confirmationCode ? _self.confirmationCode : confirmationCode // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_id')  String customerId, @JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'coupon_id')  String? couponId, @JsonKey(name: 'delivery_person_id')  String? deliveryDriverId, @JsonKey(name: 'customer_name_snapshot')  String customerNameSnapshot, @JsonKey(name: 'customer_phone_snapshot')  String customerPhoneSnapshot, @JsonKey(name: 'address_snapshot')  String addressSnapshot,  int subtotal, @JsonKey(name: 'shipping_cost')  int shippingCost, @JsonKey(name: 'applied_discounts')  int appliedDiscounts,  int total,  OrderStatus status, @JsonKey(name: 'delivery_proof_url')  String? deliveryEvidenceUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'delivery_mode')  DeliveryMethod deliveryMethod, @JsonKey(name: 'estimated_delivery_date')  DateTime? estimatedDeliveryDate, @JsonKey(name: 'delivery_date')  DateTime? deliveredAt, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'customer_latitude')  double? customerLatitude, @JsonKey(name: 'customer_longitude')  double? customerLongitude, @JsonKey(name: 'address_id')  String? addressId, @JsonKey(includeFromJson: false, includeToJson: false)  String? confirmationCode, @JsonKey(name: 'order_details')  List<OrderItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.couponId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.idempotencyKey,_that.paymentMethod,_that.customerLatitude,_that.customerLongitude,_that.addressId,_that.confirmationCode,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'customer_id')  String customerId, @JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'coupon_id')  String? couponId, @JsonKey(name: 'delivery_person_id')  String? deliveryDriverId, @JsonKey(name: 'customer_name_snapshot')  String customerNameSnapshot, @JsonKey(name: 'customer_phone_snapshot')  String customerPhoneSnapshot, @JsonKey(name: 'address_snapshot')  String addressSnapshot,  int subtotal, @JsonKey(name: 'shipping_cost')  int shippingCost, @JsonKey(name: 'applied_discounts')  int appliedDiscounts,  int total,  OrderStatus status, @JsonKey(name: 'delivery_proof_url')  String? deliveryEvidenceUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'delivery_mode')  DeliveryMethod deliveryMethod, @JsonKey(name: 'estimated_delivery_date')  DateTime? estimatedDeliveryDate, @JsonKey(name: 'delivery_date')  DateTime? deliveredAt, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'customer_latitude')  double? customerLatitude, @JsonKey(name: 'customer_longitude')  double? customerLongitude, @JsonKey(name: 'address_id')  String? addressId, @JsonKey(includeFromJson: false, includeToJson: false)  String? confirmationCode, @JsonKey(name: 'order_details')  List<OrderItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.customerId,_that.branchId,_that.couponId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.idempotencyKey,_that.paymentMethod,_that.customerLatitude,_that.customerLongitude,_that.addressId,_that.confirmationCode,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'customer_id')  String customerId, @JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'coupon_id')  String? couponId, @JsonKey(name: 'delivery_person_id')  String? deliveryDriverId, @JsonKey(name: 'customer_name_snapshot')  String customerNameSnapshot, @JsonKey(name: 'customer_phone_snapshot')  String customerPhoneSnapshot, @JsonKey(name: 'address_snapshot')  String addressSnapshot,  int subtotal, @JsonKey(name: 'shipping_cost')  int shippingCost, @JsonKey(name: 'applied_discounts')  int appliedDiscounts,  int total,  OrderStatus status, @JsonKey(name: 'delivery_proof_url')  String? deliveryEvidenceUrl, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'delivery_mode')  DeliveryMethod deliveryMethod, @JsonKey(name: 'estimated_delivery_date')  DateTime? estimatedDeliveryDate, @JsonKey(name: 'delivery_date')  DateTime? deliveredAt, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'customer_latitude')  double? customerLatitude, @JsonKey(name: 'customer_longitude')  double? customerLongitude, @JsonKey(name: 'address_id')  String? addressId, @JsonKey(includeFromJson: false, includeToJson: false)  String? confirmationCode, @JsonKey(name: 'order_details')  List<OrderItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.couponId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.idempotencyKey,_that.paymentMethod,_that.customerLatitude,_that.customerLongitude,_that.addressId,_that.confirmationCode,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
  const _OrderModel({required this.id, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'branch_id') required this.branchId, @JsonKey(name: 'coupon_id') this.couponId, @JsonKey(name: 'delivery_person_id') this.deliveryDriverId, @JsonKey(name: 'customer_name_snapshot') required this.customerNameSnapshot, @JsonKey(name: 'customer_phone_snapshot') required this.customerPhoneSnapshot, @JsonKey(name: 'address_snapshot') required this.addressSnapshot, required this.subtotal, @JsonKey(name: 'shipping_cost') required this.shippingCost, @JsonKey(name: 'applied_discounts') required this.appliedDiscounts, required this.total, required this.status, @JsonKey(name: 'delivery_proof_url') this.deliveryEvidenceUrl, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'delivery_mode') required this.deliveryMethod, @JsonKey(name: 'estimated_delivery_date') this.estimatedDeliveryDate, @JsonKey(name: 'delivery_date') this.deliveredAt, @JsonKey(name: 'idempotency_key') this.idempotencyKey, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'customer_latitude') this.customerLatitude, @JsonKey(name: 'customer_longitude') this.customerLongitude, @JsonKey(name: 'address_id') this.addressId, @JsonKey(includeFromJson: false, includeToJson: false) this.confirmationCode, @JsonKey(name: 'order_details') final  List<OrderItemModel> items = const []}): _items = items;
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'customer_id') final  String customerId;
@override@JsonKey(name: 'branch_id') final  String branchId;
@override@JsonKey(name: 'coupon_id') final  String? couponId;
@override@JsonKey(name: 'delivery_person_id') final  String? deliveryDriverId;
@override@JsonKey(name: 'customer_name_snapshot') final  String customerNameSnapshot;
@override@JsonKey(name: 'customer_phone_snapshot') final  String customerPhoneSnapshot;
@override@JsonKey(name: 'address_snapshot') final  String addressSnapshot;
@override final  int subtotal;
@override@JsonKey(name: 'shipping_cost') final  int shippingCost;
@override@JsonKey(name: 'applied_discounts') final  int appliedDiscounts;
@override final  int total;
@override final  OrderStatus status;
@override@JsonKey(name: 'delivery_proof_url') final  String? deliveryEvidenceUrl;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'delivery_mode') final  DeliveryMethod deliveryMethod;
@override@JsonKey(name: 'estimated_delivery_date') final  DateTime? estimatedDeliveryDate;
@override@JsonKey(name: 'delivery_date') final  DateTime? deliveredAt;
@override@JsonKey(name: 'idempotency_key') final  String? idempotencyKey;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override@JsonKey(name: 'customer_latitude') final  double? customerLatitude;
@override@JsonKey(name: 'customer_longitude') final  double? customerLongitude;
@override@JsonKey(name: 'address_id') final  String? addressId;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? confirmationCode;
 final  List<OrderItemModel> _items;
@override@JsonKey(name: 'order_details') List<OrderItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.couponId, couponId) || other.couponId == couponId)&&(identical(other.deliveryDriverId, deliveryDriverId) || other.deliveryDriverId == deliveryDriverId)&&(identical(other.customerNameSnapshot, customerNameSnapshot) || other.customerNameSnapshot == customerNameSnapshot)&&(identical(other.customerPhoneSnapshot, customerPhoneSnapshot) || other.customerPhoneSnapshot == customerPhoneSnapshot)&&(identical(other.addressSnapshot, addressSnapshot) || other.addressSnapshot == addressSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.appliedDiscounts, appliedDiscounts) || other.appliedDiscounts == appliedDiscounts)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryEvidenceUrl, deliveryEvidenceUrl) || other.deliveryEvidenceUrl == deliveryEvidenceUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.estimatedDeliveryDate, estimatedDeliveryDate) || other.estimatedDeliveryDate == estimatedDeliveryDate)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.customerLatitude, customerLatitude) || other.customerLatitude == customerLatitude)&&(identical(other.customerLongitude, customerLongitude) || other.customerLongitude == customerLongitude)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.confirmationCode, confirmationCode) || other.confirmationCode == confirmationCode)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,couponId,deliveryDriverId,customerNameSnapshot,customerPhoneSnapshot,addressSnapshot,subtotal,shippingCost,appliedDiscounts,total,status,deliveryEvidenceUrl,createdAt,deliveryMethod,estimatedDeliveryDate,deliveredAt,idempotencyKey,paymentMethod,customerLatitude,customerLongitude,addressId,confirmationCode,const DeepCollectionEquality().hash(_items)]);

@override
String toString() {
  return 'OrderModel(id: $id, customerId: $customerId, branchId: $branchId, couponId: $couponId, deliveryDriverId: $deliveryDriverId, customerNameSnapshot: $customerNameSnapshot, customerPhoneSnapshot: $customerPhoneSnapshot, addressSnapshot: $addressSnapshot, subtotal: $subtotal, shippingCost: $shippingCost, appliedDiscounts: $appliedDiscounts, total: $total, status: $status, deliveryEvidenceUrl: $deliveryEvidenceUrl, createdAt: $createdAt, deliveryMethod: $deliveryMethod, estimatedDeliveryDate: $estimatedDeliveryDate, deliveredAt: $deliveredAt, idempotencyKey: $idempotencyKey, paymentMethod: $paymentMethod, customerLatitude: $customerLatitude, customerLongitude: $customerLongitude, addressId: $addressId, confirmationCode: $confirmationCode, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'customer_id') String customerId,@JsonKey(name: 'branch_id') String branchId,@JsonKey(name: 'coupon_id') String? couponId,@JsonKey(name: 'delivery_person_id') String? deliveryDriverId,@JsonKey(name: 'customer_name_snapshot') String customerNameSnapshot,@JsonKey(name: 'customer_phone_snapshot') String customerPhoneSnapshot,@JsonKey(name: 'address_snapshot') String addressSnapshot, int subtotal,@JsonKey(name: 'shipping_cost') int shippingCost,@JsonKey(name: 'applied_discounts') int appliedDiscounts, int total, OrderStatus status,@JsonKey(name: 'delivery_proof_url') String? deliveryEvidenceUrl,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'delivery_mode') DeliveryMethod deliveryMethod,@JsonKey(name: 'estimated_delivery_date') DateTime? estimatedDeliveryDate,@JsonKey(name: 'delivery_date') DateTime? deliveredAt,@JsonKey(name: 'idempotency_key') String? idempotencyKey,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'customer_latitude') double? customerLatitude,@JsonKey(name: 'customer_longitude') double? customerLongitude,@JsonKey(name: 'address_id') String? addressId,@JsonKey(includeFromJson: false, includeToJson: false) String? confirmationCode,@JsonKey(name: 'order_details') List<OrderItemModel> items
});




}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? couponId = freezed,Object? deliveryDriverId = freezed,Object? customerNameSnapshot = null,Object? customerPhoneSnapshot = null,Object? addressSnapshot = null,Object? subtotal = null,Object? shippingCost = null,Object? appliedDiscounts = null,Object? total = null,Object? status = null,Object? deliveryEvidenceUrl = freezed,Object? createdAt = null,Object? deliveryMethod = null,Object? estimatedDeliveryDate = freezed,Object? deliveredAt = freezed,Object? idempotencyKey = freezed,Object? paymentMethod = freezed,Object? customerLatitude = freezed,Object? customerLongitude = freezed,Object? addressId = freezed,Object? confirmationCode = freezed,Object? items = null,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,couponId: freezed == couponId ? _self.couponId : couponId // ignore: cast_nullable_to_non_nullable
as String?,deliveryDriverId: freezed == deliveryDriverId ? _self.deliveryDriverId : deliveryDriverId // ignore: cast_nullable_to_non_nullable
as String?,customerNameSnapshot: null == customerNameSnapshot ? _self.customerNameSnapshot : customerNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,customerPhoneSnapshot: null == customerPhoneSnapshot ? _self.customerPhoneSnapshot : customerPhoneSnapshot // ignore: cast_nullable_to_non_nullable
as String,addressSnapshot: null == addressSnapshot ? _self.addressSnapshot : addressSnapshot // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,appliedDiscounts: null == appliedDiscounts ? _self.appliedDiscounts : appliedDiscounts // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,deliveryEvidenceUrl: freezed == deliveryEvidenceUrl ? _self.deliveryEvidenceUrl : deliveryEvidenceUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deliveryMethod: null == deliveryMethod ? _self.deliveryMethod : deliveryMethod // ignore: cast_nullable_to_non_nullable
as DeliveryMethod,estimatedDeliveryDate: freezed == estimatedDeliveryDate ? _self.estimatedDeliveryDate : estimatedDeliveryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,customerLatitude: freezed == customerLatitude ? _self.customerLatitude : customerLatitude // ignore: cast_nullable_to_non_nullable
as double?,customerLongitude: freezed == customerLongitude ? _self.customerLongitude : customerLongitude // ignore: cast_nullable_to_non_nullable
as double?,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,confirmationCode: freezed == confirmationCode ? _self.confirmationCode : confirmationCode // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemModel>,
  ));
}


}

// dart format on
