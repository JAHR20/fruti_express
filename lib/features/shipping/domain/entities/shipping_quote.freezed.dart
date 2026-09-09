// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShippingQuote {

 String get branchId; bool get isAvailable; double get distanceKm; int get shippingCost; UnavailableReason? get reason;
/// Create a copy of ShippingQuote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingQuoteCopyWith<ShippingQuote> get copyWith => _$ShippingQuoteCopyWithImpl<ShippingQuote>(this as ShippingQuote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingQuote&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,isAvailable,distanceKm,shippingCost,reason);

@override
String toString() {
  return 'ShippingQuote(branchId: $branchId, isAvailable: $isAvailable, distanceKm: $distanceKm, shippingCost: $shippingCost, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $ShippingQuoteCopyWith<$Res>  {
  factory $ShippingQuoteCopyWith(ShippingQuote value, $Res Function(ShippingQuote) _then) = _$ShippingQuoteCopyWithImpl;
@useResult
$Res call({
 String branchId, bool isAvailable, double distanceKm, int shippingCost, UnavailableReason? reason
});




}
/// @nodoc
class _$ShippingQuoteCopyWithImpl<$Res>
    implements $ShippingQuoteCopyWith<$Res> {
  _$ShippingQuoteCopyWithImpl(this._self, this._then);

  final ShippingQuote _self;
  final $Res Function(ShippingQuote) _then;

/// Create a copy of ShippingQuote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? isAvailable = null,Object? distanceKm = null,Object? shippingCost = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as UnavailableReason?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingQuote].
extension ShippingQuotePatterns on ShippingQuote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingQuote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingQuote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingQuote value)  $default,){
final _that = this;
switch (_that) {
case _ShippingQuote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingQuote value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingQuote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String branchId,  bool isAvailable,  double distanceKm,  int shippingCost,  UnavailableReason? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingQuote() when $default != null:
return $default(_that.branchId,_that.isAvailable,_that.distanceKm,_that.shippingCost,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String branchId,  bool isAvailable,  double distanceKm,  int shippingCost,  UnavailableReason? reason)  $default,) {final _that = this;
switch (_that) {
case _ShippingQuote():
return $default(_that.branchId,_that.isAvailable,_that.distanceKm,_that.shippingCost,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String branchId,  bool isAvailable,  double distanceKm,  int shippingCost,  UnavailableReason? reason)?  $default,) {final _that = this;
switch (_that) {
case _ShippingQuote() when $default != null:
return $default(_that.branchId,_that.isAvailable,_that.distanceKm,_that.shippingCost,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _ShippingQuote implements ShippingQuote {
  const _ShippingQuote({required this.branchId, required this.isAvailable, required this.distanceKm, required this.shippingCost, this.reason});
  

@override final  String branchId;
@override final  bool isAvailable;
@override final  double distanceKm;
@override final  int shippingCost;
@override final  UnavailableReason? reason;

/// Create a copy of ShippingQuote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingQuoteCopyWith<_ShippingQuote> get copyWith => __$ShippingQuoteCopyWithImpl<_ShippingQuote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingQuote&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,isAvailable,distanceKm,shippingCost,reason);

@override
String toString() {
  return 'ShippingQuote(branchId: $branchId, isAvailable: $isAvailable, distanceKm: $distanceKm, shippingCost: $shippingCost, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ShippingQuoteCopyWith<$Res> implements $ShippingQuoteCopyWith<$Res> {
  factory _$ShippingQuoteCopyWith(_ShippingQuote value, $Res Function(_ShippingQuote) _then) = __$ShippingQuoteCopyWithImpl;
@override @useResult
$Res call({
 String branchId, bool isAvailable, double distanceKm, int shippingCost, UnavailableReason? reason
});




}
/// @nodoc
class __$ShippingQuoteCopyWithImpl<$Res>
    implements _$ShippingQuoteCopyWith<$Res> {
  __$ShippingQuoteCopyWithImpl(this._self, this._then);

  final _ShippingQuote _self;
  final $Res Function(_ShippingQuote) _then;

/// Create a copy of ShippingQuote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? isAvailable = null,Object? distanceKm = null,Object? shippingCost = null,Object? reason = freezed,}) {
  return _then(_ShippingQuote(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as UnavailableReason?,
  ));
}


}

// dart format on
