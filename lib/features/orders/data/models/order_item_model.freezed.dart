// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItemModel {

 String get id;@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'product_name_snapshot') String get productNameSnapshot; int get quantity;@JsonKey(name: 'unit_price_snapshot') int get unitPriceSnapshot;@MeasurementUnitConverter()@JsonKey(name: 'measurement_unit') MeasurementUnit? get measurementUnit;
/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemModelCopyWith<OrderItemModel> get copyWith => _$OrderItemModelCopyWithImpl<OrderItemModel>(this as OrderItemModel, _$identity);

  /// Serializes this OrderItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productNameSnapshot, productNameSnapshot) || other.productNameSnapshot == productNameSnapshot)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceSnapshot, unitPriceSnapshot) || other.unitPriceSnapshot == unitPriceSnapshot)&&(identical(other.measurementUnit, measurementUnit) || other.measurementUnit == measurementUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,productId,productNameSnapshot,quantity,unitPriceSnapshot,measurementUnit);

@override
String toString() {
  return 'OrderItemModel(id: $id, orderId: $orderId, productId: $productId, productNameSnapshot: $productNameSnapshot, quantity: $quantity, unitPriceSnapshot: $unitPriceSnapshot, measurementUnit: $measurementUnit)';
}


}

/// @nodoc
abstract mixin class $OrderItemModelCopyWith<$Res>  {
  factory $OrderItemModelCopyWith(OrderItemModel value, $Res Function(OrderItemModel) _then) = _$OrderItemModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name_snapshot') String productNameSnapshot, int quantity,@JsonKey(name: 'unit_price_snapshot') int unitPriceSnapshot,@MeasurementUnitConverter()@JsonKey(name: 'measurement_unit') MeasurementUnit? measurementUnit
});




}
/// @nodoc
class _$OrderItemModelCopyWithImpl<$Res>
    implements $OrderItemModelCopyWith<$Res> {
  _$OrderItemModelCopyWithImpl(this._self, this._then);

  final OrderItemModel _self;
  final $Res Function(OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? productId = null,Object? productNameSnapshot = null,Object? quantity = null,Object? unitPriceSnapshot = null,Object? measurementUnit = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productNameSnapshot: null == productNameSnapshot ? _self.productNameSnapshot : productNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceSnapshot: null == unitPriceSnapshot ? _self.unitPriceSnapshot : unitPriceSnapshot // ignore: cast_nullable_to_non_nullable
as int,measurementUnit: freezed == measurementUnit ? _self.measurementUnit : measurementUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItemModel].
extension OrderItemModelPatterns on OrderItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name_snapshot')  String productNameSnapshot,  int quantity, @JsonKey(name: 'unit_price_snapshot')  int unitPriceSnapshot, @MeasurementUnitConverter()@JsonKey(name: 'measurement_unit')  MeasurementUnit? measurementUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.orderId,_that.productId,_that.productNameSnapshot,_that.quantity,_that.unitPriceSnapshot,_that.measurementUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name_snapshot')  String productNameSnapshot,  int quantity, @JsonKey(name: 'unit_price_snapshot')  int unitPriceSnapshot, @MeasurementUnitConverter()@JsonKey(name: 'measurement_unit')  MeasurementUnit? measurementUnit)  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel():
return $default(_that.id,_that.orderId,_that.productId,_that.productNameSnapshot,_that.quantity,_that.unitPriceSnapshot,_that.measurementUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'product_name_snapshot')  String productNameSnapshot,  int quantity, @JsonKey(name: 'unit_price_snapshot')  int unitPriceSnapshot, @MeasurementUnitConverter()@JsonKey(name: 'measurement_unit')  MeasurementUnit? measurementUnit)?  $default,) {final _that = this;
switch (_that) {
case _OrderItemModel() when $default != null:
return $default(_that.id,_that.orderId,_that.productId,_that.productNameSnapshot,_that.quantity,_that.unitPriceSnapshot,_that.measurementUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemModel implements OrderItemModel {
  const _OrderItemModel({required this.id, @JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'product_name_snapshot') required this.productNameSnapshot, required this.quantity, @JsonKey(name: 'unit_price_snapshot') required this.unitPriceSnapshot, @MeasurementUnitConverter()@JsonKey(name: 'measurement_unit') this.measurementUnit});
  factory _OrderItemModel.fromJson(Map<String, dynamic> json) => _$OrderItemModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'product_name_snapshot') final  String productNameSnapshot;
@override final  int quantity;
@override@JsonKey(name: 'unit_price_snapshot') final  int unitPriceSnapshot;
@override@MeasurementUnitConverter()@JsonKey(name: 'measurement_unit') final  MeasurementUnit? measurementUnit;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemModelCopyWith<_OrderItemModel> get copyWith => __$OrderItemModelCopyWithImpl<_OrderItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productNameSnapshot, productNameSnapshot) || other.productNameSnapshot == productNameSnapshot)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceSnapshot, unitPriceSnapshot) || other.unitPriceSnapshot == unitPriceSnapshot)&&(identical(other.measurementUnit, measurementUnit) || other.measurementUnit == measurementUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,productId,productNameSnapshot,quantity,unitPriceSnapshot,measurementUnit);

@override
String toString() {
  return 'OrderItemModel(id: $id, orderId: $orderId, productId: $productId, productNameSnapshot: $productNameSnapshot, quantity: $quantity, unitPriceSnapshot: $unitPriceSnapshot, measurementUnit: $measurementUnit)';
}


}

/// @nodoc
abstract mixin class _$OrderItemModelCopyWith<$Res> implements $OrderItemModelCopyWith<$Res> {
  factory _$OrderItemModelCopyWith(_OrderItemModel value, $Res Function(_OrderItemModel) _then) = __$OrderItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'product_name_snapshot') String productNameSnapshot, int quantity,@JsonKey(name: 'unit_price_snapshot') int unitPriceSnapshot,@MeasurementUnitConverter()@JsonKey(name: 'measurement_unit') MeasurementUnit? measurementUnit
});




}
/// @nodoc
class __$OrderItemModelCopyWithImpl<$Res>
    implements _$OrderItemModelCopyWith<$Res> {
  __$OrderItemModelCopyWithImpl(this._self, this._then);

  final _OrderItemModel _self;
  final $Res Function(_OrderItemModel) _then;

/// Create a copy of OrderItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? productId = null,Object? productNameSnapshot = null,Object? quantity = null,Object? unitPriceSnapshot = null,Object? measurementUnit = freezed,}) {
  return _then(_OrderItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productNameSnapshot: null == productNameSnapshot ? _self.productNameSnapshot : productNameSnapshot // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceSnapshot: null == unitPriceSnapshot ? _self.unitPriceSnapshot : unitPriceSnapshot // ignore: cast_nullable_to_non_nullable
as int,measurementUnit: freezed == measurementUnit ? _self.measurementUnit : measurementUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit?,
  ));
}


}

// dart format on
