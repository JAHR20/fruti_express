// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'envio_admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnvioAdminState {

 bool get isLoading; ConfiguracionEnvio? get configuracion; List<TarifaEnvio> get tarifas; double get radioTemporalKm; bool get requiereCPTemporal; double? get montoGratisTemporal; String? get error; String? get mensajeExito;// 🌟 NUEVO — para no tumbar toda la pantalla al editar UNA tarifa
 String? get tarifaProcesandoId;
/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnvioAdminStateCopyWith<EnvioAdminState> get copyWith => _$EnvioAdminStateCopyWithImpl<EnvioAdminState>(this as EnvioAdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnvioAdminState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.configuracion, configuracion) || other.configuracion == configuracion)&&const DeepCollectionEquality().equals(other.tarifas, tarifas)&&(identical(other.radioTemporalKm, radioTemporalKm) || other.radioTemporalKm == radioTemporalKm)&&(identical(other.requiereCPTemporal, requiereCPTemporal) || other.requiereCPTemporal == requiereCPTemporal)&&(identical(other.montoGratisTemporal, montoGratisTemporal) || other.montoGratisTemporal == montoGratisTemporal)&&(identical(other.error, error) || other.error == error)&&(identical(other.mensajeExito, mensajeExito) || other.mensajeExito == mensajeExito)&&(identical(other.tarifaProcesandoId, tarifaProcesandoId) || other.tarifaProcesandoId == tarifaProcesandoId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,configuracion,const DeepCollectionEquality().hash(tarifas),radioTemporalKm,requiereCPTemporal,montoGratisTemporal,error,mensajeExito,tarifaProcesandoId);

@override
String toString() {
  return 'EnvioAdminState(isLoading: $isLoading, configuracion: $configuracion, tarifas: $tarifas, radioTemporalKm: $radioTemporalKm, requiereCPTemporal: $requiereCPTemporal, montoGratisTemporal: $montoGratisTemporal, error: $error, mensajeExito: $mensajeExito, tarifaProcesandoId: $tarifaProcesandoId)';
}


}

/// @nodoc
abstract mixin class $EnvioAdminStateCopyWith<$Res>  {
  factory $EnvioAdminStateCopyWith(EnvioAdminState value, $Res Function(EnvioAdminState) _then) = _$EnvioAdminStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, ConfiguracionEnvio? configuracion, List<TarifaEnvio> tarifas, double radioTemporalKm, bool requiereCPTemporal, double? montoGratisTemporal, String? error, String? mensajeExito, String? tarifaProcesandoId
});


$ConfiguracionEnvioCopyWith<$Res>? get configuracion;

}
/// @nodoc
class _$EnvioAdminStateCopyWithImpl<$Res>
    implements $EnvioAdminStateCopyWith<$Res> {
  _$EnvioAdminStateCopyWithImpl(this._self, this._then);

  final EnvioAdminState _self;
  final $Res Function(EnvioAdminState) _then;

/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? configuracion = freezed,Object? tarifas = null,Object? radioTemporalKm = null,Object? requiereCPTemporal = null,Object? montoGratisTemporal = freezed,Object? error = freezed,Object? mensajeExito = freezed,Object? tarifaProcesandoId = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configuracion: freezed == configuracion ? _self.configuracion : configuracion // ignore: cast_nullable_to_non_nullable
as ConfiguracionEnvio?,tarifas: null == tarifas ? _self.tarifas : tarifas // ignore: cast_nullable_to_non_nullable
as List<TarifaEnvio>,radioTemporalKm: null == radioTemporalKm ? _self.radioTemporalKm : radioTemporalKm // ignore: cast_nullable_to_non_nullable
as double,requiereCPTemporal: null == requiereCPTemporal ? _self.requiereCPTemporal : requiereCPTemporal // ignore: cast_nullable_to_non_nullable
as bool,montoGratisTemporal: freezed == montoGratisTemporal ? _self.montoGratisTemporal : montoGratisTemporal // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,mensajeExito: freezed == mensajeExito ? _self.mensajeExito : mensajeExito // ignore: cast_nullable_to_non_nullable
as String?,tarifaProcesandoId: freezed == tarifaProcesandoId ? _self.tarifaProcesandoId : tarifaProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguracionEnvioCopyWith<$Res>? get configuracion {
    if (_self.configuracion == null) {
    return null;
  }

  return $ConfiguracionEnvioCopyWith<$Res>(_self.configuracion!, (value) {
    return _then(_self.copyWith(configuracion: value));
  });
}
}


