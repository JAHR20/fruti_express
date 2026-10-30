// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentOrder {

/// ID del pedido dentro de Fruti Express.
 String get orderId;/// ID de la orden generada por Mercado Pago.
 String get mercadoPagoOrderId;/// URL a la que se redirigirá al cliente.
 String get checkoutUrl;
/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOrderCopyWith<PaymentOrder> get copyWith => _$PaymentOrderCopyWithImpl<PaymentOrder>(this as PaymentOrder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.mercadoPagoOrderId, mercadoPagoOrderId) || other.mercadoPagoOrderId == mercadoPagoOrderId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,mercadoPagoOrderId,checkoutUrl);

@override
String toString() {
  return 'PaymentOrder(orderId: $orderId, mercadoPagoOrderId: $mercadoPagoOrderId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class $PaymentOrderCopyWith<$Res>  {
  factory $PaymentOrderCopyWith(PaymentOrder value, $Res Function(PaymentOrder) _then) = _$PaymentOrderCopyWithImpl;
@useResult
$Res call({
 String orderId, String mercadoPagoOrderId, String checkoutUrl
});




}
/// @nodoc
class _$PaymentOrderCopyWithImpl<$Res>
    implements $PaymentOrderCopyWith<$Res> {
  _$PaymentOrderCopyWithImpl(this._self, this._then);

  final PaymentOrder _self;
  final $Res Function(PaymentOrder) _then;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? mercadoPagoOrderId = null,Object? checkoutUrl = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,mercadoPagoOrderId: null == mercadoPagoOrderId ? _self.mercadoPagoOrderId : mercadoPagoOrderId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentOrder].
extension PaymentOrderPatterns on PaymentOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOrder value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOrder value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String mercadoPagoOrderId,  String checkoutUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
return $default(_that.orderId,_that.mercadoPagoOrderId,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String mercadoPagoOrderId,  String checkoutUrl)  $default,) {final _that = this;
switch (_that) {
case _PaymentOrder():
return $default(_that.orderId,_that.mercadoPagoOrderId,_that.checkoutUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String mercadoPagoOrderId,  String checkoutUrl)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOrder() when $default != null:
return $default(_that.orderId,_that.mercadoPagoOrderId,_that.checkoutUrl);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentOrder implements PaymentOrder {
  const _PaymentOrder({required this.orderId, required this.mercadoPagoOrderId, required this.checkoutUrl});
  

/// ID del pedido dentro de Fruti Express.
@override final  String orderId;
/// ID de la orden generada por Mercado Pago.
@override final  String mercadoPagoOrderId;
/// URL a la que se redirigirá al cliente.
@override final  String checkoutUrl;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOrderCopyWith<_PaymentOrder> get copyWith => __$PaymentOrderCopyWithImpl<_PaymentOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOrder&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.mercadoPagoOrderId, mercadoPagoOrderId) || other.mercadoPagoOrderId == mercadoPagoOrderId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,mercadoPagoOrderId,checkoutUrl);

@override
String toString() {
  return 'PaymentOrder(orderId: $orderId, mercadoPagoOrderId: $mercadoPagoOrderId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentOrderCopyWith<$Res> implements $PaymentOrderCopyWith<$Res> {
  factory _$PaymentOrderCopyWith(_PaymentOrder value, $Res Function(_PaymentOrder) _then) = __$PaymentOrderCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String mercadoPagoOrderId, String checkoutUrl
});




}
/// @nodoc
class __$PaymentOrderCopyWithImpl<$Res>
    implements _$PaymentOrderCopyWith<$Res> {
  __$PaymentOrderCopyWithImpl(this._self, this._then);

  final _PaymentOrder _self;
  final $Res Function(_PaymentOrder) _then;

/// Create a copy of PaymentOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? mercadoPagoOrderId = null,Object? checkoutUrl = null,}) {
  return _then(_PaymentOrder(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,mercadoPagoOrderId: null == mercadoPagoOrderId ? _self.mercadoPagoOrderId : mercadoPagoOrderId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
