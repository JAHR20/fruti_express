// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShippingRate {

 String get id; String get branchId; String get name; double get minDistanceKm; double get maxDistanceKm; int get cost; bool get isActive; DateTime get createdAt;
/// Create a copy of ShippingRate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingRateCopyWith<ShippingRate> get copyWith => _$ShippingRateCopyWithImpl<ShippingRate>(this as ShippingRate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingRate&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minDistanceKm, minDistanceKm) || other.minDistanceKm == minDistanceKm)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,branchId,name,minDistanceKm,maxDistanceKm,cost,isActive,createdAt);

@override
String toString() {
  return 'ShippingRate(id: $id, branchId: $branchId, name: $name, minDistanceKm: $minDistanceKm, maxDistanceKm: $maxDistanceKm, cost: $cost, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShippingRateCopyWith<$Res>  {
  factory $ShippingRateCopyWith(ShippingRate value, $Res Function(ShippingRate) _then) = _$ShippingRateCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String name, double minDistanceKm, double maxDistanceKm, int cost, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$ShippingRateCopyWithImpl<$Res>
    implements $ShippingRateCopyWith<$Res> {
  _$ShippingRateCopyWithImpl(this._self, this._then);

  final ShippingRate _self;
  final $Res Function(ShippingRate) _then;

/// Create a copy of ShippingRate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? name = null,Object? minDistanceKm = null,Object? maxDistanceKm = null,Object? cost = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minDistanceKm: null == minDistanceKm ? _self.minDistanceKm : minDistanceKm // ignore: cast_nullable_to_non_nullable
as double,maxDistanceKm: null == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingRate].
extension ShippingRatePatterns on ShippingRate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingRate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingRate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingRate value)  $default,){
final _that = this;
switch (_that) {
case _ShippingRate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingRate value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingRate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String name,  double minDistanceKm,  double maxDistanceKm,  int cost,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingRate() when $default != null:
return $default(_that.id,_that.branchId,_that.name,_that.minDistanceKm,_that.maxDistanceKm,_that.cost,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String name,  double minDistanceKm,  double maxDistanceKm,  int cost,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShippingRate():
return $default(_that.id,_that.branchId,_that.name,_that.minDistanceKm,_that.maxDistanceKm,_that.cost,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String name,  double minDistanceKm,  double maxDistanceKm,  int cost,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShippingRate() when $default != null:
return $default(_that.id,_that.branchId,_that.name,_that.minDistanceKm,_that.maxDistanceKm,_that.cost,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShippingRate implements ShippingRate {
  const _ShippingRate({required this.id, required this.branchId, required this.name, required this.minDistanceKm, required this.maxDistanceKm, required this.cost, required this.isActive, required this.createdAt});
  

@override final  String id;
@override final  String branchId;
@override final  String name;
@override final  double minDistanceKm;
@override final  double maxDistanceKm;
@override final  int cost;
@override final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of ShippingRate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingRateCopyWith<_ShippingRate> get copyWith => __$ShippingRateCopyWithImpl<_ShippingRate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingRate&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minDistanceKm, minDistanceKm) || other.minDistanceKm == minDistanceKm)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,branchId,name,minDistanceKm,maxDistanceKm,cost,isActive,createdAt);

@override
String toString() {
  return 'ShippingRate(id: $id, branchId: $branchId, name: $name, minDistanceKm: $minDistanceKm, maxDistanceKm: $maxDistanceKm, cost: $cost, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShippingRateCopyWith<$Res> implements $ShippingRateCopyWith<$Res> {
  factory _$ShippingRateCopyWith(_ShippingRate value, $Res Function(_ShippingRate) _then) = __$ShippingRateCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String name, double minDistanceKm, double maxDistanceKm, int cost, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$ShippingRateCopyWithImpl<$Res>
    implements _$ShippingRateCopyWith<$Res> {
  __$ShippingRateCopyWithImpl(this._self, this._then);

  final _ShippingRate _self;
  final $Res Function(_ShippingRate) _then;

/// Create a copy of ShippingRate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? name = null,Object? minDistanceKm = null,Object? maxDistanceKm = null,Object? cost = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ShippingRate(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,minDistanceKm: null == minDistanceKm ? _self.minDistanceKm : minDistanceKm // ignore: cast_nullable_to_non_nullable
as double,maxDistanceKm: null == maxDistanceKm ? _self.maxDistanceKm : maxDistanceKm // ignore: cast_nullable_to_non_nullable
as double,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
