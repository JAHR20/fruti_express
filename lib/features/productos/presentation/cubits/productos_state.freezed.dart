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

 List<Producto> get productos; Producto? get productoDetalle; String? get categoriaIdActual; bool get isLoading; String? get productoProcesandoId; bool get guardandoOperacion; String? get errorMessage; String? get operacionError; bool get operacionExitosa;
/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductosStateCopyWith<ProductosState> get copyWith => _$ProductosStateCopyWithImpl<ProductosState>(this as ProductosState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductosState&&const DeepCollectionEquality().equals(other.productos, productos)&&(identical(other.productoDetalle, productoDetalle) || other.productoDetalle == productoDetalle)&&(identical(other.categoriaIdActual, categoriaIdActual) || other.categoriaIdActual == categoriaIdActual)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.guardandoOperacion, guardandoOperacion) || other.guardandoOperacion == guardandoOperacion)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(productos),productoDetalle,categoriaIdActual,isLoading,productoProcesandoId,guardandoOperacion,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'ProductosState(productos: $productos, productoDetalle: $productoDetalle, categoriaIdActual: $categoriaIdActual, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, guardandoOperacion: $guardandoOperacion, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class $ProductosStateCopyWith<$Res>  {
  factory $ProductosStateCopyWith(ProductosState value, $Res Function(ProductosState) _then) = _$ProductosStateCopyWithImpl;
@useResult
$Res call({
 List<Producto> productos, Producto? productoDetalle, String? categoriaIdActual, bool isLoading, String? productoProcesandoId, bool guardandoOperacion, String? errorMessage, String? operacionError, bool operacionExitosa
});


$ProductoCopyWith<$Res>? get productoDetalle;

}
/// @nodoc
class _$ProductosStateCopyWithImpl<$Res>
    implements $ProductosStateCopyWith<$Res> {
  _$ProductosStateCopyWithImpl(this._self, this._then);

  final ProductosState _self;
  final $Res Function(ProductosState) _then;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productos = null,Object? productoDetalle = freezed,Object? categoriaIdActual = freezed,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? guardandoOperacion = null,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_self.copyWith(
productos: null == productos ? _self.productos : productos // ignore: cast_nullable_to_non_nullable
as List<Producto>,productoDetalle: freezed == productoDetalle ? _self.productoDetalle : productoDetalle // ignore: cast_nullable_to_non_nullable
as Producto?,categoriaIdActual: freezed == categoriaIdActual ? _self.categoriaIdActual : categoriaIdActual // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,guardandoOperacion: null == guardandoOperacion ? _self.guardandoOperacion : guardandoOperacion // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductosState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductosState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductosState value)  $default,){
final _that = this;
switch (_that) {
case _ProductosState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductosState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductosState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual,  bool isLoading,  String? productoProcesandoId,  bool guardandoOperacion,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductosState() when $default != null:
return $default(_that.productos,_that.productoDetalle,_that.categoriaIdActual,_that.isLoading,_that.productoProcesandoId,_that.guardandoOperacion,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual,  bool isLoading,  String? productoProcesandoId,  bool guardandoOperacion,  String? errorMessage,  String? operacionError,  bool operacionExitosa)  $default,) {final _that = this;
switch (_that) {
case _ProductosState():
return $default(_that.productos,_that.productoDetalle,_that.categoriaIdActual,_that.isLoading,_that.productoProcesandoId,_that.guardandoOperacion,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Producto> productos,  Producto? productoDetalle,  String? categoriaIdActual,  bool isLoading,  String? productoProcesandoId,  bool guardandoOperacion,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,) {final _that = this;
switch (_that) {
case _ProductosState() when $default != null:
return $default(_that.productos,_that.productoDetalle,_that.categoriaIdActual,_that.isLoading,_that.productoProcesandoId,_that.guardandoOperacion,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
  return null;

}
}

}

/// @nodoc


class _ProductosState implements ProductosState {
  const _ProductosState({final  List<Producto> productos = const <Producto>[], this.productoDetalle, this.categoriaIdActual, this.isLoading = false, this.productoProcesandoId, this.guardandoOperacion = false, this.errorMessage, this.operacionError, this.operacionExitosa = false}): _productos = productos;
  

 final  List<Producto> _productos;
@override@JsonKey() List<Producto> get productos {
  if (_productos is EqualUnmodifiableListView) return _productos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productos);
}

@override final  Producto? productoDetalle;
@override final  String? categoriaIdActual;
@override@JsonKey() final  bool isLoading;
@override final  String? productoProcesandoId;
@override@JsonKey() final  bool guardandoOperacion;
@override final  String? errorMessage;
@override final  String? operacionError;
@override@JsonKey() final  bool operacionExitosa;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductosStateCopyWith<_ProductosState> get copyWith => __$ProductosStateCopyWithImpl<_ProductosState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductosState&&const DeepCollectionEquality().equals(other._productos, _productos)&&(identical(other.productoDetalle, productoDetalle) || other.productoDetalle == productoDetalle)&&(identical(other.categoriaIdActual, categoriaIdActual) || other.categoriaIdActual == categoriaIdActual)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.guardandoOperacion, guardandoOperacion) || other.guardandoOperacion == guardandoOperacion)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_productos),productoDetalle,categoriaIdActual,isLoading,productoProcesandoId,guardandoOperacion,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'ProductosState(productos: $productos, productoDetalle: $productoDetalle, categoriaIdActual: $categoriaIdActual, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, guardandoOperacion: $guardandoOperacion, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class _$ProductosStateCopyWith<$Res> implements $ProductosStateCopyWith<$Res> {
  factory _$ProductosStateCopyWith(_ProductosState value, $Res Function(_ProductosState) _then) = __$ProductosStateCopyWithImpl;
@override @useResult
$Res call({
 List<Producto> productos, Producto? productoDetalle, String? categoriaIdActual, bool isLoading, String? productoProcesandoId, bool guardandoOperacion, String? errorMessage, String? operacionError, bool operacionExitosa
});


@override $ProductoCopyWith<$Res>? get productoDetalle;

}
/// @nodoc
class __$ProductosStateCopyWithImpl<$Res>
    implements _$ProductosStateCopyWith<$Res> {
  __$ProductosStateCopyWithImpl(this._self, this._then);

  final _ProductosState _self;
  final $Res Function(_ProductosState) _then;

/// Create a copy of ProductosState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productos = null,Object? productoDetalle = freezed,Object? categoriaIdActual = freezed,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? guardandoOperacion = null,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_ProductosState(
productos: null == productos ? _self._productos : productos // ignore: cast_nullable_to_non_nullable
as List<Producto>,productoDetalle: freezed == productoDetalle ? _self.productoDetalle : productoDetalle // ignore: cast_nullable_to_non_nullable
as Producto?,categoriaIdActual: freezed == categoriaIdActual ? _self.categoriaIdActual : categoriaIdActual // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,guardandoOperacion: null == guardandoOperacion ? _self.guardandoOperacion : guardandoOperacion // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
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

// dart format on
