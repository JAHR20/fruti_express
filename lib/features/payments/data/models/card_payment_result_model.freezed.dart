// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_payment_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardPaymentResultModel {

 String get result;@JsonKey(name: 'order_id') String get orderId; String? get message;
/// Create a copy of CardPaymentResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardPaymentResultModelCopyWith<CardPaymentResultModel> get copyWith => _$CardPaymentResultModelCopyWithImpl<CardPaymentResultModel>(this as CardPaymentResultModel, _$identity);

  /// Serializes this CardPaymentResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardPaymentResultModel&&(identical(other.result, result) || other.result == result)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,orderId,message);

@override
String toString() {
  return 'CardPaymentResultModel(result: $result, orderId: $orderId, message: $message)';
}


}

/// @nodoc
abstract mixin class $CardPaymentResultModelCopyWith<$Res>  {
  factory $CardPaymentResultModelCopyWith(CardPaymentResultModel value, $Res Function(CardPaymentResultModel) _then) = _$CardPaymentResultModelCopyWithImpl;
@useResult
$Res call({
 String result,@JsonKey(name: 'order_id') String orderId, String? message
});




}
/// @nodoc
class _$CardPaymentResultModelCopyWithImpl<$Res>
    implements $CardPaymentResultModelCopyWith<$Res> {
  _$CardPaymentResultModelCopyWithImpl(this._self, this._then);

  final CardPaymentResultModel _self;
  final $Res Function(CardPaymentResultModel) _then;

/// Create a copy of CardPaymentResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? orderId = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardPaymentResultModel].
extension CardPaymentResultModelPatterns on CardPaymentResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardPaymentResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardPaymentResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardPaymentResultModel value)  $default,){
final _that = this;
switch (_that) {
case _CardPaymentResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardPaymentResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardPaymentResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String result, @JsonKey(name: 'order_id')  String orderId,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardPaymentResultModel() when $default != null:
return $default(_that.result,_that.orderId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String result, @JsonKey(name: 'order_id')  String orderId,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CardPaymentResultModel():
return $default(_that.result,_that.orderId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String result, @JsonKey(name: 'order_id')  String orderId,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CardPaymentResultModel() when $default != null:
return $default(_that.result,_that.orderId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardPaymentResultModel extends CardPaymentResultModel {
  const _CardPaymentResultModel({required this.result, @JsonKey(name: 'order_id') required this.orderId, this.message}): super._();
  factory _CardPaymentResultModel.fromJson(Map<String, dynamic> json) => _$CardPaymentResultModelFromJson(json);

@override final  String result;
@override@JsonKey(name: 'order_id') final  String orderId;
@override final  String? message;

/// Create a copy of CardPaymentResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardPaymentResultModelCopyWith<_CardPaymentResultModel> get copyWith => __$CardPaymentResultModelCopyWithImpl<_CardPaymentResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardPaymentResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardPaymentResultModel&&(identical(other.result, result) || other.result == result)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,orderId,message);

@override
String toString() {
  return 'CardPaymentResultModel(result: $result, orderId: $orderId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CardPaymentResultModelCopyWith<$Res> implements $CardPaymentResultModelCopyWith<$Res> {
  factory _$CardPaymentResultModelCopyWith(_CardPaymentResultModel value, $Res Function(_CardPaymentResultModel) _then) = __$CardPaymentResultModelCopyWithImpl;
@override @useResult
$Res call({
 String result,@JsonKey(name: 'order_id') String orderId, String? message
});




}
/// @nodoc
class __$CardPaymentResultModelCopyWithImpl<$Res>
    implements _$CardPaymentResultModelCopyWith<$Res> {
  __$CardPaymentResultModelCopyWithImpl(this._self, this._then);

  final _CardPaymentResultModel _self;
  final $Res Function(_CardPaymentResultModel) _then;

/// Create a copy of CardPaymentResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? orderId = null,Object? message = freezed,}) {
  return _then(_CardPaymentResultModel(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
