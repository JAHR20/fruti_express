// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'covering_branch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoveringBranchModel {

@JsonKey(name: 'branch_id') String get branchId;@JsonKey(name: 'distance_km') double get distanceKm;@JsonKey(name: 'shipping_cost') int get shippingCost;
/// Create a copy of CoveringBranchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoveringBranchModelCopyWith<CoveringBranchModel> get copyWith => _$CoveringBranchModelCopyWithImpl<CoveringBranchModel>(this as CoveringBranchModel, _$identity);

  /// Serializes this CoveringBranchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoveringBranchModel&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,distanceKm,shippingCost);

@override
String toString() {
  return 'CoveringBranchModel(branchId: $branchId, distanceKm: $distanceKm, shippingCost: $shippingCost)';
}


}

/// @nodoc
abstract mixin class $CoveringBranchModelCopyWith<$Res>  {
  factory $CoveringBranchModelCopyWith(CoveringBranchModel value, $Res Function(CoveringBranchModel) _then) = _$CoveringBranchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'branch_id') String branchId,@JsonKey(name: 'distance_km') double distanceKm,@JsonKey(name: 'shipping_cost') int shippingCost
});




}
/// @nodoc
class _$CoveringBranchModelCopyWithImpl<$Res>
    implements $CoveringBranchModelCopyWith<$Res> {
  _$CoveringBranchModelCopyWithImpl(this._self, this._then);

  final CoveringBranchModel _self;
  final $Res Function(CoveringBranchModel) _then;

/// Create a copy of CoveringBranchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branchId = null,Object? distanceKm = null,Object? shippingCost = null,}) {
  return _then(_self.copyWith(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CoveringBranchModel].
extension CoveringBranchModelPatterns on CoveringBranchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoveringBranchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoveringBranchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoveringBranchModel value)  $default,){
final _that = this;
switch (_that) {
case _CoveringBranchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoveringBranchModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoveringBranchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'distance_km')  double distanceKm, @JsonKey(name: 'shipping_cost')  int shippingCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoveringBranchModel() when $default != null:
return $default(_that.branchId,_that.distanceKm,_that.shippingCost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'distance_km')  double distanceKm, @JsonKey(name: 'shipping_cost')  int shippingCost)  $default,) {final _that = this;
switch (_that) {
case _CoveringBranchModel():
return $default(_that.branchId,_that.distanceKm,_that.shippingCost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'branch_id')  String branchId, @JsonKey(name: 'distance_km')  double distanceKm, @JsonKey(name: 'shipping_cost')  int shippingCost)?  $default,) {final _that = this;
switch (_that) {
case _CoveringBranchModel() when $default != null:
return $default(_that.branchId,_that.distanceKm,_that.shippingCost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoveringBranchModel extends CoveringBranchModel {
  const _CoveringBranchModel({@JsonKey(name: 'branch_id') required this.branchId, @JsonKey(name: 'distance_km') required this.distanceKm, @JsonKey(name: 'shipping_cost') required this.shippingCost}): super._();
  factory _CoveringBranchModel.fromJson(Map<String, dynamic> json) => _$CoveringBranchModelFromJson(json);

@override@JsonKey(name: 'branch_id') final  String branchId;
@override@JsonKey(name: 'distance_km') final  double distanceKm;
@override@JsonKey(name: 'shipping_cost') final  int shippingCost;

/// Create a copy of CoveringBranchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoveringBranchModelCopyWith<_CoveringBranchModel> get copyWith => __$CoveringBranchModelCopyWithImpl<_CoveringBranchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoveringBranchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoveringBranchModel&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,branchId,distanceKm,shippingCost);

@override
String toString() {
  return 'CoveringBranchModel(branchId: $branchId, distanceKm: $distanceKm, shippingCost: $shippingCost)';
}


}

/// @nodoc
abstract mixin class _$CoveringBranchModelCopyWith<$Res> implements $CoveringBranchModelCopyWith<$Res> {
  factory _$CoveringBranchModelCopyWith(_CoveringBranchModel value, $Res Function(_CoveringBranchModel) _then) = __$CoveringBranchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'branch_id') String branchId,@JsonKey(name: 'distance_km') double distanceKm,@JsonKey(name: 'shipping_cost') int shippingCost
});




}
/// @nodoc
class __$CoveringBranchModelCopyWithImpl<$Res>
    implements _$CoveringBranchModelCopyWith<$Res> {
  __$CoveringBranchModelCopyWithImpl(this._self, this._then);

  final _CoveringBranchModel _self;
  final $Res Function(_CoveringBranchModel) _then;

/// Create a copy of CoveringBranchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? distanceKm = null,Object? shippingCost = null,}) {
  return _then(_CoveringBranchModel(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
