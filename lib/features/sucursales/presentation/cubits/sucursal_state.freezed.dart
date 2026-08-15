// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sucursal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SucursalState {

 List<Sucursal> get sucursales; bool get isLoading; String? get errorMessage; String? get sucursalProcesandoId; Set<String> get sucursalesConEnvioConfigurado;
/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalStateCopyWith<SucursalState> get copyWith => _$SucursalStateCopyWithImpl<SucursalState>(this as SucursalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalState&&const DeepCollectionEquality().equals(other.sucursales, sucursales)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.sucursalProcesandoId, sucursalProcesandoId) || other.sucursalProcesandoId == sucursalProcesandoId)&&const DeepCollectionEquality().equals(other.sucursalesConEnvioConfigurado, sucursalesConEnvioConfigurado));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sucursales),isLoading,errorMessage,sucursalProcesandoId,const DeepCollectionEquality().hash(sucursalesConEnvioConfigurado));

@override
String toString() {
  return 'SucursalState(sucursales: $sucursales, isLoading: $isLoading, errorMessage: $errorMessage, sucursalProcesandoId: $sucursalProcesandoId, sucursalesConEnvioConfigurado: $sucursalesConEnvioConfigurado)';
}


}

/// @nodoc
abstract mixin class $SucursalStateCopyWith<$Res>  {
  factory $SucursalStateCopyWith(SucursalState value, $Res Function(SucursalState) _then) = _$SucursalStateCopyWithImpl;
@useResult
$Res call({
 List<Sucursal> sucursales, bool isLoading, String? errorMessage, String? sucursalProcesandoId, Set<String> sucursalesConEnvioConfigurado
});




}
/// @nodoc
class _$SucursalStateCopyWithImpl<$Res>
    implements $SucursalStateCopyWith<$Res> {
  _$SucursalStateCopyWithImpl(this._self, this._then);

  final SucursalState _self;
  final $Res Function(SucursalState) _then;

/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sucursales = null,Object? isLoading = null,Object? errorMessage = freezed,Object? sucursalProcesandoId = freezed,Object? sucursalesConEnvioConfigurado = null,}) {
  return _then(_self.copyWith(
sucursales: null == sucursales ? _self.sucursales : sucursales // ignore: cast_nullable_to_non_nullable
as List<Sucursal>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,sucursalProcesandoId: freezed == sucursalProcesandoId ? _self.sucursalProcesandoId : sucursalProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,sucursalesConEnvioConfigurado: null == sucursalesConEnvioConfigurado ? _self.sucursalesConEnvioConfigurado : sucursalesConEnvioConfigurado // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SucursalState].
extension SucursalStatePatterns on SucursalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SucursalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SucursalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SucursalState value)  $default,){
final _that = this;
switch (_that) {
case _SucursalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SucursalState value)?  $default,){
final _that = this;
switch (_that) {
case _SucursalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sucursal> sucursales,  bool isLoading,  String? errorMessage,  String? sucursalProcesandoId,  Set<String> sucursalesConEnvioConfigurado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SucursalState() when $default != null:
return $default(_that.sucursales,_that.isLoading,_that.errorMessage,_that.sucursalProcesandoId,_that.sucursalesConEnvioConfigurado);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sucursal> sucursales,  bool isLoading,  String? errorMessage,  String? sucursalProcesandoId,  Set<String> sucursalesConEnvioConfigurado)  $default,) {final _that = this;
switch (_that) {
case _SucursalState():
return $default(_that.sucursales,_that.isLoading,_that.errorMessage,_that.sucursalProcesandoId,_that.sucursalesConEnvioConfigurado);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sucursal> sucursales,  bool isLoading,  String? errorMessage,  String? sucursalProcesandoId,  Set<String> sucursalesConEnvioConfigurado)?  $default,) {final _that = this;
switch (_that) {
case _SucursalState() when $default != null:
return $default(_that.sucursales,_that.isLoading,_that.errorMessage,_that.sucursalProcesandoId,_that.sucursalesConEnvioConfigurado);case _:
  return null;

}
}

}

/// @nodoc


class _SucursalState implements SucursalState {
  const _SucursalState({final  List<Sucursal> sucursales = const [], this.isLoading = false, this.errorMessage, this.sucursalProcesandoId, final  Set<String> sucursalesConEnvioConfigurado = const <String>{}}): _sucursales = sucursales,_sucursalesConEnvioConfigurado = sucursalesConEnvioConfigurado;
  

 final  List<Sucursal> _sucursales;
@override@JsonKey() List<Sucursal> get sucursales {
  if (_sucursales is EqualUnmodifiableListView) return _sucursales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sucursales);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? sucursalProcesandoId;
 final  Set<String> _sucursalesConEnvioConfigurado;
@override@JsonKey() Set<String> get sucursalesConEnvioConfigurado {
  if (_sucursalesConEnvioConfigurado is EqualUnmodifiableSetView) return _sucursalesConEnvioConfigurado;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_sucursalesConEnvioConfigurado);
}


/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SucursalStateCopyWith<_SucursalState> get copyWith => __$SucursalStateCopyWithImpl<_SucursalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SucursalState&&const DeepCollectionEquality().equals(other._sucursales, _sucursales)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.sucursalProcesandoId, sucursalProcesandoId) || other.sucursalProcesandoId == sucursalProcesandoId)&&const DeepCollectionEquality().equals(other._sucursalesConEnvioConfigurado, _sucursalesConEnvioConfigurado));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sucursales),isLoading,errorMessage,sucursalProcesandoId,const DeepCollectionEquality().hash(_sucursalesConEnvioConfigurado));

@override
String toString() {
  return 'SucursalState(sucursales: $sucursales, isLoading: $isLoading, errorMessage: $errorMessage, sucursalProcesandoId: $sucursalProcesandoId, sucursalesConEnvioConfigurado: $sucursalesConEnvioConfigurado)';
}


}

/// @nodoc
abstract mixin class _$SucursalStateCopyWith<$Res> implements $SucursalStateCopyWith<$Res> {
  factory _$SucursalStateCopyWith(_SucursalState value, $Res Function(_SucursalState) _then) = __$SucursalStateCopyWithImpl;
@override @useResult
$Res call({
 List<Sucursal> sucursales, bool isLoading, String? errorMessage, String? sucursalProcesandoId, Set<String> sucursalesConEnvioConfigurado
});




}
/// @nodoc
class __$SucursalStateCopyWithImpl<$Res>
    implements _$SucursalStateCopyWith<$Res> {
  __$SucursalStateCopyWithImpl(this._self, this._then);

  final _SucursalState _self;
  final $Res Function(_SucursalState) _then;

/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sucursales = null,Object? isLoading = null,Object? errorMessage = freezed,Object? sucursalProcesandoId = freezed,Object? sucursalesConEnvioConfigurado = null,}) {
  return _then(_SucursalState(
sucursales: null == sucursales ? _self._sucursales : sucursales // ignore: cast_nullable_to_non_nullable
as List<Sucursal>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,sucursalProcesandoId: freezed == sucursalProcesandoId ? _self.sucursalProcesandoId : sucursalProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,sucursalesConEnvioConfigurado: null == sucursalesConEnvioConfigurado ? _self._sucursalesConEnvioConfigurado : sucursalesConEnvioConfigurado // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
