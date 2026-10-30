// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState()';
}


}

/// @nodoc
class $OrderStateCopyWith<$Res>  {
$OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Processing value)?  processing,TResult Function( _AwaitingPayment value)?  awaitingPayment,TResult Function( _RedirectToPayment value)?  redirectToPayment,TResult Function( _ConfirmingPayment value)?  confirmingPayment,TResult Function( _Completed value)?  completed,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Processing() when processing != null:
return processing(_that);case _AwaitingPayment() when awaitingPayment != null:
return awaitingPayment(_that);case _RedirectToPayment() when redirectToPayment != null:
return redirectToPayment(_that);case _ConfirmingPayment() when confirmingPayment != null:
return confirmingPayment(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Processing value)  processing,required TResult Function( _AwaitingPayment value)  awaitingPayment,required TResult Function( _RedirectToPayment value)  redirectToPayment,required TResult Function( _ConfirmingPayment value)  confirmingPayment,required TResult Function( _Completed value)  completed,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Processing():
return processing(_that);case _AwaitingPayment():
return awaitingPayment(_that);case _RedirectToPayment():
return redirectToPayment(_that);case _ConfirmingPayment():
return confirmingPayment(_that);case _Completed():
return completed(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Processing value)?  processing,TResult? Function( _AwaitingPayment value)?  awaitingPayment,TResult? Function( _RedirectToPayment value)?  redirectToPayment,TResult? Function( _ConfirmingPayment value)?  confirmingPayment,TResult? Function( _Completed value)?  completed,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Processing() when processing != null:
return processing(_that);case _AwaitingPayment() when awaitingPayment != null:
return awaitingPayment(_that);case _RedirectToPayment() when redirectToPayment != null:
return redirectToPayment(_that);case _ConfirmingPayment() when confirmingPayment != null:
return confirmingPayment(_that);case _Completed() when completed != null:
return completed(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  processing,TResult Function( Order order)?  awaitingPayment,TResult Function( String initPointUrl,  Order order)?  redirectToPayment,TResult Function()?  confirmingPayment,TResult Function( Order order)?  completed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Processing() when processing != null:
return processing();case _AwaitingPayment() when awaitingPayment != null:
return awaitingPayment(_that.order);case _RedirectToPayment() when redirectToPayment != null:
return redirectToPayment(_that.initPointUrl,_that.order);case _ConfirmingPayment() when confirmingPayment != null:
return confirmingPayment();case _Completed() when completed != null:
return completed(_that.order);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  processing,required TResult Function( Order order)  awaitingPayment,required TResult Function( String initPointUrl,  Order order)  redirectToPayment,required TResult Function()  confirmingPayment,required TResult Function( Order order)  completed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Processing():
return processing();case _AwaitingPayment():
return awaitingPayment(_that.order);case _RedirectToPayment():
return redirectToPayment(_that.initPointUrl,_that.order);case _ConfirmingPayment():
return confirmingPayment();case _Completed():
return completed(_that.order);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  processing,TResult? Function( Order order)?  awaitingPayment,TResult? Function( String initPointUrl,  Order order)?  redirectToPayment,TResult? Function()?  confirmingPayment,TResult? Function( Order order)?  completed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Processing() when processing != null:
return processing();case _AwaitingPayment() when awaitingPayment != null:
return awaitingPayment(_that.order);case _RedirectToPayment() when redirectToPayment != null:
return redirectToPayment(_that.initPointUrl,_that.order);case _ConfirmingPayment() when confirmingPayment != null:
return confirmingPayment();case _Completed() when completed != null:
return completed(_that.order);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends OrderState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.initial()';
}


}




/// @nodoc


class _Processing extends OrderState {
  const _Processing(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.processing()';
}


}




/// @nodoc


class _AwaitingPayment extends OrderState {
  const _AwaitingPayment(this.order): super._();
  

 final  Order order;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AwaitingPaymentCopyWith<_AwaitingPayment> get copyWith => __$AwaitingPaymentCopyWithImpl<_AwaitingPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AwaitingPayment&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'OrderState.awaitingPayment(order: $order)';
}


}

/// @nodoc
abstract mixin class _$AwaitingPaymentCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$AwaitingPaymentCopyWith(_AwaitingPayment value, $Res Function(_AwaitingPayment) _then) = __$AwaitingPaymentCopyWithImpl;
@useResult
$Res call({
 Order order
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$AwaitingPaymentCopyWithImpl<$Res>
    implements _$AwaitingPaymentCopyWith<$Res> {
  __$AwaitingPaymentCopyWithImpl(this._self, this._then);

  final _AwaitingPayment _self;
  final $Res Function(_AwaitingPayment) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(_AwaitingPayment(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class _RedirectToPayment extends OrderState {
  const _RedirectToPayment(this.initPointUrl, this.order): super._();
  

 final  String initPointUrl;
 final  Order order;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RedirectToPaymentCopyWith<_RedirectToPayment> get copyWith => __$RedirectToPaymentCopyWithImpl<_RedirectToPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RedirectToPayment&&(identical(other.initPointUrl, initPointUrl) || other.initPointUrl == initPointUrl)&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,initPointUrl,order);

@override
String toString() {
  return 'OrderState.redirectToPayment(initPointUrl: $initPointUrl, order: $order)';
}


}

/// @nodoc
abstract mixin class _$RedirectToPaymentCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$RedirectToPaymentCopyWith(_RedirectToPayment value, $Res Function(_RedirectToPayment) _then) = __$RedirectToPaymentCopyWithImpl;
@useResult
$Res call({
 String initPointUrl, Order order
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$RedirectToPaymentCopyWithImpl<$Res>
    implements _$RedirectToPaymentCopyWith<$Res> {
  __$RedirectToPaymentCopyWithImpl(this._self, this._then);

  final _RedirectToPayment _self;
  final $Res Function(_RedirectToPayment) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initPointUrl = null,Object? order = null,}) {
  return _then(_RedirectToPayment(
null == initPointUrl ? _self.initPointUrl : initPointUrl // ignore: cast_nullable_to_non_nullable
as String,null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class _ConfirmingPayment extends OrderState {
  const _ConfirmingPayment(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmingPayment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderState.confirmingPayment()';
}


}




/// @nodoc


class _Completed extends OrderState {
  const _Completed(this.order): super._();
  

 final  Order order;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedCopyWith<_Completed> get copyWith => __$CompletedCopyWithImpl<_Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'OrderState.completed(order: $order)';
}


}

/// @nodoc
abstract mixin class _$CompletedCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$CompletedCopyWith(_Completed value, $Res Function(_Completed) _then) = __$CompletedCopyWithImpl;
@useResult
$Res call({
 Order order
});


$OrderCopyWith<$Res> get order;

}
/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(this._self, this._then);

  final _Completed _self;
  final $Res Function(_Completed) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(_Completed(
null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res> get order {
  
  return $OrderCopyWith<$Res>(_self.order, (value) {
    return _then(_self.copyWith(order: value));
  });
}
}

/// @nodoc


class _Error extends OrderState {
  const _Error(this.message): super._();
  

 final  String message;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
