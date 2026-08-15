// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carrito_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarritoState {

// ============================================================
// DATOS DEL CARRITO
// ============================================================
 List<CarritoItem> get items;// ============================================================
// DATOS DE ENTREGA
// ============================================================
 ModoEntrega? get modoEntrega; Direccion? get direccionSeleccionada; String? get sucursalId;// ============================================================
// ESTADO DE CARGA
// ============================================================
 bool get isLoading;// Producto que está siendo modificado actualmente
 String? get productoProcesandoId;// ============================================================
// ERRORES
// ============================================================
 String? get errorMessage; String? get operacionError;// ============================================================
// RESULTADO DE OPERACIÓN
// ============================================================
 bool get operacionExitosa;
/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarritoStateCopyWith<CarritoState> get copyWith => _$CarritoStateCopyWithImpl<CarritoState>(this as CarritoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarritoState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.direccionSeleccionada, direccionSeleccionada) || other.direccionSeleccionada == direccionSeleccionada)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),modoEntrega,direccionSeleccionada,sucursalId,isLoading,productoProcesandoId,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'CarritoState(items: $items, modoEntrega: $modoEntrega, direccionSeleccionada: $direccionSeleccionada, sucursalId: $sucursalId, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class $CarritoStateCopyWith<$Res>  {
  factory $CarritoStateCopyWith(CarritoState value, $Res Function(CarritoState) _then) = _$CarritoStateCopyWithImpl;
@useResult
$Res call({
 List<CarritoItem> items, ModoEntrega? modoEntrega, Direccion? direccionSeleccionada, String? sucursalId, bool isLoading, String? productoProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa
});


$DireccionCopyWith<$Res>? get direccionSeleccionada;

}
/// @nodoc
class _$CarritoStateCopyWithImpl<$Res>
    implements $CarritoStateCopyWith<$Res> {
  _$CarritoStateCopyWithImpl(this._self, this._then);

  final CarritoState _self;
  final $Res Function(CarritoState) _then;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? modoEntrega = freezed,Object? direccionSeleccionada = freezed,Object? sucursalId = freezed,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CarritoItem>,modoEntrega: freezed == modoEntrega ? _self.modoEntrega : modoEntrega // ignore: cast_nullable_to_non_nullable
as ModoEntrega?,direccionSeleccionada: freezed == direccionSeleccionada ? _self.direccionSeleccionada : direccionSeleccionada // ignore: cast_nullable_to_non_nullable
as Direccion?,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DireccionCopyWith<$Res>? get direccionSeleccionada {
    if (_self.direccionSeleccionada == null) {
    return null;
  }

  return $DireccionCopyWith<$Res>(_self.direccionSeleccionada!, (value) {
    return _then(_self.copyWith(direccionSeleccionada: value));
  });
}
}


/// Adds pattern-matching-related methods to [CarritoState].
extension CarritoStatePatterns on CarritoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarritoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarritoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarritoState value)  $default,){
final _that = this;
switch (_that) {
case _CarritoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarritoState value)?  $default,){
final _that = this;
switch (_that) {
case _CarritoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarritoState() when $default != null:
return $default(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)  $default,) {final _that = this;
switch (_that) {
case _CarritoState():
return $default(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,) {final _that = this;
switch (_that) {
case _CarritoState() when $default != null:
return $default(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
  return null;

}
}

}

/// @nodoc


class _CarritoState extends CarritoState {
  const _CarritoState({final  List<CarritoItem> items = const <CarritoItem>[], this.modoEntrega, this.direccionSeleccionada, this.sucursalId, this.isLoading = false, this.productoProcesandoId, this.errorMessage, this.operacionError, this.operacionExitosa = false}): _items = items,super._();
  

// ============================================================
// DATOS DEL CARRITO
// ============================================================
 final  List<CarritoItem> _items;
// ============================================================
// DATOS DEL CARRITO
// ============================================================
@override@JsonKey() List<CarritoItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

// ============================================================
// DATOS DE ENTREGA
// ============================================================
@override final  ModoEntrega? modoEntrega;
@override final  Direccion? direccionSeleccionada;
@override final  String? sucursalId;
// ============================================================
// ESTADO DE CARGA
// ============================================================
@override@JsonKey() final  bool isLoading;
// Producto que está siendo modificado actualmente
@override final  String? productoProcesandoId;
// ============================================================
// ERRORES
// ============================================================
@override final  String? errorMessage;
@override final  String? operacionError;
// ============================================================
// RESULTADO DE OPERACIÓN
// ============================================================
@override@JsonKey() final  bool operacionExitosa;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarritoStateCopyWith<_CarritoState> get copyWith => __$CarritoStateCopyWithImpl<_CarritoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarritoState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.direccionSeleccionada, direccionSeleccionada) || other.direccionSeleccionada == direccionSeleccionada)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),modoEntrega,direccionSeleccionada,sucursalId,isLoading,productoProcesandoId,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'CarritoState(items: $items, modoEntrega: $modoEntrega, direccionSeleccionada: $direccionSeleccionada, sucursalId: $sucursalId, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class _$CarritoStateCopyWith<$Res> implements $CarritoStateCopyWith<$Res> {
  factory _$CarritoStateCopyWith(_CarritoState value, $Res Function(_CarritoState) _then) = __$CarritoStateCopyWithImpl;
@override @useResult
$Res call({
 List<CarritoItem> items, ModoEntrega? modoEntrega, Direccion? direccionSeleccionada, String? sucursalId, bool isLoading, String? productoProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa
});


@override $DireccionCopyWith<$Res>? get direccionSeleccionada;

}
/// @nodoc
class __$CarritoStateCopyWithImpl<$Res>
    implements _$CarritoStateCopyWith<$Res> {
  __$CarritoStateCopyWithImpl(this._self, this._then);

  final _CarritoState _self;
  final $Res Function(_CarritoState) _then;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? modoEntrega = freezed,Object? direccionSeleccionada = freezed,Object? sucursalId = freezed,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_CarritoState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CarritoItem>,modoEntrega: freezed == modoEntrega ? _self.modoEntrega : modoEntrega // ignore: cast_nullable_to_non_nullable
as ModoEntrega?,direccionSeleccionada: freezed == direccionSeleccionada ? _self.direccionSeleccionada : direccionSeleccionada // ignore: cast_nullable_to_non_nullable
as Direccion?,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DireccionCopyWith<$Res>? get direccionSeleccionada {
    if (_self.direccionSeleccionada == null) {
    return null;
  }

  return $DireccionCopyWith<$Res>(_self.direccionSeleccionada!, (value) {
    return _then(_self.copyWith(direccionSeleccionada: value));
  });
}
}

// dart format on
