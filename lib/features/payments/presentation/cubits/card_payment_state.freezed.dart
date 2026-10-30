// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CardPaymentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardPaymentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CardPaymentState()';
}


}

/// @nodoc
class $CardPaymentStateCopyWith<$Res>  {
$CardPaymentStateCopyWith(CardPaymentState _, $Res Function(CardPaymentState) __);
}


/// Adds pattern-matching-related methods to [CardPaymentState].
extension CardPaymentStatePatterns on CardPaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Processing value)?  processing,TResult Function( _Approved value)?  approved,TResult Function( _Pending value)?  pending,TResult Function( _Rejected value)?  rejected,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Processing() when processing != null:
return processing(_that);case _Approved() when approved != null:
return approved(_that);case _Pending() when pending != null:
return pending(_that);case _Rejected() when rejected != null:
return rejected(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Processing value)  processing,required TResult Function( _Approved value)  approved,required TResult Function( _Pending value)  pending,required TResult Function( _Rejected value)  rejected,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Processing():
return processing(_that);case _Approved():
return approved(_that);case _Pending():
return pending(_that);case _Rejected():
return rejected(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Processing value)?  processing,TResult? Function( _Approved value)?  approved,TResult? Function( _Pending value)?  pending,TResult? Function( _Rejected value)?  rejected,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Processing() when processing != null:
return processing(_that);case _Approved() when approved != null:
return approved(_that);case _Pending() when pending != null:
return pending(_that);case _Rejected() when rejected != null:
return rejected(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  processing,TResult Function( String orderId)?  approved,TResult Function( String orderId)?  pending,TResult Function( String message)?  rejected,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Processing() when processing != null:
return processing();case _Approved() when approved != null:
return approved(_that.orderId);case _Pending() when pending != null:
return pending(_that.orderId);case _Rejected() when rejected != null:
return rejected(_that.message);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  processing,required TResult Function( String orderId)  approved,required TResult Function( String orderId)  pending,required TResult Function( String message)  rejected,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Processing():
return processing();case _Approved():
return approved(_that.orderId);case _Pending():
return pending(_that.orderId);case _Rejected():
return rejected(_that.message);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  processing,TResult? Function( String orderId)?  approved,TResult? Function( String orderId)?  pending,TResult? Function( String message)?  rejected,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Processing() when processing != null:
return processing();case _Approved() when approved != null:
return approved(_that.orderId);case _Pending() when pending != null:
return pending(_that.orderId);case _Rejected() when rejected != null:
return rejected(_that.message);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CardPaymentState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CardPaymentState.initial()';
}


}




/// @nodoc


class _Processing implements CardPaymentState {
  const _Processing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CardPaymentState.processing()';
}


}




/// @nodoc


class _Approved implements CardPaymentState {
  const _Approved(this.orderId);
  

 final  String orderId;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApprovedCopyWith<_Approved> get copyWith => __$ApprovedCopyWithImpl<_Approved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Approved&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'CardPaymentState.approved(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$ApprovedCopyWith<$Res> implements $CardPaymentStateCopyWith<$Res> {
  factory _$ApprovedCopyWith(_Approved value, $Res Function(_Approved) _then) = __$ApprovedCopyWithImpl;
@useResult
$Res call({
 String orderId
});




}
/// @nodoc
class __$ApprovedCopyWithImpl<$Res>
    implements _$ApprovedCopyWith<$Res> {
  __$ApprovedCopyWithImpl(this._self, this._then);

  final _Approved _self;
  final $Res Function(_Approved) _then;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_Approved(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Pending implements CardPaymentState {
  const _Pending(this.orderId);
  

 final  String orderId;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingCopyWith<_Pending> get copyWith => __$PendingCopyWithImpl<_Pending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pending&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,orderId);

@override
String toString() {
  return 'CardPaymentState.pending(orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$PendingCopyWith<$Res> implements $CardPaymentStateCopyWith<$Res> {
  factory _$PendingCopyWith(_Pending value, $Res Function(_Pending) _then) = __$PendingCopyWithImpl;
@useResult
$Res call({
 String orderId
});




}
/// @nodoc
class __$PendingCopyWithImpl<$Res>
    implements _$PendingCopyWith<$Res> {
  __$PendingCopyWithImpl(this._self, this._then);

  final _Pending _self;
  final $Res Function(_Pending) _then;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,}) {
  return _then(_Pending(
null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Rejected implements CardPaymentState {
  const _Rejected(this.message);
  

 final  String message;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectedCopyWith<_Rejected> get copyWith => __$RejectedCopyWithImpl<_Rejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rejected&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CardPaymentState.rejected(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RejectedCopyWith<$Res> implements $CardPaymentStateCopyWith<$Res> {
  factory _$RejectedCopyWith(_Rejected value, $Res Function(_Rejected) _then) = __$RejectedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RejectedCopyWithImpl<$Res>
    implements _$RejectedCopyWith<$Res> {
  __$RejectedCopyWithImpl(this._self, this._then);

  final _Rejected _self;
  final $Res Function(_Rejected) _then;

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Rejected(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Error implements CardPaymentState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of CardPaymentState
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
  return 'CardPaymentState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CardPaymentStateCopyWith<$Res> {
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

/// Create a copy of CardPaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
