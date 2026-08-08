// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'envio_cliente_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnvioClienteState {

 bool get isLoading; List<ConfiguracionEnvio> get configuraciones;// 🌟 La lista completa
 String? get error;
/// Create a copy of EnvioClienteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvioClienteStateCopyWith<EnvioClienteState> get copyWith => _$EnvioClienteStateCopyWithImpl<EnvioClienteState>(this as EnvioClienteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnvioClienteState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.configuraciones, configuraciones)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(configuraciones),error);

@override
String toString() {
  return 'EnvioClienteState(isLoading: $isLoading, configuraciones: $configuraciones, error: $error)';
}


}

/// @nodoc
abstract mixin class $EnvioClienteStateCopyWith<$Res>  {
  factory $EnvioClienteStateCopyWith(EnvioClienteState value, $Res Function(EnvioClienteState) _then) = _$EnvioClienteStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<ConfiguracionEnvio> configuraciones, String? error
});




}
/// @nodoc
class _$EnvioClienteStateCopyWithImpl<$Res>
    implements $EnvioClienteStateCopyWith<$Res> {
  _$EnvioClienteStateCopyWithImpl(this._self, this._then);

  final EnvioClienteState _self;
  final $Res Function(EnvioClienteState) _then;

/// Create a copy of EnvioClienteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? configuraciones = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configuraciones: null == configuraciones ? _self.configuraciones : configuraciones // ignore: cast_nullable_to_non_nullable
as List<ConfiguracionEnvio>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnvioClienteState].
extension EnvioClienteStatePatterns on EnvioClienteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnvioClienteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnvioClienteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnvioClienteState value)  $default,){
final _that = this;
switch (_that) {
case _EnvioClienteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnvioClienteState value)?  $default,){
final _that = this;
switch (_that) {
case _EnvioClienteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<ConfiguracionEnvio> configuraciones,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnvioClienteState() when $default != null:
return $default(_that.isLoading,_that.configuraciones,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<ConfiguracionEnvio> configuraciones,  String? error)  $default,) {final _that = this;
switch (_that) {
case _EnvioClienteState():
return $default(_that.isLoading,_that.configuraciones,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<ConfiguracionEnvio> configuraciones,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _EnvioClienteState() when $default != null:
return $default(_that.isLoading,_that.configuraciones,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EnvioClienteState implements EnvioClienteState {
  const _EnvioClienteState({this.isLoading = false, final  List<ConfiguracionEnvio> configuraciones = const [], this.error}): _configuraciones = configuraciones;
  

@override@JsonKey() final  bool isLoading;
 final  List<ConfiguracionEnvio> _configuraciones;
@override@JsonKey() List<ConfiguracionEnvio> get configuraciones {
  if (_configuraciones is EqualUnmodifiableListView) return _configuraciones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configuraciones);
}

// 🌟 La lista completa
@override final  String? error;

/// Create a copy of EnvioClienteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvioClienteStateCopyWith<_EnvioClienteState> get copyWith => __$EnvioClienteStateCopyWithImpl<_EnvioClienteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnvioClienteState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._configuraciones, _configuraciones)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_configuraciones),error);

@override
String toString() {
  return 'EnvioClienteState(isLoading: $isLoading, configuraciones: $configuraciones, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EnvioClienteStateCopyWith<$Res> implements $EnvioClienteStateCopyWith<$Res> {
  factory _$EnvioClienteStateCopyWith(_EnvioClienteState value, $Res Function(_EnvioClienteState) _then) = __$EnvioClienteStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<ConfiguracionEnvio> configuraciones, String? error
});




}
/// @nodoc
class __$EnvioClienteStateCopyWithImpl<$Res>
    implements _$EnvioClienteStateCopyWith<$Res> {
  __$EnvioClienteStateCopyWithImpl(this._self, this._then);

  final _EnvioClienteState _self;
  final $Res Function(_EnvioClienteState) _then;

/// Create a copy of EnvioClienteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? configuraciones = null,Object? error = freezed,}) {
  return _then(_EnvioClienteState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configuraciones: null == configuraciones ? _self._configuraciones : configuraciones // ignore: cast_nullable_to_non_nullable
as List<ConfiguracionEnvio>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