/// Adds pattern-matching-related methods to [EnvioAdminState].
extension EnvioAdminStatePatterns on EnvioAdminState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnvioAdminState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnvioAdminState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnvioAdminState value)  $default,){
final _that = this;
switch (_that) {
case _EnvioAdminState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnvioAdminState value)?  $default,){
final _that = this;
switch (_that) {
case _EnvioAdminState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  ConfiguracionEnvio? configuracion,  List<TarifaEnvio> tarifas,  double radioTemporalKm,  bool requiereCPTemporal,  double? montoGratisTemporal,  String? error,  String? mensajeExito,  String? tarifaProcesandoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnvioAdminState() when $default != null:
return $default(_that.isLoading,_that.configuracion,_that.tarifas,_that.radioTemporalKm,_that.requiereCPTemporal,_that.montoGratisTemporal,_that.error,_that.mensajeExito,_that.tarifaProcesandoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  ConfiguracionEnvio? configuracion,  List<TarifaEnvio> tarifas,  double radioTemporalKm,  bool requiereCPTemporal,  double? montoGratisTemporal,  String? error,  String? mensajeExito,  String? tarifaProcesandoId)  $default,) {final _that = this;
switch (_that) {
case _EnvioAdminState():
return $default(_that.isLoading,_that.configuracion,_that.tarifas,_that.radioTemporalKm,_that.requiereCPTemporal,_that.montoGratisTemporal,_that.error,_that.mensajeExito,_that.tarifaProcesandoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  ConfiguracionEnvio? configuracion,  List<TarifaEnvio> tarifas,  double radioTemporalKm,  bool requiereCPTemporal,  double? montoGratisTemporal,  String? error,  String? mensajeExito,  String? tarifaProcesandoId)?  $default,) {final _that = this;
switch (_that) {
case _EnvioAdminState() when $default != null:
return $default(_that.isLoading,_that.configuracion,_that.tarifas,_that.radioTemporalKm,_that.requiereCPTemporal,_that.montoGratisTemporal,_that.error,_that.mensajeExito,_that.tarifaProcesandoId);case _:
  return null;

}
}

}

/// @nodoc


class _EnvioAdminState implements EnvioAdminState {
  const _EnvioAdminState({this.isLoading = false, this.configuracion, final  List<TarifaEnvio> tarifas = const <TarifaEnvio>[], this.radioTemporalKm = 5.0, this.requiereCPTemporal = false, this.montoGratisTemporal, this.error, this.mensajeExito, this.tarifaProcesandoId}): _tarifas = tarifas;
  

@override@JsonKey() final  bool isLoading;
@override final  ConfiguracionEnvio? configuracion;
 final  List<TarifaEnvio> _tarifas;
@override@JsonKey() List<TarifaEnvio> get tarifas {
  if (_tarifas is EqualUnmodifiableListView) return _tarifas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tarifas);
}

@override@JsonKey() final  double radioTemporalKm;
@override@JsonKey() final  bool requiereCPTemporal;
@override final  double? montoGratisTemporal;
@override final  String? error;
@override final  String? mensajeExito;
// 🌟 NUEVO — para no tumbar toda la pantalla al editar UNA tarifa
@override final  String? tarifaProcesandoId;

/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnvioAdminStateCopyWith<_EnvioAdminState> get copyWith => __$EnvioAdminStateCopyWithImpl<_EnvioAdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnvioAdminState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.configuracion, configuracion) || other.configuracion == configuracion)&&const DeepCollectionEquality().equals(other._tarifas, _tarifas)&&(identical(other.radioTemporalKm, radioTemporalKm) || other.radioTemporalKm == radioTemporalKm)&&(identical(other.requiereCPTemporal, requiereCPTemporal) || other.requiereCPTemporal == requiereCPTemporal)&&(identical(other.montoGratisTemporal, montoGratisTemporal) || other.montoGratisTemporal == montoGratisTemporal)&&(identical(other.error, error) || other.error == error)&&(identical(other.mensajeExito, mensajeExito) || other.mensajeExito == mensajeExito)&&(identical(other.tarifaProcesandoId, tarifaProcesandoId) || other.tarifaProcesandoId == tarifaProcesandoId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,configuracion,const DeepCollectionEquality().hash(_tarifas),radioTemporalKm,requiereCPTemporal,montoGratisTemporal,error,mensajeExito,tarifaProcesandoId);

