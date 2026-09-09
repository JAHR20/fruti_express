// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductState {

 List<Product> get products; Product? get productDetail; String? get currentCategoryId; bool get isLoading; String? get processingProductId; bool get isSavingOperation; String? get errorMessage; String? get operationError; bool get operationSuccessful;
/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductStateCopyWith<ProductState> get copyWith => _$ProductStateCopyWithImpl<ProductState>(this as ProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.productDetail, productDetail) || other.productDetail == productDetail)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),productDetail,currentCategoryId,isLoading,processingProductId,isSavingOperation,errorMessage,operationError,operationSuccessful);

@override
String toString() {
  return 'ProductState(products: $products, productDetail: $productDetail, currentCategoryId: $currentCategoryId, isLoading: $isLoading, processingProductId: $processingProductId, isSavingOperation: $isSavingOperation, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful)';
}


}

/// @nodoc
abstract mixin class $ProductStateCopyWith<$Res>  {
  factory $ProductStateCopyWith(ProductState value, $Res Function(ProductState) _then) = _$ProductStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products, Product? productDetail, String? currentCategoryId, bool isLoading, String? processingProductId, bool isSavingOperation, String? errorMessage, String? operationError, bool operationSuccessful
});


$ProductCopyWith<$Res>? get productDetail;

}
/// @nodoc
class _$ProductStateCopyWithImpl<$Res>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._self, this._then);

  final ProductState _self;
  final $Res Function(ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? productDetail = freezed,Object? currentCategoryId = freezed,Object? isLoading = null,Object? processingProductId = freezed,Object? isSavingOperation = null,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,productDetail: freezed == productDetail ? _self.productDetail : productDetail // ignore: cast_nullable_to_non_nullable
as Product?,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProductState
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


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductState value)  $default,){
final _that = this;
switch (_that) {
case _ProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? processingProductId,  bool isSavingOperation,  String? errorMessage,  String? operationError,  bool operationSuccessful)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.processingProductId,_that.isSavingOperation,_that.errorMessage,_that.operationError,_that.operationSuccessful);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? processingProductId,  bool isSavingOperation,  String? errorMessage,  String? operationError,  bool operationSuccessful)  $default,) {final _that = this;
switch (_that) {
case _ProductState():
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.processingProductId,_that.isSavingOperation,_that.errorMessage,_that.operationError,_that.operationSuccessful);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> products,  Product? productDetail,  String? currentCategoryId,  bool isLoading,  String? processingProductId,  bool isSavingOperation,  String? errorMessage,  String? operationError,  bool operationSuccessful)?  $default,) {final _that = this;
switch (_that) {
case _ProductState() when $default != null:
return $default(_that.products,_that.productDetail,_that.currentCategoryId,_that.isLoading,_that.processingProductId,_that.isSavingOperation,_that.errorMessage,_that.operationError,_that.operationSuccessful);case _:
  return null;

}
}

}

/// @nodoc


class _ProductState implements ProductState {
  const _ProductState({final  List<Product> products = const <Product>[], this.productDetail, this.currentCategoryId, this.isLoading = false, this.processingProductId, this.isSavingOperation = false, this.errorMessage, this.operationError, this.operationSuccessful = false}): _products = products;
  

 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  Product? productDetail;
@override final  String? currentCategoryId;
@override@JsonKey() final  bool isLoading;
@override final  String? processingProductId;
@override@JsonKey() final  bool isSavingOperation;
@override final  String? errorMessage;
@override final  String? operationError;
@override@JsonKey() final  bool operationSuccessful;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductStateCopyWith<_ProductState> get copyWith => __$ProductStateCopyWithImpl<_ProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.productDetail, productDetail) || other.productDetail == productDetail)&&(identical(other.currentCategoryId, currentCategoryId) || other.currentCategoryId == currentCategoryId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),productDetail,currentCategoryId,isLoading,processingProductId,isSavingOperation,errorMessage,operationError,operationSuccessful);

@override
String toString() {
  return 'ProductState(products: $products, productDetail: $productDetail, currentCategoryId: $currentCategoryId, isLoading: $isLoading, processingProductId: $processingProductId, isSavingOperation: $isSavingOperation, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful)';
}


}

/// @nodoc
abstract mixin class _$ProductStateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$ProductStateCopyWith(_ProductState value, $Res Function(_ProductState) _then) = __$ProductStateCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products, Product? productDetail, String? currentCategoryId, bool isLoading, String? processingProductId, bool isSavingOperation, String? errorMessage, String? operationError, bool operationSuccessful
});


@override $ProductCopyWith<$Res>? get productDetail;

}
/// @nodoc
class __$ProductStateCopyWithImpl<$Res>
    implements _$ProductStateCopyWith<$Res> {
  __$ProductStateCopyWithImpl(this._self, this._then);

  final _ProductState _self;
  final $Res Function(_ProductState) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? productDetail = freezed,Object? currentCategoryId = freezed,Object? isLoading = null,Object? processingProductId = freezed,Object? isSavingOperation = null,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,}) {
  return _then(_ProductState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,productDetail: freezed == productDetail ? _self.productDetail : productDetail // ignore: cast_nullable_to_non_nullable
as Product?,currentCategoryId: freezed == currentCategoryId ? _self.currentCategoryId : currentCategoryId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProductState
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
