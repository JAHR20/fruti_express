// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_rate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingRateModel {

 String get id;@JsonKey(name: 'branch_id') String get branchId; String get name;@JsonKey(name: 'min_distance_km') double get minDistanceKm;@JsonKey(name: 'max_distance_km') double get maxDistanceKm; int get cost;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ShippingRateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingRateModelCopyWith<ShippingRateModel> get copyWith => _$ShippingRateModelCopyWithImpl<ShippingRateModel>(this as ShippingRateModel, _$identity);

  /// Serializes this ShippingRateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingRateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minDistanceKm, minDistanceKm) || other.minDistanceKm == minDistanceKm)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,branchId,name,minDistanceKm,maxDistanceKm,cost,isActive,createdAt);

@override
String toString() {
  return 'ShippingRateModel(id: $id, branchId: $branchId, name: $name, minDistanceKm: $minDistanceKm, maxDistanceKm: $maxDistanceKm, cost: $cost, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShippingRateModelCopyWith<$Res>  {
  factory $ShippingRateModelCopyWith(ShippingRateModel value, $Res Function(ShippingRateModel) _then) = _$ShippingRateModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'branch_id') String branchId, String name,@JsonKey(name: 'min_distance_km') double minDistanceKm,@JsonKey(name: 'max_distance_km') double maxDistanceKm, int cost,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ShippingRateModelCopyWithImpl<$Res>
    implements $ShippingRateModelCopyWith<$Res> {
  _$ShippingRateModelCopyWithImpl(this._self, this._then);

  final ShippingRateModel _self;
  final $Res Function(ShippingRateModel) _then;

/// Create a copy of ShippingRateModel
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


/// Adds pattern-matching-related methods to [ShippingRateModel].
extension ShippingRateModelPatterns on ShippingRateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingRateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingRateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingRateModel value)  $default,){
final _that = this;
switch (_that) {
case _ShippingRateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingRateModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingRateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'branch_id')  String branchId,  String name, @JsonKey(name: 'min_distance_km')  double minDistanceKm, @JsonKey(name: 'max_distance_km')  double maxDistanceKm,  int cost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingRateModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'branch_id')  String branchId,  String name, @JsonKey(name: 'min_distance_km')  double minDistanceKm, @JsonKey(name: 'max_distance_km')  double maxDistanceKm,  int cost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShippingRateModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'branch_id')  String branchId,  String name, @JsonKey(name: 'min_distance_km')  double minDistanceKm, @JsonKey(name: 'max_distance_km')  double maxDistanceKm,  int cost, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShippingRateModel() when $default != null:
return $default(_that.id,_that.branchId,_that.name,_that.minDistanceKm,_that.maxDistanceKm,_that.cost,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingRateModel extends ShippingRateModel {
  const _ShippingRateModel({required this.id, @JsonKey(name: 'branch_id') required this.branchId, required this.name, @JsonKey(name: 'min_distance_km') required this.minDistanceKm, @JsonKey(name: 'max_distance_km') required this.maxDistanceKm, required this.cost, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _ShippingRateModel.fromJson(Map<String, dynamic> json) => _$ShippingRateModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'branch_id') final  String branchId;
@override final  String name;
@override@JsonKey(name: 'min_distance_km') final  double minDistanceKm;
@override@JsonKey(name: 'max_distance_km') final  double maxDistanceKm;
@override final  int cost;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ShippingRateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingRateModelCopyWith<_ShippingRateModel> get copyWith => __$ShippingRateModelCopyWithImpl<_ShippingRateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingRateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingRateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.minDistanceKm, minDistanceKm) || other.minDistanceKm == minDistanceKm)&&(identical(other.maxDistanceKm, maxDistanceKm) || other.maxDistanceKm == maxDistanceKm)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,branchId,name,minDistanceKm,maxDistanceKm,cost,isActive,createdAt);

@override
String toString() {
  return 'ShippingRateModel(id: $id, branchId: $branchId, name: $name, minDistanceKm: $minDistanceKm, maxDistanceKm: $maxDistanceKm, cost: $cost, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShippingRateModelCopyWith<$Res> implements $ShippingRateModelCopyWith<$Res> {
  factory _$ShippingRateModelCopyWith(_ShippingRateModel value, $Res Function(_ShippingRateModel) _then) = __$ShippingRateModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'branch_id') String branchId, String name,@JsonKey(name: 'min_distance_km') double minDistanceKm,@JsonKey(name: 'max_distance_km') double maxDistanceKm, int cost,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ShippingRateModelCopyWithImpl<$Res>
    implements _$ShippingRateModelCopyWith<$Res> {
  __$ShippingRateModelCopyWithImpl(this._self, this._then);

  final _ShippingRateModel _self;
  final $Res Function(_ShippingRateModel) _then;

/// Create a copy of ShippingRateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? name = null,Object? minDistanceKm = null,Object? maxDistanceKm = null,Object? cost = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ShippingRateModel(
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