@override
String toString() {
  return 'EnvioAdminState(isLoading: $isLoading, configuracion: $configuracion, tarifas: $tarifas, radioTemporalKm: $radioTemporalKm, requiereCPTemporal: $requiereCPTemporal, montoGratisTemporal: $montoGratisTemporal, error: $error, mensajeExito: $mensajeExito, tarifaProcesandoId: $tarifaProcesandoId)';
}


}

/// @nodoc
abstract mixin class _$EnvioAdminStateCopyWith<$Res> implements $EnvioAdminStateCopyWith<$Res> {
  factory _$EnvioAdminStateCopyWith(_EnvioAdminState value, $Res Function(_EnvioAdminState) _then) = __$EnvioAdminStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, ConfiguracionEnvio? configuracion, List<TarifaEnvio> tarifas, double radioTemporalKm, bool requiereCPTemporal, double? montoGratisTemporal, String? error, String? mensajeExito, String? tarifaProcesandoId
});


@override $ConfiguracionEnvioCopyWith<$Res>? get configuracion;

}
/// @nodoc
class __$EnvioAdminStateCopyWithImpl<$Res>
    implements _$EnvioAdminStateCopyWith<$Res> {
  __$EnvioAdminStateCopyWithImpl(this._self, this._then);

  final _EnvioAdminState _self;
  final $Res Function(_EnvioAdminState) _then;

/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? configuracion = freezed,Object? tarifas = null,Object? radioTemporalKm = null,Object? requiereCPTemporal = null,Object? montoGratisTemporal = freezed,Object? error = freezed,Object? mensajeExito = freezed,Object? tarifaProcesandoId = freezed,}) {
  return _then(_EnvioAdminState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configuracion: freezed == configuracion ? _self.configuracion : configuracion // ignore: cast_nullable_to_non_nullable
as ConfiguracionEnvio?,tarifas: null == tarifas ? _self._tarifas : tarifas // ignore: cast_nullable_to_non_nullable
as List<TarifaEnvio>,radioTemporalKm: null == radioTemporalKm ? _self.radioTemporalKm : radioTemporalKm // ignore: cast_nullable_to_non_nullable
as double,requiereCPTemporal: null == requiereCPTemporal ? _self.requiereCPTemporal : requiereCPTemporal // ignore: cast_nullable_to_non_nullable
as bool,montoGratisTemporal: freezed == montoGratisTemporal ? _self.montoGratisTemporal : montoGratisTemporal // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,mensajeExito: freezed == mensajeExito ? _self.mensajeExito : mensajeExito // ignore: cast_nullable_to_non_nullable
as String?,tarifaProcesandoId: freezed == tarifaProcesandoId ? _self.tarifaProcesandoId : tarifaProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of EnvioAdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguracionEnvioCopyWith<$Res>? get configuracion {
    if (_self.configuracion == null) {
    return null;
  }

  return $ConfiguracionEnvioCopyWith<$Res>(_self.configuracion!, (value) {
    return _then(_self.copyWith(configuracion: value));
  });
}
}

// dart format on
