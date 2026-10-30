// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_payment_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardPaymentResult {

 CardPaymentStatus get status; String get orderId; String? get message;
/// Create a copy of CardPaymentResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardPaymentResultCopyWith<CardPaymentResult> get copyWith => _$CardPaymentResultCopyWithImpl<CardPaymentResult>(this as CardPaymentResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardPaymentResult&&(identical(other.status, status) || other.status == status)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,orderId,message);

@override
String toString() {
  return 'CardPaymentResult(status: $status, orderId: $orderId, message: $message)';
}


}

/// @nodoc
abstract mixin class $CardPaymentResultCopyWith<$Res>  {
  factory $CardPaymentResultCopyWith(CardPaymentResult value, $Res Function(CardPaymentResult) _then) = _$CardPaymentResultCopyWithImpl;
@useResult
$Res call({
 CardPaymentStatus status, String orderId, String? message
});




}
/// @nodoc
class _$CardPaymentResultCopyWithImpl<$Res>
    implements $CardPaymentResultCopyWith<$Res> {
  _$CardPaymentResultCopyWithImpl(this._self, this._then);

  final CardPaymentResult _self;
  final $Res Function(CardPaymentResult) _then;

/// Create a copy of CardPaymentResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? orderId = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CardPaymentStatus,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardPaymentResult].
extension CardPaymentResultPatterns on CardPaymentResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardPaymentResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardPaymentResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardPaymentResult value)  $default,){
final _that = this;
switch (_that) {
case _CardPaymentResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardPaymentResult value)?  $default,){
final _that = this;
switch (_that) {
case _CardPaymentResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CardPaymentStatus status,  String orderId,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardPaymentResult() when $default != null:
return $default(_that.status,_that.orderId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CardPaymentStatus status,  String orderId,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CardPaymentResult():
return $default(_that.status,_that.orderId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CardPaymentStatus status,  String orderId,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CardPaymentResult() when $default != null:
return $default(_that.status,_that.orderId,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _CardPaymentResult implements CardPaymentResult {
  const _CardPaymentResult({required this.status, required this.orderId, this.message});
  

@override final  CardPaymentStatus status;
@override final  String orderId;
@override final  String? message;

/// Create a copy of CardPaymentResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardPaymentResultCopyWith<_CardPaymentResult> get copyWith => __$CardPaymentResultCopyWithImpl<_CardPaymentResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardPaymentResult&&(identical(other.status, status) || other.status == status)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,orderId,message);

@override
String toString() {
  return 'CardPaymentResult(status: $status, orderId: $orderId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CardPaymentResultCopyWith<$Res> implements $CardPaymentResultCopyWith<$Res> {
  factory _$CardPaymentResultCopyWith(_CardPaymentResult value, $Res Function(_CardPaymentResult) _then) = __$CardPaymentResultCopyWithImpl;
@override @useResult
$Res call({
 CardPaymentStatus status, String orderId, String? message
});




}
/// @nodoc
class __$CardPaymentResultCopyWithImpl<$Res>
    implements _$CardPaymentResultCopyWith<$Res> {
  __$CardPaymentResultCopyWithImpl(this._self, this._then);

  final _CardPaymentResult _self;
  final $Res Function(_CardPaymentResult) _then;

/// Create a copy of CardPaymentResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? orderId = null,Object? message = freezed,}) {
  return _then(_CardPaymentResult(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CardPaymentStatus,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
