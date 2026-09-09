// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShippingConfigModel {

 String get id;@JsonKey(name: 'branch_id') String get branchId; ShippingStrategy get strategy;@JsonKey(name: 'max_radius_km') double get maxRadiusKm;@JsonKey(includeToJson: false) List<String> get allowedZipCodes;@JsonKey(name: 'require_zip_code_validation') bool get requireZipCodeValidation;@JsonKey(name: 'min_amount_for_free_shipping') int? get minAmountForFreeShipping;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ShippingConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingConfigModelCopyWith<ShippingConfigModel> get copyWith => _$ShippingConfigModelCopyWithImpl<ShippingConfigModel>(this as ShippingConfigModel, _$identity);

  /// Serializes this ShippingConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingConfigModel&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.maxRadiusKm, maxRadiusKm) || other.maxRadiusKm == maxRadiusKm)&&const DeepCollectionEquality().equals(other.allowedZipCodes, allowedZipCodes)&&(identical(other.requireZipCodeValidation, requireZipCodeValidation) || other.requireZipCodeValidation == requireZipCodeValidation)&&(identical(other.minAmountForFreeShipping, minAmountForFreeShipping) || other.minAmountForFreeShipping == minAmountForFreeShipping)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,branchId,strategy,maxRadiusKm,const DeepCollectionEquality().hash(allowedZipCodes),requireZipCodeValidation,minAmountForFreeShipping,isActive,createdAt);

@override
String toString() {
  return 'ShippingConfigModel(id: $id, branchId: $branchId, strategy: $strategy, maxRadiusKm: $maxRadiusKm, allowedZipCodes: $allowedZipCodes, requireZipCodeValidation: $requireZipCodeValidation, minAmountForFreeShipping: $minAmountForFreeShipping, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ShippingConfigModelCopyWith<$Res>  {
  factory $ShippingConfigModelCopyWith(ShippingConfigModel value, $Res Function(ShippingConfigModel) _then) = _$ShippingConfigModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'branch_id') String branchId, ShippingStrategy strategy,@JsonKey(name: 'max_radius_km') double maxRadiusKm,@JsonKey(includeToJson: false) List<String> allowedZipCodes,@JsonKey(name: 'require_zip_code_validation') bool requireZipCodeValidation,@JsonKey(name: 'min_amount_for_free_shipping') int? minAmountForFreeShipping,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$ShippingConfigModelCopyWithImpl<$Res>
    implements $ShippingConfigModelCopyWith<$Res> {
  _$ShippingConfigModelCopyWithImpl(this._self, this._then);

  final ShippingConfigModel _self;
  final $Res Function(ShippingConfigModel) _then;

/// Create a copy of ShippingConfigModel
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


/// Adds pattern-matching-related methods to [ShippingConfigModel].
extension ShippingConfigModelPatterns on ShippingConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _ShippingConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'branch_id')  String branchId,  ShippingStrategy strategy, @JsonKey(name: 'max_radius_km')  double maxRadiusKm, @JsonKey(includeToJson: false)  List<String> allowedZipCodes, @JsonKey(name: 'require_zip_code_validation')  bool requireZipCodeValidation, @JsonKey(name: 'min_amount_for_free_shipping')  int? minAmountForFreeShipping, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingConfigModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'branch_id')  String branchId,  ShippingStrategy strategy, @JsonKey(name: 'max_radius_km')  double maxRadiusKm, @JsonKey(includeToJson: false)  List<String> allowedZipCodes, @JsonKey(name: 'require_zip_code_validation')  bool requireZipCodeValidation, @JsonKey(name: 'min_amount_for_free_shipping')  int? minAmountForFreeShipping, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ShippingConfigModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'branch_id')  String branchId,  ShippingStrategy strategy, @JsonKey(name: 'max_radius_km')  double maxRadiusKm, @JsonKey(includeToJson: false)  List<String> allowedZipCodes, @JsonKey(name: 'require_zip_code_validation')  bool requireZipCodeValidation, @JsonKey(name: 'min_amount_for_free_shipping')  int? minAmountForFreeShipping, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ShippingConfigModel() when $default != null:
return $default(_that.id,_that.branchId,_that.strategy,_that.maxRadiusKm,_that.allowedZipCodes,_that.requireZipCodeValidation,_that.minAmountForFreeShipping,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingConfigModel extends ShippingConfigModel {
  const _ShippingConfigModel({required this.id, @JsonKey(name: 'branch_id') required this.branchId, required this.strategy, @JsonKey(name: 'max_radius_km') required this.maxRadiusKm, @JsonKey(includeToJson: false) final  List<String> allowedZipCodes = const [], @JsonKey(name: 'require_zip_code_validation') this.requireZipCodeValidation = false, @JsonKey(name: 'min_amount_for_free_shipping') this.minAmountForFreeShipping, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt}): _allowedZipCodes = allowedZipCodes,super._();
  factory _ShippingConfigModel.fromJson(Map<String, dynamic> json) => _$ShippingConfigModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'branch_id') final  String branchId;
@override final  ShippingStrategy strategy;
@override@JsonKey(name: 'max_radius_km') final  double maxRadiusKm;
 final  List<String> _allowedZipCodes;
@override@JsonKey(includeToJson: false) List<String> get allowedZipCodes {
  if (_allowedZipCodes is EqualUnmodifiableListView) return _allowedZipCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allowedZipCodes);
}

