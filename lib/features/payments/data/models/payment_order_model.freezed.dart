// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentOrderModel {

@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'mercado_pago_order_id') String get mercadoPagoOrderId;@JsonKey(name: 'checkout_url') String get checkoutUrl;
/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOrderModelCopyWith<PaymentOrderModel> get copyWith => _$PaymentOrderModelCopyWithImpl<PaymentOrderModel>(this as PaymentOrderModel, _$identity);

  /// Serializes this PaymentOrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOrderModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.mercadoPagoOrderId, mercadoPagoOrderId) || other.mercadoPagoOrderId == mercadoPagoOrderId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,mercadoPagoOrderId,checkoutUrl);

@override
String toString() {
  return 'PaymentOrderModel(orderId: $orderId, mercadoPagoOrderId: $mercadoPagoOrderId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class $PaymentOrderModelCopyWith<$Res>  {
  factory $PaymentOrderModelCopyWith(PaymentOrderModel value, $Res Function(PaymentOrderModel) _then) = _$PaymentOrderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'mercado_pago_order_id') String mercadoPagoOrderId,@JsonKey(name: 'checkout_url') String checkoutUrl
});




}
/// @nodoc
class _$PaymentOrderModelCopyWithImpl<$Res>
    implements $PaymentOrderModelCopyWith<$Res> {
  _$PaymentOrderModelCopyWithImpl(this._self, this._then);

  final PaymentOrderModel _self;
  final $Res Function(PaymentOrderModel) _then;

/// Create a copy of PaymentOrderModel
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


/// Adds pattern-matching-related methods to [PaymentOrderModel].
extension PaymentOrderModelPatterns on PaymentOrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'mercado_pago_order_id')  String mercadoPagoOrderId, @JsonKey(name: 'checkout_url')  String checkoutUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'mercado_pago_order_id')  String mercadoPagoOrderId, @JsonKey(name: 'checkout_url')  String checkoutUrl)  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'mercado_pago_order_id')  String mercadoPagoOrderId, @JsonKey(name: 'checkout_url')  String checkoutUrl)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderModel() when $default != null:
return $default(_that.orderId,_that.mercadoPagoOrderId,_that.checkoutUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOrderModel extends PaymentOrderModel {
  const _PaymentOrderModel({@JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'mercado_pago_order_id') required this.mercadoPagoOrderId, @JsonKey(name: 'checkout_url') required this.checkoutUrl}): super._();
  factory _PaymentOrderModel.fromJson(Map<String, dynamic> json) => _$PaymentOrderModelFromJson(json);

@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'mercado_pago_order_id') final  String mercadoPagoOrderId;
@override@JsonKey(name: 'checkout_url') final  String checkoutUrl;

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOrderModelCopyWith<_PaymentOrderModel> get copyWith => __$PaymentOrderModelCopyWithImpl<_PaymentOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOrderModel&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.mercadoPagoOrderId, mercadoPagoOrderId) || other.mercadoPagoOrderId == mercadoPagoOrderId)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,mercadoPagoOrderId,checkoutUrl);

@override
String toString() {
  return 'PaymentOrderModel(orderId: $orderId, mercadoPagoOrderId: $mercadoPagoOrderId, checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentOrderModelCopyWith<$Res> implements $PaymentOrderModelCopyWith<$Res> {
  factory _$PaymentOrderModelCopyWith(_PaymentOrderModel value, $Res Function(_PaymentOrderModel) _then) = __$PaymentOrderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'mercado_pago_order_id') String mercadoPagoOrderId,@JsonKey(name: 'checkout_url') String checkoutUrl
});




}
/// @nodoc
class __$PaymentOrderModelCopyWithImpl<$Res>
    implements _$PaymentOrderModelCopyWith<$Res> {
  __$PaymentOrderModelCopyWithImpl(this._self, this._then);

  final _PaymentOrderModel _self;
  final $Res Function(_PaymentOrderModel) _then;

/// Create a copy of PaymentOrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? mercadoPagoOrderId = null,Object? checkoutUrl = null,}) {
  return _then(_PaymentOrderModel(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,mercadoPagoOrderId: null == mercadoPagoOrderId ? _self.mercadoPagoOrderId : mercadoPagoOrderId // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
