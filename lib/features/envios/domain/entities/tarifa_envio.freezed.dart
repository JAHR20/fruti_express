// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarifa_envio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TarifaEnvio {

 String get id; String get sucursalId; String get nombre;// "Zona Local", "Zona Centro"
 double get distanciaMinKm;// desde (inclusive)
 double get distanciaMaxKm;// hasta (inclusive)
 int get costo;// en pesos enteros (0 = gratis)
 bool get activa; DateTime get fechaCreacion;
/// Create a copy of TarifaEnvio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TarifaEnvioCopyWith<TarifaEnvio> get copyWith => _$TarifaEnvioCopyWithImpl<TarifaEnvio>(this as TarifaEnvio, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TarifaEnvio&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.distanciaMinKm, distanciaMinKm) || other.distanciaMinKm == distanciaMinKm)&&(identical(other.distanciaMaxKm, distanciaMaxKm) || other.distanciaMaxKm == distanciaMaxKm)&&(identical(other.costo, costo) || other.costo == costo)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,nombre,distanciaMinKm,distanciaMaxKm,costo,activa,fechaCreacion);

@override
String toString() {
  return 'TarifaEnvio(id: $id, sucursalId: $sucursalId, nombre: $nombre, distanciaMinKm: $distanciaMinKm, distanciaMaxKm: $distanciaMaxKm, costo: $costo, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $TarifaEnvioCopyWith<$Res>  {
  factory $TarifaEnvioCopyWith(TarifaEnvio value, $Res Function(TarifaEnvio) _then) = _$TarifaEnvioCopyWithImpl;
@useResult
$Res call({
 String id, String sucursalId, String nombre, double distanciaMinKm, double distanciaMaxKm, int costo, bool activa, DateTime fechaCreacion
});




}
/// @nodoc
class _$TarifaEnvioCopyWithImpl<$Res>
    implements $TarifaEnvioCopyWith<$Res> {
  _$TarifaEnvioCopyWithImpl(this._self, this._then);

  final TarifaEnvio _self;
  final $Res Function(TarifaEnvio) _then;

/// Create a copy of TarifaEnvio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sucursalId = null,Object? nombre = null,Object? distanciaMinKm = null,Object? distanciaMaxKm = null,Object? costo = null,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,distanciaMinKm: null == distanciaMinKm ? _self.distanciaMinKm : distanciaMinKm // ignore: cast_nullable_to_non_nullable
as double,distanciaMaxKm: null == distanciaMaxKm ? _self.distanciaMaxKm : distanciaMaxKm // ignore: cast_nullable_to_non_nullable
as double,costo: null == costo ? _self.costo : costo // ignore: cast_nullable_to_non_nullable
as int,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TarifaEnvio].
extension TarifaEnvioPatterns on TarifaEnvio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TarifaEnvio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TarifaEnvio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TarifaEnvio value)  $default,){
final _that = this;
switch (_that) {
case _TarifaEnvio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TarifaEnvio value)?  $default,){
final _that = this;
switch (_that) {
case _TarifaEnvio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sucursalId,  String nombre,  double distanciaMinKm,  double distanciaMaxKm,  int costo,  bool activa,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TarifaEnvio() when $default != null:
return $default(_that.id,_that.sucursalId,_that.nombre,_that.distanciaMinKm,_that.distanciaMaxKm,_that.costo,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sucursalId,  String nombre,  double distanciaMinKm,  double distanciaMaxKm,  int costo,  bool activa,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _TarifaEnvio():
return $default(_that.id,_that.sucursalId,_that.nombre,_that.distanciaMinKm,_that.distanciaMaxKm,_that.costo,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sucursalId,  String nombre,  double distanciaMinKm,  double distanciaMaxKm,  int costo,  bool activa,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _TarifaEnvio() when $default != null:
return $default(_that.id,_that.sucursalId,_that.nombre,_that.distanciaMinKm,_that.distanciaMaxKm,_that.costo,_that.activa,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc


class _TarifaEnvio implements TarifaEnvio {
  const _TarifaEnvio({required this.id, required this.sucursalId, required this.nombre, required this.distanciaMinKm, required this.distanciaMaxKm, required this.costo, required this.activa, required this.fechaCreacion});
  

@override final  String id;
@override final  String sucursalId;
@override final  String nombre;
// "Zona Local", "Zona Centro"
@override final  double distanciaMinKm;
// desde (inclusive)
@override final  double distanciaMaxKm;
// hasta (inclusive)
@override final  int costo;
// en pesos enteros (0 = gratis)
@override final  bool activa;
@override final  DateTime fechaCreacion;

/// Create a copy of TarifaEnvio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TarifaEnvioCopyWith<_TarifaEnvio> get copyWith => __$TarifaEnvioCopyWithImpl<_TarifaEnvio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TarifaEnvio&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.distanciaMinKm, distanciaMinKm) || other.distanciaMinKm == distanciaMinKm)&&(identical(other.distanciaMaxKm, distanciaMaxKm) || other.distanciaMaxKm == distanciaMaxKm)&&(identical(other.costo, costo) || other.costo == costo)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,nombre,distanciaMinKm,distanciaMaxKm,costo,activa,fechaCreacion);

@override
String toString() {
  return 'TarifaEnvio(id: $id, sucursalId: $sucursalId, nombre: $nombre, distanciaMinKm: $distanciaMinKm, distanciaMaxKm: $distanciaMaxKm, costo: $costo, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$TarifaEnvioCopyWith<$Res> implements $TarifaEnvioCopyWith<$Res> {
  factory _$TarifaEnvioCopyWith(_TarifaEnvio value, $Res Function(_TarifaEnvio) _then) = __$TarifaEnvioCopyWithImpl;
@override @useResult
$Res call({
 String id, String sucursalId, String nombre, double distanciaMinKm, double distanciaMaxKm, int costo, bool activa, DateTime fechaCreacion
});




}
/// @nodoc
class __$TarifaEnvioCopyWithImpl<$Res>
    implements _$TarifaEnvioCopyWith<$Res> {
  __$TarifaEnvioCopyWithImpl(this._self, this._then);

  final _TarifaEnvio _self;
  final $Res Function(_TarifaEnvio) _then;

/// Create a copy of TarifaEnvio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sucursalId = null,Object? nombre = null,Object? distanciaMinKm = null,Object? distanciaMaxKm = null,Object? costo = null,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_TarifaEnvio(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,distanciaMinKm: null == distanciaMinKm ? _self.distanciaMinKm : distanciaMinKm // ignore: cast_nullable_to_non_nullable
as double,distanciaMaxKm: null == distanciaMaxKm ? _self.distanciaMaxKm : distanciaMaxKm // ignore: cast_nullable_to_non_nullable
as double,costo: null == costo ? _self.costo : costo // ignore: cast_nullable_to_non_nullable
as int,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
