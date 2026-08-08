// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinador_cliente_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CoordinadorClienteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoordinadorClienteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoordinadorClienteState()';
}


}

/// @nodoc
class $CoordinadorClienteStateCopyWith<$Res>  {
$CoordinadorClienteStateCopyWith(CoordinadorClienteState _, $Res Function(CoordinadorClienteState) __);
}


/// Adds pattern-matching-related methods to [CoordinadorClienteState].
extension CoordinadorClienteStatePatterns on CoordinadorClienteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Procesando value)?  procesando,TResult Function( _CambioExitoso value)?  cambioExitoso,TResult Function( _SinCobertura value)?  sinCobertura,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Procesando() when procesando != null:
return procesando(_that);case _CambioExitoso() when cambioExitoso != null:
return cambioExitoso(_that);case _SinCobertura() when sinCobertura != null:
return sinCobertura(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Procesando value)  procesando,required TResult Function( _CambioExitoso value)  cambioExitoso,required TResult Function( _SinCobertura value)  sinCobertura,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Procesando():
return procesando(_that);case _CambioExitoso():
return cambioExitoso(_that);case _SinCobertura():
return sinCobertura(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Procesando value)?  procesando,TResult? Function( _CambioExitoso value)?  cambioExitoso,TResult? Function( _SinCobertura value)?  sinCobertura,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Procesando() when procesando != null:
return procesando(_that);case _CambioExitoso() when cambioExitoso != null:
return cambioExitoso(_that);case _SinCobertura() when sinCobertura != null:
return sinCobertura(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  procesando,TResult Function( Sucursal nuevaSucursal,  bool fueAutomatico)?  cambioExitoso,TResult Function( Direccion direccion)?  sinCobertura,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Procesando() when procesando != null:
return procesando();case _CambioExitoso() when cambioExitoso != null:
return cambioExitoso(_that.nuevaSucursal,_that.fueAutomatico);case _SinCobertura() when sinCobertura != null:
return sinCobertura(_that.direccion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  procesando,required TResult Function( Sucursal nuevaSucursal,  bool fueAutomatico)  cambioExitoso,required TResult Function( Direccion direccion)  sinCobertura,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Procesando():
return procesando();case _CambioExitoso():
return cambioExitoso(_that.nuevaSucursal,_that.fueAutomatico);case _SinCobertura():
return sinCobertura(_that.direccion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  procesando,TResult? Function( Sucursal nuevaSucursal,  bool fueAutomatico)?  cambioExitoso,TResult? Function( Direccion direccion)?  sinCobertura,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Procesando() when procesando != null:
return procesando();case _CambioExitoso() when cambioExitoso != null:
return cambioExitoso(_that.nuevaSucursal,_that.fueAutomatico);case _SinCobertura() when sinCobertura != null:
return sinCobertura(_that.direccion);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements CoordinadorClienteState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoordinadorClienteState.idle()';
}


}




/// @nodoc


class _Procesando implements CoordinadorClienteState {
  const _Procesando();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Procesando);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CoordinadorClienteState.procesando()';
}


}




/// @nodoc


class _CambioExitoso implements CoordinadorClienteState {
  const _CambioExitoso(this.nuevaSucursal, this.fueAutomatico);
  

 final  Sucursal nuevaSucursal;
 final  bool fueAutomatico;

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CambioExitosoCopyWith<_CambioExitoso> get copyWith => __$CambioExitosoCopyWithImpl<_CambioExitoso>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CambioExitoso&&(identical(other.nuevaSucursal, nuevaSucursal) || other.nuevaSucursal == nuevaSucursal)&&(identical(other.fueAutomatico, fueAutomatico) || other.fueAutomatico == fueAutomatico));
}


@override
int get hashCode => Object.hash(runtimeType,nuevaSucursal,fueAutomatico);

@override
String toString() {
  return 'CoordinadorClienteState.cambioExitoso(nuevaSucursal: $nuevaSucursal, fueAutomatico: $fueAutomatico)';
}


}

/// @nodoc
abstract mixin class _$CambioExitosoCopyWith<$Res> implements $CoordinadorClienteStateCopyWith<$Res> {
  factory _$CambioExitosoCopyWith(_CambioExitoso value, $Res Function(_CambioExitoso) _then) = __$CambioExitosoCopyWithImpl;
@useResult
$Res call({
 Sucursal nuevaSucursal, bool fueAutomatico
});


$SucursalCopyWith<$Res> get nuevaSucursal;

}
/// @nodoc
class __$CambioExitosoCopyWithImpl<$Res>
    implements _$CambioExitosoCopyWith<$Res> {
  __$CambioExitosoCopyWithImpl(this._self, this._then);

  final _CambioExitoso _self;
  final $Res Function(_CambioExitoso) _then;

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nuevaSucursal = null,Object? fueAutomatico = null,}) {
  return _then(_CambioExitoso(
null == nuevaSucursal ? _self.nuevaSucursal : nuevaSucursal // ignore: cast_nullable_to_non_nullable
as Sucursal,null == fueAutomatico ? _self.fueAutomatico : fueAutomatico // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SucursalCopyWith<$Res> get nuevaSucursal {
  
  return $SucursalCopyWith<$Res>(_self.nuevaSucursal, (value) {
    return _then(_self.copyWith(nuevaSucursal: value));
  });
}
}

/// @nodoc


class _SinCobertura implements CoordinadorClienteState {
  const _SinCobertura(this.direccion);
  

 final  Direccion direccion;

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SinCoberturaCopyWith<_SinCobertura> get copyWith => __$SinCoberturaCopyWithImpl<_SinCobertura>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SinCobertura&&(identical(other.direccion, direccion) || other.direccion == direccion));
}


@override
int get hashCode => Object.hash(runtimeType,direccion);

@override
String toString() {
  return 'CoordinadorClienteState.sinCobertura(direccion: $direccion)';
}


}

/// @nodoc
abstract mixin class _$SinCoberturaCopyWith<$Res> implements $CoordinadorClienteStateCopyWith<$Res> {
  factory _$SinCoberturaCopyWith(_SinCobertura value, $Res Function(_SinCobertura) _then) = __$SinCoberturaCopyWithImpl;
@useResult
$Res call({
 Direccion direccion
});


$DireccionCopyWith<$Res> get direccion;

}
/// @nodoc
class __$SinCoberturaCopyWithImpl<$Res>
    implements _$SinCoberturaCopyWith<$Res> {
  __$SinCoberturaCopyWithImpl(this._self, this._then);

  final _SinCobertura _self;
  final $Res Function(_SinCobertura) _then;

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? direccion = null,}) {
  return _then(_SinCobertura(
null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as Direccion,
  ));
}

/// Create a copy of CoordinadorClienteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DireccionCopyWith<$Res> get direccion {
  
  return $DireccionCopyWith<$Res>(_self.direccion, (value) {
    return _then(_self.copyWith(direccion: value));
  });
}
}

// dart format on
