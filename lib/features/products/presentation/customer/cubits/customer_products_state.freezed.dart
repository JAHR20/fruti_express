// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerProductsState {

 List<Product> get products; Product? get productDetail; String? get currentCategoryId; bool get isLoading; String? get errorMessage; String get branchId; bool get isOffersMode; String? get offersCategoryId; bool get offersCategoryUnavailable;
/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerProductsStateCopyWith<CustomerProductsState> get copyWith => _$CustomerProductsStateCopyWithImpl<CustomerProductsState>(this as CustomerProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerProductsState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.productDetail, productDetail) || other.productDetail == productDetail)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isOffersMode, isOffersMode) || other.isOffersMode == isOffersMode)&&(identical(other.offersCategoryId, offersCategoryId) || other.offersCategoryId == offersCategoryId)&&(identical(other.offersCategoryUnavailable, offersCategoryUnavailable) || other.offersCategoryUnavailable == offersCategoryUnavailable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),productDetail,currentCategoryId,isLoading,errorMessage,branchId,isOffersMode,offersCategoryId,offersCategoryUnavailable);

@override
String toString() {
  return 'CustomerProductsState(products: $products, productDetail: $productDetail, currentCategoryId: $currentCategoryId, isLoading: $isLoading, errorMessage: $errorMessage, branchId: $branchId, isOffersMode: $isOffersMode, offersCategoryId: $offersCategoryId, offersCategoryUnavailable: $offersCategoryUnavailable)';
}


}

/// @nodoc
abstract mixin class $CustomerProductsStateCopyWith<$Res>  {
  factory $CustomerProductsStateCopyWith(CustomerProductsState value, $Res Function(CustomerProductsState) _then) = _$CustomerProductsStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products, Product? productDetail, String? currentCategoryId, bool isLoading, String? errorMessage, String branchId, bool isOffersMode, String? offersCategoryId, bool offersCategoryUnavailable
});


$ProductCopyWith<$Res>? get productDetail;

}
/// @nodoc
class _$CustomerProductsStateCopyWithImpl<$Res>
    implements $CustomerProductsStateCopyWith<$Res> {
  _$CustomerProductsStateCopyWithImpl(this._self, this._then);

  final CustomerProductsState _self;
  final $Res Function(CustomerProductsState) _then;

/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? productDetail = freezed,Object? currentCategoryId = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? branchId = null,Object? isOffersMode = null,Object? offersCategoryId = freezed,Object? offersCategoryUnavailable = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,productDetail: freezed == productDetail ? _self.productDetail : productDetail // ignore: cast_nullable_to_non_nullable
as Product?,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,isOffersMode: null == isOffersMode ? _self.isOffersMode : isOffersMode // ignore: cast_nullable_to_non_nullable
as bool,offersCategoryId: freezed == offersCategoryId ? _self.offersCategoryId : offersCategoryId // ignore: cast_nullable_to_non_nullable
as String?,offersCategoryUnavailable: null == offersCategoryUnavailable ? _self.offersCategoryUnavailable : offersCategoryUnavailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get productDetail {
    if (_self.productDetail == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.productDetail!, (value) {
    return _then(_self.copyWith(productDetail: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomerProductsState].
extension CustomerProductsStatePatterns on CustomerProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerProductsState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? errorMessage,  String branchId,  bool isOffersMode,  String? offersCategoryId,  bool offersCategoryUnavailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerProductsState() when $default != null:
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.errorMessage,_that.branchId,_that.isOffersMode,_that.offersCategoryId,_that.offersCategoryUnavailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? errorMessage,  String branchId,  bool isOffersMode,  String? offersCategoryId,  bool offersCategoryUnavailable)  $default,) {final _that = this;
switch (_that) {
case _CustomerProductsState():
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.errorMessage,_that.branchId,_that.isOffersMode,_that.offersCategoryId,_that.offersCategoryUnavailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? errorMessage,  String branchId,  bool isOffersMode,  String? offersCategoryId,  bool offersCategoryUnavailable)?  $default,) {final _that = this;
switch (_that) {
case _CustomerProductsState() when $default != null:
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.errorMessage,_that.branchId,_that.isOffersMode,_that.offersCategoryId,_that.offersCategoryUnavailable);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerProductsState implements CustomerProductsState {
  const _CustomerProductsState({final  List<Product> products = const <Product>[], this.productDetail, this.currentCategoryId, this.isLoading = false, this.errorMessage, this.branchId = '', this.isOffersMode = false, this.offersCategoryId, this.offersCategoryUnavailable = false}): _products = products;
  

 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  Product? productDetail;
@override final  String? currentCategoryId;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  String branchId;
@override@JsonKey() final  bool isOffersMode;
@override final  String? offersCategoryId;
@override@JsonKey() final  bool offersCategoryUnavailable;

/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerProductsStateCopyWith<_CustomerProductsState> get copyWith => __$CustomerProductsStateCopyWithImpl<_CustomerProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerProductsState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.productDetail, productDetail) || other.productDetail == productDetail)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.isOffersMode, isOffersMode) || other.isOffersMode == isOffersMode)&&(identical(other.offersCategoryId, offersCategoryId) || other.offersCategoryId == offersCategoryId)&&(identical(other.offersCategoryUnavailable, offersCategoryUnavailable) || other.offersCategoryUnavailable == offersCategoryUnavailable));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),productDetail,currentCategoryId,isLoading,errorMessage,branchId,isOffersMode,offersCategoryId,offersCategoryUnavailable);

