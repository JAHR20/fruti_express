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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarritoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarritoState()';
}


}

/// @nodoc
class $CarritoStateCopyWith<$Res>  {
$CarritoStateCopyWith(CarritoState _, $Res Function(CarritoState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId)?  loaded,TResult Function( String mensaje)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId);case _Error() when error != null:
return error(_that.mensaje);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId)  loaded,required TResult Function( String mensaje)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId);case _Error():
return error(_that.mensaje);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CarritoItem> items,  ModoEntrega? modoEntrega,  Direccion? direccionSeleccionada,  String? sucursalId)?  loaded,TResult? Function( String mensaje)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items,_that.modoEntrega,_that.direccionSeleccionada,_that.sucursalId);case _Error() when error != null:
return error(_that.mensaje);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends CarritoState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarritoState.initial()';
}


}




/// @nodoc


class _Loading extends CarritoState {
  const _Loading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarritoState.loading()';
}


}




/// @nodoc


class _Loaded extends CarritoState {
  const _Loaded({final  List<CarritoItem> items = const [], this.modoEntrega, this.direccionSeleccionada, this.sucursalId}): _items = items,super._();
  

 final  List<CarritoItem> _items;
@JsonKey() List<CarritoItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  ModoEntrega? modoEntrega;
// 🌟 Aquí vive la decisión del usuario
 final  Direccion? direccionSeleccionada;
 final  String? sucursalId;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.direccionSeleccionada, direccionSeleccionada) || other.direccionSeleccionada == direccionSeleccionada)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),modoEntrega,direccionSeleccionada,sucursalId);

@override
String toString() {
  return 'CarritoState.loaded(items: $items, modoEntrega: $modoEntrega, direccionSeleccionada: $direccionSeleccionada, sucursalId: $sucursalId)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CarritoStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<CarritoItem> items, ModoEntrega? modoEntrega, Direccion? direccionSeleccionada, String? sucursalId
});


$DireccionCopyWith<$Res>? get direccionSeleccionada;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? modoEntrega = freezed,Object? direccionSeleccionada = freezed,Object? sucursalId = freezed,}) {
  return _then(_Loaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CarritoItem>,modoEntrega: freezed == modoEntrega ? _self.modoEntrega : modoEntrega // ignore: cast_nullable_to_non_nullable
as ModoEntrega?,direccionSeleccionada: freezed == direccionSeleccionada ? _self.direccionSeleccionada : direccionSeleccionada // ignore: cast_nullable_to_non_nullable
as Direccion?,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,
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

/// @nodoc


class _Error extends CarritoState {
  const _Error(this.mensaje): super._();
  

 final  String mensaje;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.mensaje, mensaje) || other.mensaje == mensaje));
}


@override
int get hashCode => Object.hash(runtimeType,mensaje);

@override
String toString() {
  return 'CarritoState.error(mensaje: $mensaje)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CarritoStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String mensaje
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CarritoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mensaje = null,}) {
  return _then(_Error(
null == mensaje ? _self.mensaje : mensaje // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
