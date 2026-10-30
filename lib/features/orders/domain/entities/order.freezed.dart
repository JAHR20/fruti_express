// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Order {

 String get id; String get customerId; String get branchId; String? get deliveryDriverId; String get customerNameSnapshot; String get customerPhoneSnapshot; String get addressSnapshot; int get subtotal; int get shippingCost; int get appliedDiscounts; int get total; OrderStatus get status; String? get deliveryEvidenceUrl; DateTime get createdAt; DeliveryMethod get deliveryMethod; DateTime? get estimatedDeliveryDate; DateTime? get deliveredAt; String? get paymentUrl; String? get idempotencyKey; PaymentMethodType? get paymentMethod; String? get confirmationCode; List<OrderItem> get items;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.deliveryDriverId, deliveryDriverId) || other.deliveryDriverId == deliveryDriverId)&&(identical(other.customerNameSnapshot, customerNameSnapshot) || other.customerNameSnapshot == customerNameSnapshot)&&(identical(other.customerPhoneSnapshot, customerPhoneSnapshot) || other.customerPhoneSnapshot == customerPhoneSnapshot)&&(identical(other.addressSnapshot, addressSnapshot) || other.addressSnapshot == addressSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.appliedDiscounts, appliedDiscounts) || other.appliedDiscounts == appliedDiscounts)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryEvidenceUrl, deliveryEvidenceUrl) || other.deliveryEvidenceUrl == deliveryEvidenceUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.estimatedDeliveryDate, estimatedDeliveryDate) || other.estimatedDeliveryDate == estimatedDeliveryDate)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.confirmationCode, confirmationCode) || other.confirmationCode == confirmationCode)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,deliveryDriverId,customerNameSnapshot,customerPhoneSnapshot,addressSnapshot,subtotal,shippingCost,appliedDiscounts,total,status,deliveryEvidenceUrl,createdAt,deliveryMethod,estimatedDeliveryDate,deliveredAt,paymentUrl,idempotencyKey,paymentMethod,confirmationCode,const DeepCollectionEquality().hash(items)]);

