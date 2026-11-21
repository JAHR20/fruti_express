// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'covering_branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoveringBranch {

 String get branchId; double get distanceKm; int get shippingCost;
/// Create a copy of CoveringBranch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoveringBranchCopyWith<CoveringBranch> get copyWith => _$CoveringBranchCopyWithImpl<CoveringBranch>(this as CoveringBranch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoveringBranch&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,distanceKm,shippingCost);

@override
String toString() {
  return 'CoveringBranch(branchId: $branchId, distanceKm: $distanceKm, shippingCost: $shippingCost)';
}


}

/// @nodoc
abstract mixin class $CoveringBranchCopyWith<$Res>  {
  factory $CoveringBranchCopyWith(CoveringBranch value, $Res Function(CoveringBranch) _then) = _$CoveringBranchCopyWithImpl;
@useResult
$Res call({
 String branchId, double distanceKm, int shippingCost
});




}
/// @nodoc
class _$CoveringBranchCopyWithImpl<$Res>
    implements $CoveringBranchCopyWith<$Res> {
  _$CoveringBranchCopyWithImpl(this._self, this._then);

  final CoveringBranch _self;
  final $Res Function(CoveringBranch) _then;

/// Create a copy of CoveringBranch
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


/// Adds pattern-matching-related methods to [CoveringBranch].
extension CoveringBranchPatterns on CoveringBranch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoveringBranch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoveringBranch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoveringBranch value)  $default,){
final _that = this;
switch (_that) {
case _CoveringBranch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoveringBranch value)?  $default,){
final _that = this;
switch (_that) {
case _CoveringBranch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String branchId,  double distanceKm,  int shippingCost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoveringBranch() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String branchId,  double distanceKm,  int shippingCost)  $default,) {final _that = this;
switch (_that) {
case _CoveringBranch():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String branchId,  double distanceKm,  int shippingCost)?  $default,) {final _that = this;
switch (_that) {
case _CoveringBranch() when $default != null:
return $default(_that.branchId,_that.distanceKm,_that.shippingCost);case _:
  return null;

}
}

}

/// @nodoc


class _CoveringBranch implements CoveringBranch {
  const _CoveringBranch({required this.branchId, required this.distanceKm, required this.shippingCost});
  

@override final  String branchId;
@override final  double distanceKm;
@override final  int shippingCost;

/// Create a copy of CoveringBranch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoveringBranchCopyWith<_CoveringBranch> get copyWith => __$CoveringBranchCopyWithImpl<_CoveringBranch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoveringBranch&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.shippingCost, shippingCost) || other.shippingCost == shippingCost));
}


@override
int get hashCode => Object.hash(runtimeType,branchId,distanceKm,shippingCost);

@override
String toString() {
  return 'CoveringBranch(branchId: $branchId, distanceKm: $distanceKm, shippingCost: $shippingCost)';
}


}

/// @nodoc
abstract mixin class _$CoveringBranchCopyWith<$Res> implements $CoveringBranchCopyWith<$Res> {
  factory _$CoveringBranchCopyWith(_CoveringBranch value, $Res Function(_CoveringBranch) _then) = __$CoveringBranchCopyWithImpl;
@override @useResult
$Res call({
 String branchId, double distanceKm, int shippingCost
});




}
/// @nodoc
class __$CoveringBranchCopyWithImpl<$Res>
    implements _$CoveringBranchCopyWith<$Res> {
  __$CoveringBranchCopyWithImpl(this._self, this._then);

  final _CoveringBranch _self;
  final $Res Function(_CoveringBranch) _then;

/// Create a copy of CoveringBranch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branchId = null,Object? distanceKm = null,Object? shippingCost = null,}) {
  return _then(_CoveringBranch(
branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,shippingCost: null == shippingCost ? _self.shippingCost : shippingCost // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