@override
String toString() {
  return 'CustomerProductsState(products: $products, productDetail: $productDetail, currentCategoryId: $currentCategoryId, isLoading: $isLoading, errorMessage: $errorMessage, branchId: $branchId, isOffersMode: $isOffersMode, offersCategoryId: $offersCategoryId, offersCategoryUnavailable: $offersCategoryUnavailable)';
}


}

/// @nodoc
abstract mixin class _$CustomerProductsStateCopyWith<$Res> implements $CustomerProductsStateCopyWith<$Res> {
  factory _$CustomerProductsStateCopyWith(_CustomerProductsState value, $Res Function(_CustomerProductsState) _then) = __$CustomerProductsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products, Product? productDetail, String? currentCategoryId, bool isLoading, String? errorMessage, String branchId, bool isOffersMode, String? offersCategoryId, bool offersCategoryUnavailable
});


@override $ProductCopyWith<$Res>? get productDetail;

}
/// @nodoc
class __$CustomerProductsStateCopyWithImpl<$Res>
    implements _$CustomerProductsStateCopyWith<$Res> {
  __$CustomerProductsStateCopyWithImpl(this._self, this._then);

  final _CustomerProductsState _self;
  final $Res Function(_CustomerProductsState) _then;

/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? productDetail = freezed,Object? currentCategoryId = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? branchId = null,Object? isOffersMode = null,Object? offersCategoryId = freezed,Object? offersCategoryUnavailable = null,}) {
  return _then(_CustomerProductsState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,productDetail: freezed == productDetail ? _self.productDetail : productDetail // ignore: cast_nullable_to_non_nullable
as Product?,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,isOffersMode: null == isOffersMode ? _self.isOffersMode : isOffersMode // ignore: cast_nullable_to_non_nullable
as bool,offersCategoryId: freezed == offersCategoryId ? _self.offersCategoryId : offersCategoryId // ignore: cast_nullable_to_non_nullable
as String?,offersCategoryUnavailable: null == offersCategoryUnavailable ? _self.offersCategoryUnavailable : offersCategoryUnavailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CustomerProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get productDetail {
    if (_self.productDetail == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.productDetail!, (value) {
    return _then(_self.copyWith(productDetail: value));
  });
}
}

// dart format on
