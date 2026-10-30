// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminProductsState {

 List<Product> get products; bool get isLoading; String? get errorMessage;// Banderas exclusivas de las operaciones de administración
 String? get processingProductId; bool get isSavingOperation; String? get operationError; bool get operationSuccessful;
/// Create a copy of AdminProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminProductsStateCopyWith<AdminProductsState> get copyWith => _$AdminProductsStateCopyWithImpl<AdminProductsState>(this as AdminProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminProductsState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),isLoading,errorMessage,processingProductId,isSavingOperation,operationError,operationSuccessful);

@override
String toString() {
  return 'AdminProductsState(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, processingProductId: $processingProductId, isSavingOperation: $isSavingOperation, operationError: $operationError, operationSuccessful: $operationSuccessful)';
}


}

/// @nodoc
abstract mixin class $AdminProductsStateCopyWith<$Res>  {
  factory $AdminProductsStateCopyWith(AdminProductsState value, $Res Function(AdminProductsState) _then) = _$AdminProductsStateCopyWithImpl;
@useResult
$Res call({
 List<Product> products, bool isLoading, String? errorMessage, String? processingProductId, bool isSavingOperation, String? operationError, bool operationSuccessful
});




}
/// @nodoc
class _$AdminProductsStateCopyWithImpl<$Res>
    implements $AdminProductsStateCopyWith<$Res> {
  _$AdminProductsStateCopyWithImpl(this._self, this._then);

  final AdminProductsState _self;
  final $Res Function(AdminProductsState) _then;

/// Create a copy of AdminProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? isLoading = null,Object? errorMessage = freezed,Object? processingProductId = freezed,Object? isSavingOperation = null,Object? operationError = freezed,Object? operationSuccessful = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminProductsState].
extension AdminProductsStatePatterns on AdminProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminProductsState value)  $default,){
final _that = this;
switch (_that) {
case _AdminProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> products,  bool isLoading,  String? errorMessage,  String? processingProductId,  bool isSavingOperation,  String? operationError,  bool operationSuccessful)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminProductsState() when $default != null:
return $default(_that.products,_that.isLoading,_that.errorMessage,_that.processingProductId,_that.isSavingOperation,_that.operationError,_that.operationSuccessful);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> products,  bool isLoading,  String? errorMessage,  String? processingProductId,  bool isSavingOperation,  String? operationError,  bool operationSuccessful)  $default,) {final _that = this;
switch (_that) {
case _AdminProductsState():
return $default(_that.products,_that.isLoading,_that.errorMessage,_that.processingProductId,_that.isSavingOperation,_that.operationError,_that.operationSuccessful);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> products,  bool isLoading,  String? errorMessage,  String? processingProductId,  bool isSavingOperation,  String? operationError,  bool operationSuccessful)?  $default,) {final _that = this;
switch (_that) {
case _AdminProductsState() when $default != null:
return $default(_that.products,_that.isLoading,_that.errorMessage,_that.processingProductId,_that.isSavingOperation,_that.operationError,_that.operationSuccessful);case _:
  return null;

}
}

}

/// @nodoc


class _AdminProductsState implements AdminProductsState {
  const _AdminProductsState({final  List<Product> products = const <Product>[], this.isLoading = false, this.errorMessage, this.processingProductId, this.isSavingOperation = false, this.operationError, this.operationSuccessful = false}): _products = products;
  

 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
// Banderas exclusivas de las operaciones de administración
@override final  String? processingProductId;
@override@JsonKey() final  bool isSavingOperation;
@override final  String? operationError;
@override@JsonKey() final  bool operationSuccessful;

/// Create a copy of AdminProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminProductsStateCopyWith<_AdminProductsState> get copyWith => __$AdminProductsStateCopyWithImpl<_AdminProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminProductsState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),isLoading,errorMessage,processingProductId,isSavingOperation,operationError,operationSuccessful);

@override
String toString() {
  return 'AdminProductsState(products: $products, isLoading: $isLoading, errorMessage: $errorMessage, processingProductId: $processingProductId, isSavingOperation: $isSavingOperation, operationError: $operationError, operationSuccessful: $operationSuccessful)';
}


}

/// @nodoc
abstract mixin class _$AdminProductsStateCopyWith<$Res> implements $AdminProductsStateCopyWith<$Res> {
  factory _$AdminProductsStateCopyWith(_AdminProductsState value, $Res Function(_AdminProductsState) _then) = __$AdminProductsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Product> products, bool isLoading, String? errorMessage, String? processingProductId, bool isSavingOperation, String? operationError, bool operationSuccessful
});




}
/// @nodoc
class __$AdminProductsStateCopyWithImpl<$Res>
    implements _$AdminProductsStateCopyWith<$Res> {
  __$AdminProductsStateCopyWithImpl(this._self, this._then);

  final _AdminProductsState _self;
  final $Res Function(_AdminProductsState) _then;

/// Create a copy of AdminProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? isLoading = null,Object? errorMessage = freezed,Object? processingProductId = freezed,Object? isSavingOperation = null,Object? operationError = freezed,Object? operationSuccessful = null,}) {
  return _then(_AdminProductsState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
