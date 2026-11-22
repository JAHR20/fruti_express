// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_offers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductOffers {

 List<Product> get products; bool get categoryUnavailable;
/// Create a copy of ProductOffers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOffersCopyWith<ProductOffers> get copyWith => _$ProductOffersCopyWithImpl<ProductOffers>(this as ProductOffers, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOffers&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.categoryUnavailable, categoryUnavailable) || other.categoryUnavailable == categoryUnavailable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),categoryUnavailable);

@override
String toString() {
  return 'ProductOffers(products: $products, categoryUnavailable: $categoryUnavailable)';
}


}

/// @nodoc
abstract mixin class $ProductOffersCopyWith<$Res>  {
  factory $ProductOffersCopyWith(ProductOffers value, $Res Function(ProductOffers) _then) = _$ProductOffersCopyWithImpl;
@useResult
$Res call({
 List<Product> products, bool categoryUnavailable
});




}
/// @nodoc
class _$ProductOffersCopyWithImpl<$Res>
    implements $ProductOffersCopyWith<$Res> {
  _$ProductOffersCopyWithImpl(this._self, this._then);

  final ProductOffers _self;
  final $Res Function(ProductOffers) _then;

/// Create a copy of ProductOffers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? categoryUnavailable = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,categoryUnavailable: null == categoryUnavailable ? _self.categoryUnavailable : categoryUnavailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductOffers].
extension ProductOffersPatterns on ProductOffers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductOffers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductOffers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductOffers value)  $default,){
final _that = this;
switch (_that) {
case _ProductOffers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductOffers value)?  $default,){
final _that = this;
switch (_that) {
case _ProductOffers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> products,  bool categoryUnavailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOffers() when $default != null:
return $default(_that.products,_that.categoryUnavailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> products,  bool categoryUnavailable)  $default,) {final _that = this;
switch (_that) {
case _ProductOffers():
return $default(_that.products,_that.categoryUnavailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> products,  bool categoryUnavailable)?  $default,) {final _that = this;
switch (_that) {
case _ProductOffers() when $default != null:
return $default(_that.products,_that.categoryUnavailable);case _:
  return null;

}
}

}

/// @nodoc


class _ProductOffers implements ProductOffers {
  const _ProductOffers({final  List<Product> products = const <Product>[], this.categoryUnavailable = false}): _products = products;
  

 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool categoryUnavailable;

/// Create a copy of ProductOffers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductOffersCopyWith<_ProductOffers> get copyWith => __$ProductOffersCopyWithImpl<_ProductOffers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOffers&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.categoryUnavailable, categoryUnavailable) || other.categoryUnavailable == categoryUnavailable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),categoryUnavailable);

@override
String toString() {
  return 'ProductOffers(products: $products, categoryUnavailable: $categoryUnavailable)';
}


}

/// @nodoc
abstract mixin class _$ProductOffersCopyWith<$Res> implements $ProductOffersCopyWith<$Res> {
  factory _$ProductOffersCopyWith(_ProductOffers value, $Res Function(_ProductOffers) _then) = __$ProductOffersCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products, bool categoryUnavailable
});




}
/// @nodoc
class __$ProductOffersCopyWithImpl<$Res>
    implements _$ProductOffersCopyWith<$Res> {
  __$ProductOffersCopyWithImpl(this._self, this._then);

  final _ProductOffers _self;
  final $Res Function(_ProductOffers) _then;

/// Create a copy of ProductOffers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? categoryUnavailable = null,}) {
  return _then(_ProductOffers(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,categoryUnavailable: null == categoryUnavailable ? _self.categoryUnavailable : categoryUnavailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
