// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direcciones_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DireccionesState {

 List<Direccion> get direcciones; bool get isLoading;/// ID de la dirección que está siendo creada/actualizada/eliminada.
 String? get direccionProcesandoId;/// ID de la dirección que se está marcando como principal.
 String? get direccionPrincipalProcesandoId;/// Error al cargar la lista completa.
 String? get errorMessage;/// Error producido durante una operación puntual.
 String? get operacionError;/// Indica que una operación puntual terminó correctamente.
 bool get operacionExitosa;/// Usuario cuyas direcciones están actualmente cargadas.
 String? get usuarioId;
/// Create a copy of DireccionesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DireccionesStateCopyWith<DireccionesState> get copyWith => _$DireccionesStateCopyWithImpl<DireccionesState>(this as DireccionesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DireccionesState&&const DeepCollectionEquality().equals(other.direcciones, direcciones)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.direccionProcesandoId, direccionProcesandoId) || other.direccionProcesandoId == direccionProcesandoId)&&(identical(other.direccionPrincipalProcesandoId, direccionPrincipalProcesandoId) || other.direccionPrincipalProcesandoId == direccionPrincipalProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(direcciones),isLoading,direccionProcesandoId,direccionPrincipalProcesandoId,errorMessage,operacionError,operacionExitosa,usuarioId);

@override
String toString() {
  return 'DireccionesState(direcciones: $direcciones, isLoading: $isLoading, direccionProcesandoId: $direccionProcesandoId, direccionPrincipalProcesandoId: $direccionPrincipalProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa, usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class $DireccionesStateCopyWith<$Res>  {
  factory $DireccionesStateCopyWith(DireccionesState value, $Res Function(DireccionesState) _then) = _$DireccionesStateCopyWithImpl;
@useResult
$Res call({
 List<Direccion> direcciones, bool isLoading, String? direccionProcesandoId, String? direccionPrincipalProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa, String? usuarioId
});




}
/// @nodoc
class _$DireccionesStateCopyWithImpl<$Res>
    implements $DireccionesStateCopyWith<$Res> {
  _$DireccionesStateCopyWithImpl(this._self, this._then);

  final DireccionesState _self;
  final $Res Function(DireccionesState) _then;

/// Create a copy of DireccionesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? direcciones = null,Object? isLoading = null,Object? direccionProcesandoId = freezed,Object? direccionPrincipalProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,Object? usuarioId = freezed,}) {
  return _then(_self.copyWith(
direcciones: null == direcciones ? _self.direcciones : direcciones // ignore: cast_nullable_to_non_nullable
as List<Direccion>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,direccionProcesandoId: freezed == direccionProcesandoId ? _self.direccionProcesandoId : direccionProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,direccionPrincipalProcesandoId: freezed == direccionPrincipalProcesandoId ? _self.direccionPrincipalProcesandoId : direccionPrincipalProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,usuarioId: freezed == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DireccionesState].
extension DireccionesStatePatterns on DireccionesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DireccionesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DireccionesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DireccionesState value)  $default,){
final _that = this;
switch (_that) {
case _DireccionesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DireccionesState value)?  $default,){
final _that = this;
switch (_that) {
case _DireccionesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Direccion> direcciones,  bool isLoading,  String? direccionProcesandoId,  String? direccionPrincipalProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? usuarioId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DireccionesState() when $default != null:
return $default(_that.direcciones,_that.isLoading,_that.direccionProcesandoId,_that.direccionPrincipalProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.usuarioId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Direccion> direcciones,  bool isLoading,  String? direccionProcesandoId,  String? direccionPrincipalProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? usuarioId)  $default,) {final _that = this;
switch (_that) {
case _DireccionesState():
return $default(_that.direcciones,_that.isLoading,_that.direccionProcesandoId,_that.direccionPrincipalProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.usuarioId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Direccion> direcciones,  bool isLoading,  String? direccionProcesandoId,  String? direccionPrincipalProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? usuarioId)?  $default,) {final _that = this;
switch (_that) {
case _DireccionesState() when $default != null:
return $default(_that.direcciones,_that.isLoading,_that.direccionProcesandoId,_that.direccionPrincipalProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.usuarioId);case _:
  return null;

}
}

}

/// @nodoc


class _DireccionesState implements DireccionesState {
  const _DireccionesState({final  List<Direccion> direcciones = const <Direccion>[], this.isLoading = false, this.direccionProcesandoId, this.direccionPrincipalProcesandoId, this.errorMessage, this.operacionError, this.operacionExitosa = false, this.usuarioId}): _direcciones = direcciones;
  

 final  List<Direccion> _direcciones;
@override@JsonKey() List<Direccion> get direcciones {
  if (_direcciones is EqualUnmodifiableListView) return _direcciones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_direcciones);
}

@override@JsonKey() final  bool isLoading;
/// ID de la dirección que está siendo creada/actualizada/eliminada.
@override final  String? direccionProcesandoId;
/// ID de la dirección que se está marcando como principal.
@override final  String? direccionPrincipalProcesandoId;
/// Error al cargar la lista completa.
@override final  String? errorMessage;
/// Error producido durante una operación puntual.
@override final  String? operacionError;
/// Indica que una operación puntual terminó correctamente.
@override@JsonKey() final  bool operacionExitosa;
/// Usuario cuyas direcciones están actualmente cargadas.
@override final  String? usuarioId;

/// Create a copy of DireccionesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DireccionesStateCopyWith<_DireccionesState> get copyWith => __$DireccionesStateCopyWithImpl<_DireccionesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DireccionesState&&const DeepCollectionEquality().equals(other._direcciones, _direcciones)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.direccionProcesandoId, direccionProcesandoId) || other.direccionProcesandoId == direccionProcesandoId)&&(identical(other.direccionPrincipalProcesandoId, direccionPrincipalProcesandoId) || other.direccionPrincipalProcesandoId == direccionPrincipalProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_direcciones),isLoading,direccionProcesandoId,direccionPrincipalProcesandoId,errorMessage,operacionError,operacionExitosa,usuarioId);

@override
String toString() {
  return 'DireccionesState(direcciones: $direcciones, isLoading: $isLoading, direccionProcesandoId: $direccionProcesandoId, direccionPrincipalProcesandoId: $direccionPrincipalProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa, usuarioId: $usuarioId)';
}


}

