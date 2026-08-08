// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductosState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductosState()';
}


}

/// @nodoc
class $ProductosStateCopyWith<$Res>  {
$ProductosStateCopyWith(ProductosState _, $Res Function(ProductosState) __);
}


/// Adds pattern-matching-related methods to [ProductosState].
extension ProductosStatePatterns on ProductosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductosInitial value)?  initial,TResult Function( ProductosLoading value)?  loading,TResult Function( ProductosLoaded value)?  loaded,TResult Function( ProductosError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductosInitial() when initial != null:
return initial(_that);case ProductosLoading() when loading != null:
return loading(_that);case ProductosLoaded() when loaded != null:
return loaded(_that);case ProductosError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductosInitial value)  initial,required TResult Function( ProductosLoading value)  loading,required TResult Function( ProductosLoaded value)  loaded,required TResult Function( ProductosError value)  error,}){
final _that = this;
switch (_that) {
case ProductosInitial():
return initial(_that);case ProductosLoading():
return loading(_that);case ProductosLoaded():
return loaded(_that);case ProductosError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductosInitial value)?  initial,TResult? Function( ProductosLoading value)?  loading,TResult? Function( ProductosLoaded value)?  loaded,TResult? Function( ProductosError value)?  error,}){
final _that = this;
switch (_that) {
case ProductosInitial() when initial != null:
return initial(_that);case ProductosLoading() when loading != null:
return loading(_that);case ProductosLoaded() when loaded != null:
return loaded(_that);case ProductosError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductosInitial() when initial != null:
return initial();case ProductosLoading() when loading != null:
return loading();case ProductosLoaded() when loaded != null:
return loaded(_that.productos,_that.productoDetalle,_that.categoriaIdActual);case ProductosError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ProductosInitial():
return initial();case ProductosLoading():
return loading();case ProductosLoaded():
return loaded(_that.productos,_that.productoDetalle,_that.categoriaIdActual);case ProductosError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ProductosInitial() when initial != null:
return initial();case ProductosLoading() when loading != null:
return loading();case ProductosLoaded() when loaded != null:
return loaded(_that.productos,_that.productoDetalle,_that.categoriaIdActual);case ProductosError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProductosInitial implements ProductosState {
  const ProductosInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductosState.initial()';
}


}




/// @nodoc


class ProductosLoading implements ProductosState {
  const ProductosLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductosState.loading()';
}


}




/// @nodoc


class ProductosLoaded implements ProductosState {
  const ProductosLoaded({required final  List<Producto> productos, this.productoDetalle, this.categoriaIdActual}): _productos = productos;
  

 final  List<Producto> _productos;
 List<Producto> get productos {
  if (_productos is EqualUnmodifiableListView) return _productos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productos);
}

 final  Producto? productoDetalle;
 final  String? categoriaIdActual;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductosLoadedCopyWith<ProductosLoaded> get copyWith => _$ProductosLoadedCopyWithImpl<ProductosLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosLoaded&&const DeepCollectionEquality().equals(other._productos, _productos)&&(identical(other.productoDetalle, productoDetalle) || other.productoDetalle == productoDetalle)&&(identical(other.categoriaIdActual, categoriaIdActual) || other.categoriaIdActual == categoriaIdActual));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_productos),productoDetalle,categoriaIdActual);

@override
String toString() {
  return 'ProductosState.loaded(productos: $productos, productoDetalle: $productoDetalle, categoriaIdActual: $categoriaIdActual)';
}


}

/// @nodoc
abstract mixin class $ProductosLoadedCopyWith<$Res> implements $ProductosStateCopyWith<$Res> {
  factory $ProductosLoadedCopyWith(ProductosLoaded value, $Res Function(ProductosLoaded) _then) = _$ProductosLoadedCopyWithImpl;
@useResult
$Res call({
 List<Producto> productos, Producto? productoDetalle, String? categoriaIdActual
});


$ProductoCopyWith<$Res>? get productoDetalle;

}
/// @nodoc
class _$ProductosLoadedCopyWithImpl<$Res>
    implements $ProductosLoadedCopyWith<$Res> {
  _$ProductosLoadedCopyWithImpl(this._self, this._then);

  final ProductosLoaded _self;
  final $Res Function(ProductosLoaded) _then;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productos = null,Object? productoDetalle = freezed,Object? categoriaIdActual = freezed,}) {
  return _then(ProductosLoaded(
productos: null == productos ? _self._productos : productos // ignore: cast_nullable_to_non_nullable
as List<Producto>,productoDetalle: freezed == productoDetalle ? _self.productoDetalle : productoDetalle // ignore: cast_nullable_to_non_nullable
as Producto?,categoriaIdActual: freezed == categoriaIdActual ? _self.categoriaIdActual : categoriaIdActual // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductoCopyWith<$Res>? get productoDetalle {
    if (_self.productoDetalle == null) {
    return null;
  }

  return $ProductoCopyWith<$Res>(_self.productoDetalle!, (value) {
    return _then(_self.copyWith(productoDetalle: value));
  });
}
}

/// @nodoc


class ProductosError implements ProductosState {
  const ProductosError(this.message);
  

 final  String message;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductosErrorCopyWith<ProductosError> get copyWith => _$ProductosErrorCopyWithImpl<ProductosError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductosState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProductosErrorCopyWith<$Res> implements $ProductosStateCopyWith<$Res> {
  factory $ProductosErrorCopyWith(ProductosError value, $Res Function(ProductosError) _then) = _$ProductosErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProductosErrorCopyWithImpl<$Res>
    implements $ProductosErrorCopyWith<$Res> {
  _$ProductosErrorCopyWithImpl(this._self, this._then);

  final ProductosError _self;
  final $Res Function(ProductosError) _then;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProductosError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
