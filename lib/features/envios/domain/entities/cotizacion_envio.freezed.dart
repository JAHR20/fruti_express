// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cotizacion_envio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CotizacionEnvio {

 String get sucursalId; bool get disponible; double get distanciaKm; int get costoEnvio; MotivoNoDisponible? get motivo;
/// Create a copy of CotizacionEnvio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CotizacionEnvioCopyWith<CotizacionEnvio> get copyWith => _$CotizacionEnvioCopyWithImpl<CotizacionEnvio>(this as CotizacionEnvio, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CotizacionEnvio&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.disponible, disponible) || other.disponible == disponible)&&(identical(other.distanciaKm, distanciaKm) || other.distanciaKm == distanciaKm)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}


@override
int get hashCode => Object.hash(runtimeType,sucursalId,disponible,distanciaKm,costoEnvio,motivo);

@override
String toString() {
  return 'CotizacionEnvio(sucursalId: $sucursalId, disponible: $disponible, distanciaKm: $distanciaKm, costoEnvio: $costoEnvio, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class $CotizacionEnvioCopyWith<$Res>  {
  factory $CotizacionEnvioCopyWith(CotizacionEnvio value, $Res Function(CotizacionEnvio) _then) = _$CotizacionEnvioCopyWithImpl;
@useResult
$Res call({
 String sucursalId, bool disponible, double distanciaKm, int costoEnvio, MotivoNoDisponible? motivo
});




}
/// @nodoc
class _$CotizacionEnvioCopyWithImpl<$Res>
    implements $CotizacionEnvioCopyWith<$Res> {
  _$CotizacionEnvioCopyWithImpl(this._self, this._then);

  final CotizacionEnvio _self;
  final $Res Function(CotizacionEnvio) _then;

/// Create a copy of CotizacionEnvio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sucursalId = null,Object? disponible = null,Object? distanciaKm = null,Object? costoEnvio = null,Object? motivo = freezed,}) {
  return _then(_self.copyWith(
sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,disponible: null == disponible ? _self.disponible : disponible // ignore: cast_nullable_to_non_nullable
as bool,distanciaKm: null == distanciaKm ? _self.distanciaKm : distanciaKm // ignore: cast_nullable_to_non_nullable
as double,costoEnvio: null == costoEnvio ? _self.costoEnvio : costoEnvio // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoNoDisponible?,
  ));
}

}


/// Adds pattern-matching-related methods to [CotizacionEnvio].
extension CotizacionEnvioPatterns on CotizacionEnvio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CotizacionEnvio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CotizacionEnvio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CotizacionEnvio value)  $default,){
final _that = this;
switch (_that) {
case _CotizacionEnvio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CotizacionEnvio value)?  $default,){
final _that = this;
switch (_that) {
case _CotizacionEnvio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sucursalId,  bool disponible,  double distanciaKm,  int costoEnvio,  MotivoNoDisponible? motivo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CotizacionEnvio() when $default != null:
return $default(_that.sucursalId,_that.disponible,_that.distanciaKm,_that.costoEnvio,_that.motivo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sucursalId,  bool disponible,  double distanciaKm,  int costoEnvio,  MotivoNoDisponible? motivo)  $default,) {final _that = this;
switch (_that) {
case _CotizacionEnvio():
return $default(_that.sucursalId,_that.disponible,_that.distanciaKm,_that.costoEnvio,_that.motivo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sucursalId,  bool disponible,  double distanciaKm,  int costoEnvio,  MotivoNoDisponible? motivo)?  $default,) {final _that = this;
switch (_that) {
case _CotizacionEnvio() when $default != null:
return $default(_that.sucursalId,_that.disponible,_that.distanciaKm,_that.costoEnvio,_that.motivo);case _:
  return null;

}
}

}

/// @nodoc


class _CotizacionEnvio implements CotizacionEnvio {
  const _CotizacionEnvio({required this.sucursalId, required this.disponible, required this.distanciaKm, required this.costoEnvio, this.motivo});
  

@override final  String sucursalId;
@override final  bool disponible;
@override final  double distanciaKm;
@override final  int costoEnvio;
@override final  MotivoNoDisponible? motivo;

/// Create a copy of CotizacionEnvio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CotizacionEnvioCopyWith<_CotizacionEnvio> get copyWith => __$CotizacionEnvioCopyWithImpl<_CotizacionEnvio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CotizacionEnvio&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.disponible, disponible) || other.disponible == disponible)&&(identical(other.distanciaKm, distanciaKm) || other.distanciaKm == distanciaKm)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.motivo, motivo) || other.motivo == motivo));
}


@override
int get hashCode => Object.hash(runtimeType,sucursalId,disponible,distanciaKm,costoEnvio,motivo);

@override
String toString() {
  return 'CotizacionEnvio(sucursalId: $sucursalId, disponible: $disponible, distanciaKm: $distanciaKm, costoEnvio: $costoEnvio, motivo: $motivo)';
}


}

/// @nodoc
abstract mixin class _$CotizacionEnvioCopyWith<$Res> implements $CotizacionEnvioCopyWith<$Res> {
  factory _$CotizacionEnvioCopyWith(_CotizacionEnvio value, $Res Function(_CotizacionEnvio) _then) = __$CotizacionEnvioCopyWithImpl;
@override @useResult
$Res call({
 String sucursalId, bool disponible, double distanciaKm, int costoEnvio, MotivoNoDisponible? motivo
});




}
/// @nodoc
class __$CotizacionEnvioCopyWithImpl<$Res>
    implements _$CotizacionEnvioCopyWith<$Res> {
  __$CotizacionEnvioCopyWithImpl(this._self, this._then);

  final _CotizacionEnvio _self;
  final $Res Function(_CotizacionEnvio) _then;

/// Create a copy of CotizacionEnvio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sucursalId = null,Object? disponible = null,Object? distanciaKm = null,Object? costoEnvio = null,Object? motivo = freezed,}) {
  return _then(_CotizacionEnvio(
sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,disponible: null == disponible ? _self.disponible : disponible // ignore: cast_nullable_to_non_nullable
as bool,distanciaKm: null == distanciaKm ? _self.distanciaKm : distanciaKm // ignore: cast_nullable_to_non_nullable
as double,costoEnvio: null == costoEnvio ? _self.costoEnvio : costoEnvio // ignore: cast_nullable_to_non_nullable
as int,motivo: freezed == motivo ? _self.motivo : motivo // ignore: cast_nullable_to_non_nullable
as MotivoNoDisponible?,
  ));
}


}

// dart format on