@override
String toString() {
  return 'Order(id: $id, customerId: $customerId, branchId: $branchId, deliveryDriverId: $deliveryDriverId, customerNameSnapshot: $customerNameSnapshot, customerPhoneSnapshot: $customerPhoneSnapshot, addressSnapshot: $addressSnapshot, subtotal: $subtotal, shippingCost: $shippingCost, appliedDiscounts: $appliedDiscounts, total: $total, status: $status, deliveryEvidenceUrl: $deliveryEvidenceUrl, createdAt: $createdAt, deliveryMethod: $deliveryMethod, estimatedDeliveryDate: $estimatedDeliveryDate, deliveredAt: $deliveredAt, paymentUrl: $paymentUrl, idempotencyKey: $idempotencyKey, paymentMethod: $paymentMethod, confirmationCode: $confirmationCode, items: $items)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String customerId, String branchId, String? deliveryDriverId, String customerNameSnapshot, String customerPhoneSnapshot, String addressSnapshot, int subtotal, int shippingCost, int appliedDiscounts, int total, OrderStatus status, String? deliveryEvidenceUrl, DateTime createdAt, DeliveryMethod deliveryMethod, DateTime? estimatedDeliveryDate, DateTime? deliveredAt, String? paymentUrl, String? idempotencyKey, PaymentMethodType? paymentMethod, String? confirmationCode, List<OrderItem> items
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? deliveryDriverId = freezed,Object? customerNameSnapshot = null,Object? customerPhoneSnapshot = null,Object? addressSnapshot = null,Object? subtotal = null,Object? shippingCost = null,Object? appliedDiscounts = null,Object? total = null,Object? status = null,Object? deliveryEvidenceUrl = freezed,Object? createdAt = null,Object? deliveryMethod = null,Object? estimatedDeliveryDate = freezed,Object? deliveredAt = freezed,Object? paymentUrl = freezed,Object? idempotencyKey = freezed,Object? paymentMethod = freezed,Object? confirmationCode = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,deliveryDriverId: freezed == deliveryDriverId ? _self.deliveryDriverId : deliveryDriverId // ignore: cast_nullable_to_non_nullable
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
as DateTime?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType?,confirmationCode: freezed == confirmationCode ? _self.confirmationCode : confirmationCode // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerId,  String branchId,  String? deliveryDriverId,  String customerNameSnapshot,  String customerPhoneSnapshot,  String addressSnapshot,  int subtotal,  int shippingCost,  int appliedDiscounts,  int total,  OrderStatus status,  String? deliveryEvidenceUrl,  DateTime createdAt,  DeliveryMethod deliveryMethod,  DateTime? estimatedDeliveryDate,  DateTime? deliveredAt,  String? paymentUrl,  String? idempotencyKey,  PaymentMethodType? paymentMethod,  String? confirmationCode,  List<OrderItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.paymentUrl,_that.idempotencyKey,_that.paymentMethod,_that.confirmationCode,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerId,  String branchId,  String? deliveryDriverId,  String customerNameSnapshot,  String customerPhoneSnapshot,  String addressSnapshot,  int subtotal,  int shippingCost,  int appliedDiscounts,  int total,  OrderStatus status,  String? deliveryEvidenceUrl,  DateTime createdAt,  DeliveryMethod deliveryMethod,  DateTime? estimatedDeliveryDate,  DateTime? deliveredAt,  String? paymentUrl,  String? idempotencyKey,  PaymentMethodType? paymentMethod,  String? confirmationCode,  List<OrderItem> items)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.customerId,_that.branchId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.paymentUrl,_that.idempotencyKey,_that.paymentMethod,_that.confirmationCode,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerId,  String branchId,  String? deliveryDriverId,  String customerNameSnapshot,  String customerPhoneSnapshot,  String addressSnapshot,  int subtotal,  int shippingCost,  int appliedDiscounts,  int total,  OrderStatus status,  String? deliveryEvidenceUrl,  DateTime createdAt,  DeliveryMethod deliveryMethod,  DateTime? estimatedDeliveryDate,  DateTime? deliveredAt,  String? paymentUrl,  String? idempotencyKey,  PaymentMethodType? paymentMethod,  String? confirmationCode,  List<OrderItem> items)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.customerId,_that.branchId,_that.deliveryDriverId,_that.customerNameSnapshot,_that.customerPhoneSnapshot,_that.addressSnapshot,_that.subtotal,_that.shippingCost,_that.appliedDiscounts,_that.total,_that.status,_that.deliveryEvidenceUrl,_that.createdAt,_that.deliveryMethod,_that.estimatedDeliveryDate,_that.deliveredAt,_that.paymentUrl,_that.idempotencyKey,_that.paymentMethod,_that.confirmationCode,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Order implements Order {
  const _Order({required this.id, required this.customerId, required this.branchId, this.deliveryDriverId, required this.customerNameSnapshot, required this.customerPhoneSnapshot, required this.addressSnapshot, required this.subtotal, required this.shippingCost, required this.appliedDiscounts, required this.total, required this.status, this.deliveryEvidenceUrl, required this.createdAt, required this.deliveryMethod, this.estimatedDeliveryDate, this.deliveredAt, this.paymentUrl, this.idempotencyKey, this.paymentMethod, this.confirmationCode, required final  List<OrderItem> items}): _items = items;
  

@override final  String id;
@override final  String customerId;
@override final  String branchId;
@override final  String? deliveryDriverId;
@override final  String customerNameSnapshot;
@override final  String customerPhoneSnapshot;
@override final  String addressSnapshot;
@override final  int subtotal;
@override final  int shippingCost;
@override final  int appliedDiscounts;
@override final  int total;
@override final  OrderStatus status;
@override final  String? deliveryEvidenceUrl;
@override final  DateTime createdAt;
@override final  DeliveryMethod deliveryMethod;
@override final  DateTime? estimatedDeliveryDate;
@override final  DateTime? deliveredAt;
@override final  String? paymentUrl;
@override final  String? idempotencyKey;
@override final  PaymentMethodType? paymentMethod;
@override final  String? confirmationCode;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.deliveryDriverId, deliveryDriverId) || other.deliveryDriverId == deliveryDriverId)&&(identical(other.customerNameSnapshot, customerNameSnapshot) || other.customerNameSnapshot == customerNameSnapshot)&&(identical(other.customerPhoneSnapshot, customerPhoneSnapshot) || other.customerPhoneSnapshot == customerPhoneSnapshot)&&(identical(other.addressSnapshot, addressSnapshot) || other.addressSnapshot == addressSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.appliedDiscounts, appliedDiscounts) || other.appliedDiscounts == appliedDiscounts)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryEvidenceUrl, deliveryEvidenceUrl) || other.deliveryEvidenceUrl == deliveryEvidenceUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deliveryMethod, deliveryMethod) || other.deliveryMethod == deliveryMethod)&&(identical(other.estimatedDeliveryDate, estimatedDeliveryDate) || other.estimatedDeliveryDate == estimatedDeliveryDate)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.confirmationCode, confirmationCode) || other.confirmationCode == confirmationCode)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,branchId,deliveryDriverId,customerNameSnapshot,customerPhoneSnapshot,addressSnapshot,subtotal,shippingCost,appliedDiscounts,total,status,deliveryEvidenceUrl,createdAt,deliveryMethod,estimatedDeliveryDate,deliveredAt,paymentUrl,idempotencyKey,paymentMethod,confirmationCode,const DeepCollectionEquality().hash(_items)]);

