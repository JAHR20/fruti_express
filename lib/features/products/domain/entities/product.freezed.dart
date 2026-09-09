// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Product {

 String? get id; String get categoryId; String get name; String? get description; int get currentPrice; int? get comparisonPrice; MeasurementUnit get measurementUnit; String? get imageUrl; bool get isActive; DateTime get createdAt; DateTime? get updatedAt; int get stock;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.comparisonPrice, comparisonPrice) || other.comparisonPrice == comparisonPrice)&&(identical(other.measurementUnit, measurementUnit) || other.measurementUnit == measurementUnit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,currentPrice,comparisonPrice,measurementUnit,imageUrl,isActive,createdAt,updatedAt,stock);

@override
String toString() {
  return 'Product(id: $id, categoryId: $categoryId, name: $name, description: $description, currentPrice: $currentPrice, comparisonPrice: $comparisonPrice, measurementUnit: $measurementUnit, imageUrl: $imageUrl, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String? id, String categoryId, String name, String? description, int currentPrice, int? comparisonPrice, MeasurementUnit measurementUnit, String? imageUrl, bool isActive, DateTime createdAt, DateTime? updatedAt, int stock
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? currentPrice = null,Object? comparisonPrice = freezed,Object? measurementUnit = null,Object? imageUrl = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as int,comparisonPrice: freezed == comparisonPrice ? _self.comparisonPrice : comparisonPrice // ignore: cast_nullable_to_non_nullable
as int?,measurementUnit: null == measurementUnit ? _self.measurementUnit : measurementUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String categoryId,  String name,  String? description,  int currentPrice,  int? comparisonPrice,  MeasurementUnit measurementUnit,  String? imageUrl,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.currentPrice,_that.comparisonPrice,_that.measurementUnit,_that.imageUrl,_that.isActive,_that.createdAt,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String categoryId,  String name,  String? description,  int currentPrice,  int? comparisonPrice,  MeasurementUnit measurementUnit,  String? imageUrl,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int stock)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.currentPrice,_that.comparisonPrice,_that.measurementUnit,_that.imageUrl,_that.isActive,_that.createdAt,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String categoryId,  String name,  String? description,  int currentPrice,  int? comparisonPrice,  MeasurementUnit measurementUnit,  String? imageUrl,  bool isActive,  DateTime createdAt,  DateTime? updatedAt,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.categoryId,_that.name,_that.description,_that.currentPrice,_that.comparisonPrice,_that.measurementUnit,_that.imageUrl,_that.isActive,_that.createdAt,_that.updatedAt,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _Product extends Product {
  const _Product({this.id, required this.categoryId, required this.name, this.description, required this.currentPrice, this.comparisonPrice, required this.measurementUnit, this.imageUrl, required this.isActive, required this.createdAt, this.updatedAt, this.stock = 0}): super._();
  

@override final  String? id;
@override final  String categoryId;
@override final  String name;
@override final  String? description;
@override final  int currentPrice;
@override final  int? comparisonPrice;
@override final  MeasurementUnit measurementUnit;
@override final  String? imageUrl;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey() final  int stock;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.currentPrice, currentPrice) || other.currentPrice == currentPrice)&&(identical(other.comparisonPrice, comparisonPrice) || other.comparisonPrice == comparisonPrice)&&(identical(other.measurementUnit, measurementUnit) || other.measurementUnit == measurementUnit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoryId,name,description,currentPrice,comparisonPrice,measurementUnit,imageUrl,isActive,createdAt,updatedAt,stock);

@override
String toString() {
  return 'Product(id: $id, categoryId: $categoryId, name: $name, description: $description, currentPrice: $currentPrice, comparisonPrice: $comparisonPrice, measurementUnit: $measurementUnit, imageUrl: $imageUrl, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String? id, String categoryId, String name, String? description, int currentPrice, int? comparisonPrice, MeasurementUnit measurementUnit, String? imageUrl, bool isActive, DateTime createdAt, DateTime? updatedAt, int stock
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryId = null,Object? name = null,Object? description = freezed,Object? currentPrice = null,Object? comparisonPrice = freezed,Object? measurementUnit = null,Object? imageUrl = freezed,Object? isActive = null,Object? createdAt = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_Product(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,currentPrice: null == currentPrice ? _self.currentPrice : currentPrice // ignore: cast_nullable_to_non_nullable
as int,comparisonPrice: freezed == comparisonPrice ? _self.comparisonPrice : comparisonPrice // ignore: cast_nullable_to_non_nullable
as int?,measurementUnit: null == measurementUnit ? _self.measurementUnit : measurementUnit // ignore: cast_nullable_to_non_nullable
as MeasurementUnit,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