@override@JsonKey(name: 'require_zip_code_validation') final  bool requireZipCodeValidation;
@override@JsonKey(name: 'min_amount_for_free_shipping') final  int? minAmountForFreeShipping;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ShippingConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingConfigModelCopyWith<_ShippingConfigModel> get copyWith => __$ShippingConfigModelCopyWithImpl<_ShippingConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingConfigModel&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.maxRadiusKm, maxRadiusKm) || other.maxRadiusKm == maxRadiusKm)&&const DeepCollectionEquality().equals(other._allowedZipCodes, _allowedZipCodes)&&(identical(other.requireZipCodeValidation, requireZipCodeValidation) || other.requireZipCodeValidation == requireZipCodeValidation)&&(identical(other.minAmountForFreeShipping, minAmountForFreeShipping) || other.minAmountForFreeShipping == minAmountForFreeShipping)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,branchId,strategy,maxRadiusKm,const DeepCollectionEquality().hash(_allowedZipCodes),requireZipCodeValidation,minAmountForFreeShipping,isActive,createdAt);

@override
String toString() {
  return 'ShippingConfigModel(id: $id, branchId: $branchId, strategy: $strategy, maxRadiusKm: $maxRadiusKm, allowedZipCodes: $allowedZipCodes, requireZipCodeValidation: $requireZipCodeValidation, minAmountForFreeShipping: $minAmountForFreeShipping, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ShippingConfigModelCopyWith<$Res> implements $ShippingConfigModelCopyWith<$Res> {
  factory _$ShippingConfigModelCopyWith(_ShippingConfigModel value, $Res Function(_ShippingConfigModel) _then) = __$ShippingConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'branch_id') String branchId, ShippingStrategy strategy,@JsonKey(name: 'max_radius_km') double maxRadiusKm,@JsonKey(includeToJson: false) List<String> allowedZipCodes,@JsonKey(name: 'require_zip_code_validation') bool requireZipCodeValidation,@JsonKey(name: 'min_amount_for_free_shipping') int? minAmountForFreeShipping,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$ShippingConfigModelCopyWithImpl<$Res>
    implements _$ShippingConfigModelCopyWith<$Res> {
  __$ShippingConfigModelCopyWithImpl(this._self, this._then);

  final _ShippingConfigModel _self;
  final $Res Function(_ShippingConfigModel) _then;

/// Create a copy of ShippingConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? strategy = null,Object? maxRadiusKm = null,Object? allowedZipCodes = null,Object? requireZipCodeValidation = null,Object? minAmountForFreeShipping = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_ShippingConfigModel(
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
