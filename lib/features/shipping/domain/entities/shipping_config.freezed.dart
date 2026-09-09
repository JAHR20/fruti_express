// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShippingConfig {

 String get id; String get branchId; ShippingStrategy get strategy; double get maxRadiusKm; List<String> get allowedZipCodes; bool get requireZipCodeValidation; int? get minAmountForFreeShipping; bool get isActive; DateTime get createdAt;
/// Create a copy of ShippingConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingConfigCopyWith<ShippingConfig> get copyWith => _$ShippingConfigCopyWithImpl<ShippingConfig>(this as ShippingConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.maxRadiusKm, maxRadiusKm) || other.maxRadiusKm == maxRadiusKm)&&const DeepCollectionEquality().equals(other.allowedZipCodes, allowedZipCodes)&&(identical(other.requireZipCodeValidation, requireZipCodeValidation) || other.requireZipCodeValidation == requireZipCodeValidation)&&(identical(other.minAmountForFreeShipping, minAmountForFreeShipping) || other.minAmountForFreeShipping == minAmountForFreeShipping)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,branchId,strategy,maxRadiusKm,const DeepCollectionEquality().hash(allowedZipCodes),requireZipCodeValidation,minAmountForFreeShipping,isActive,createdAt);

@override
String toString() {
  return 'ShippingConfig(id: $id, branchId: $branchId, strategy: $strategy, maxRadiusKm: $maxRadiusKm, allowedZipCodes: $allowedZipCodes, requireZipCodeValidation: $requireZipCodeValidation, minAmountForFreeShipping: $minAmountForFreeShipping, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShippingConfigCopyWith<$Res>  {
  factory $ShippingConfigCopyWith(ShippingConfig value, $Res Function(ShippingConfig) _then) = _$ShippingConfigCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, ShippingStrategy strategy, double maxRadiusKm, List<String> allowedZipCodes, bool requireZipCodeValidation, int? minAmountForFreeShipping, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$ShippingConfigCopyWithImpl<$Res>
    implements $ShippingConfigCopyWith<$Res> {
  _$ShippingConfigCopyWithImpl(this._self, this._then);

  final ShippingConfig _self;
  final $Res Function(ShippingConfig) _then;

/// Create a copy of ShippingConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? strategy = null,Object? maxRadiusKm = null,Object? allowedZipCodes = null,Object? requireZipCodeValidation = null,Object? minAmountForFreeShipping = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as ShippingStrategy,maxRadiusKm: null == maxRadiusKm ? _self.maxRadiusKm : maxRadiusKm // ignore: cast_nullable_to_non_nullable
as double,allowedZipCodes: null == allowedZipCodes ? _self.allowedZipCodes : allowedZipCodes // ignore: cast_nullable_to_non_nullable
as List<String>,requireZipCodeValidation: null == requireZipCodeValidation ? _self.requireZipCodeValidation : requireZipCodeValidation // ignore: cast_nullable_to_non_nullable
as bool,minAmountForFreeShipping: freezed == minAmountForFreeShipping ? _self.minAmountForFreeShipping : minAmountForFreeShipping // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingConfig].
extension ShippingConfigPatterns on ShippingConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingConfig value)  $default,){
final _that = this;
switch (_that) {
case _ShippingConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingConfig value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  ShippingStrategy strategy,  double maxRadiusKm,  List<String> allowedZipCodes,  bool requireZipCodeValidation,  int? minAmountForFreeShipping,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingConfig() when $default != null:
return $default(_that.id,_that.branchId,_that.strategy,_that.maxRadiusKm,_that.allowedZipCodes,_that.requireZipCodeValidation,_that.minAmountForFreeShipping,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  ShippingStrategy strategy,  double maxRadiusKm,  List<String> allowedZipCodes,  bool requireZipCodeValidation,  int? minAmountForFreeShipping,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShippingConfig():
return $default(_that.id,_that.branchId,_that.strategy,_that.maxRadiusKm,_that.allowedZipCodes,_that.requireZipCodeValidation,_that.minAmountForFreeShipping,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  ShippingStrategy strategy,  double maxRadiusKm,  List<String> allowedZipCodes,  bool requireZipCodeValidation,  int? minAmountForFreeShipping,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShippingConfig() when $default != null:
return $default(_that.id,_that.branchId,_that.strategy,_that.maxRadiusKm,_that.allowedZipCodes,_that.requireZipCodeValidation,_that.minAmountForFreeShipping,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ShippingConfig implements ShippingConfig {
  const _ShippingConfig({required this.id, required this.branchId, required this.strategy, required this.maxRadiusKm, final  List<String> allowedZipCodes = const [], this.requireZipCodeValidation = false, this.minAmountForFreeShipping, this.isActive = true, required this.createdAt}): _allowedZipCodes = allowedZipCodes;
  

@override final  String id;
@override final  String branchId;
@override final  ShippingStrategy strategy;
@override final  double maxRadiusKm;
 final  List<String> _allowedZipCodes;
@override@JsonKey() List<String> get allowedZipCodes {
  if (_allowedZipCodes is EqualUnmodifiableListView) return _allowedZipCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedZipCodes);
}

@override@JsonKey() final  bool requireZipCodeValidation;
@override final  int? minAmountForFreeShipping;
@override@JsonKey() final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of ShippingConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingConfigCopyWith<_ShippingConfig> get copyWith => __$ShippingConfigCopyWithImpl<_ShippingConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.maxRadiusKm, maxRadiusKm) || other.maxRadiusKm == maxRadiusKm)&&const DeepCollectionEquality().equals(other._allowedZipCodes, _allowedZipCodes)&&(identical(other.requireZipCodeValidation, requireZipCodeValidation) || other.requireZipCodeValidation == requireZipCodeValidation)&&(identical(other.minAmountForFreeShipping, minAmountForFreeShipping) || other.minAmountForFreeShipping == minAmountForFreeShipping)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,branchId,strategy,maxRadiusKm,const DeepCollectionEquality().hash(_allowedZipCodes),requireZipCodeValidation,minAmountForFreeShipping,isActive,createdAt);

@override
String toString() {
  return 'ShippingConfig(id: $id, branchId: $branchId, strategy: $strategy, maxRadiusKm: $maxRadiusKm, allowedZipCodes: $allowedZipCodes, requireZipCodeValidation: $requireZipCodeValidation, minAmountForFreeShipping: $minAmountForFreeShipping, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShippingConfigCopyWith<$Res> implements $ShippingConfigCopyWith<$Res> {
  factory _$ShippingConfigCopyWith(_ShippingConfig value, $Res Function(_ShippingConfig) _then) = __$ShippingConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, ShippingStrategy strategy, double maxRadiusKm, List<String> allowedZipCodes, bool requireZipCodeValidation, int? minAmountForFreeShipping, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$ShippingConfigCopyWithImpl<$Res>
    implements _$ShippingConfigCopyWith<$Res> {
  __$ShippingConfigCopyWithImpl(this._self, this._then);

  final _ShippingConfig _self;
  final $Res Function(_ShippingConfig) _then;

/// Create a copy of ShippingConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? strategy = null,Object? maxRadiusKm = null,Object? allowedZipCodes = null,Object? requireZipCodeValidation = null,Object? minAmountForFreeShipping = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ShippingConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as ShippingStrategy,maxRadiusKm: null == maxRadiusKm ? _self.maxRadiusKm : maxRadiusKm // ignore: cast_nullable_to_non_nullable
as double,allowedZipCodes: null == allowedZipCodes ? _self._allowedZipCodes : allowedZipCodes // ignore: cast_nullable_to_non_nullable
as List<String>,requireZipCodeValidation: null == requireZipCodeValidation ? _self.requireZipCodeValidation : requireZipCodeValidation // ignore: cast_nullable_to_non_nullable
as bool,minAmountForFreeShipping: freezed == minAmountForFreeShipping ? _self.minAmountForFreeShipping : minAmountForFreeShipping // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