/// @nodoc
abstract mixin class _$DireccionesStateCopyWith<$Res> implements $DireccionesStateCopyWith<$Res> {
  factory _$DireccionesStateCopyWith(_DireccionesState value, $Res Function(_DireccionesState) _then) = __$DireccionesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Direccion> direcciones, bool isLoading, String? direccionProcesandoId, String? direccionPrincipalProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa, String? usuarioId
});




}
/// @nodoc
class __$DireccionesStateCopyWithImpl<$Res>
    implements _$DireccionesStateCopyWith<$Res> {
  __$DireccionesStateCopyWithImpl(this._self, this._then);

  final _DireccionesState _self;
  final $Res Function(_DireccionesState) _then;

/// Create a copy of DireccionesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? direcciones = null,Object? isLoading = null,Object? direccionProcesandoId = freezed,Object? direccionPrincipalProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,Object? usuarioId = freezed,}) {
  return _then(_DireccionesState(
direcciones: null == direcciones ? _self._direcciones : direcciones // ignore: cast_nullable_to_non_nullable
as List<Direccion>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,direccionProcesandoId: freezed == direccionProcesandoId ? _self.direccionProcesandoId : direccionProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,direccionPrincipalProcesandoId: freezed == direccionPrincipalProcesandoId ? _self.direccionPrincipalProcesandoId : direccionPrincipalProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,usuarioId: freezed == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