@override
String toString() {
  return 'Order(id: $id, customerId: $customerId, branchId: $branchId, deliveryDriverId: $deliveryDriverId, customerNameSnapshot: $customerNameSnapshot, customerPhoneSnapshot: $customerPhoneSnapshot, addressSnapshot: $addressSnapshot, subtotal: $subtotal, shippingCost: $shippingCost, appliedDiscounts: $appliedDiscounts, total: $total, status: $status, deliveryEvidenceUrl: $deliveryEvidenceUrl, createdAt: $createdAt, deliveryMethod: $deliveryMethod, estimatedDeliveryDate: $estimatedDeliveryDate, deliveredAt: $deliveredAt, paymentUrl: $paymentUrl, idempotencyKey: $idempotencyKey, paymentMethod: $paymentMethod, confirmationCode: $confirmationCode, items: $items)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerId, String branchId, String? deliveryDriverId, String customerNameSnapshot, String customerPhoneSnapshot, String addressSnapshot, int subtotal, int shippingCost, int appliedDiscounts, int total, OrderStatus status, String? deliveryEvidenceUrl, DateTime createdAt, DeliveryMethod deliveryMethod, DateTime? estimatedDeliveryDate, DateTime? deliveredAt, String? paymentUrl, String? idempotencyKey, PaymentMethodType? paymentMethod, String? confirmationCode, List<OrderItem> items
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? branchId = null,Object? deliveryDriverId = freezed,Object? customerNameSnapshot = null,Object? customerPhoneSnapshot = null,Object? addressSnapshot = null,Object? subtotal = null,Object? shippingCost = null,Object? appliedDiscounts = null,Object? total = null,Object? status = null,Object? deliveryEvidenceUrl = freezed,Object? createdAt = null,Object? deliveryMethod = null,Object? estimatedDeliveryDate = freezed,Object? deliveredAt = freezed,Object? paymentUrl = freezed,Object? idempotencyKey = freezed,Object? paymentMethod = freezed,Object? confirmationCode = freezed,Object? items = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,deliveryDriverId: freezed == deliveryDriverId ? _self.deliveryDriverId : deliveryDriverId // ignore: cast_nullable_to_non_nullable
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
as DateTime?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as PaymentMethodType?,confirmationCode: freezed == confirmationCode ? _self.confirmationCode : confirmationCode // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,
  ));
}


}

// dart format on
