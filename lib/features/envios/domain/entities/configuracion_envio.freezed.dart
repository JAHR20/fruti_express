// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuracion_envio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfiguracionEnvio {

 String get id; String get sucursalId; EstrategiaEnvio get estrategia; double get radioMaximoKm; List<String> get codigosPostalesPermitidos; bool get requerirValidacionCP; double? get montoMinimoEnvioGratis; bool get activa; DateTime get fechaCreacion;
/// Create a copy of ConfiguracionEnvio
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfiguracionEnvioCopyWith<ConfiguracionEnvio> get copyWith => _$ConfiguracionEnvioCopyWithImpl<ConfiguracionEnvio>(this as ConfiguracionEnvio, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfiguracionEnvio&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.estrategia, estrategia) || other.estrategia == estrategia)&&(identical(other.radioMaximoKm, radioMaximoKm) || other.radioMaximoKm == radioMaximoKm)&&const DeepCollectionEquality().equals(other.codigosPostalesPermitidos, codigosPostalesPermitidos)&&(identical(other.requerirValidacionCP, requerirValidacionCP) || other.requerirValidacionCP == requerirValidacionCP)&&(identical(other.montoMinimoEnvioGratis, montoMinimoEnvioGratis) || other.montoMinimoEnvioGratis == montoMinimoEnvioGratis)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,estrategia,radioMaximoKm,const DeepCollectionEquality().hash(codigosPostalesPermitidos),requerirValidacionCP,montoMinimoEnvioGratis,activa,fechaCreacion);

@override
String toString() {
  return 'ConfiguracionEnvio(id: $id, sucursalId: $sucursalId, estrategia: $estrategia, radioMaximoKm: $radioMaximoKm, codigosPostalesPermitidos: $codigosPostalesPermitidos, requerirValidacionCP: $requerirValidacionCP, montoMinimoEnvioGratis: $montoMinimoEnvioGratis, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $ConfiguracionEnvioCopyWith<$Res>  {
  factory $ConfiguracionEnvioCopyWith(ConfiguracionEnvio value, $Res Function(ConfiguracionEnvio) _then) = _$ConfiguracionEnvioCopyWithImpl;
@useResult
$Res call({
 String id, String sucursalId, EstrategiaEnvio estrategia, double radioMaximoKm, List<String> codigosPostalesPermitidos, bool requerirValidacionCP, double? montoMinimoEnvioGratis, bool activa, DateTime fechaCreacion
});




}
/// @nodoc
class _$ConfiguracionEnvioCopyWithImpl<$Res>
    implements $ConfiguracionEnvioCopyWith<$Res> {
  _$ConfiguracionEnvioCopyWithImpl(this._self, this._then);

  final ConfiguracionEnvio _self;
  final $Res Function(ConfiguracionEnvio) _then;

/// Create a copy of ConfiguracionEnvio
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sucursalId = null,Object? estrategia = null,Object? radioMaximoKm = null,Object? codigosPostalesPermitidos = null,Object? requerirValidacionCP = null,Object? montoMinimoEnvioGratis = freezed,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,estrategia: null == estrategia ? _self.estrategia : estrategia // ignore: cast_nullable_to_non_nullable
as EstrategiaEnvio,radioMaximoKm: null == radioMaximoKm ? _self.radioMaximoKm : radioMaximoKm // ignore: cast_nullable_to_non_nullable
as double,codigosPostalesPermitidos: null == codigosPostalesPermitidos ? _self.codigosPostalesPermitidos : codigosPostalesPermitidos // ignore: cast_nullable_to_non_nullable
as List<String>,requerirValidacionCP: null == requerirValidacionCP ? _self.requerirValidacionCP : requerirValidacionCP // ignore: cast_nullable_to_non_nullable
as bool,montoMinimoEnvioGratis: freezed == montoMinimoEnvioGratis ? _self.montoMinimoEnvioGratis : montoMinimoEnvioGratis // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfiguracionEnvio].
extension ConfiguracionEnvioPatterns on ConfiguracionEnvio {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfiguracionEnvio value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfiguracionEnvio() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfiguracionEnvio value)  $default,){
final _that = this;
switch (_that) {
case _ConfiguracionEnvio():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfiguracionEnvio value)?  $default,){
final _that = this;
switch (_that) {
case _ConfiguracionEnvio() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sucursalId,  EstrategiaEnvio estrategia,  double radioMaximoKm,  List<String> codigosPostalesPermitidos,  bool requerirValidacionCP,  double? montoMinimoEnvioGratis,  bool activa,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfiguracionEnvio() when $default != null:
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sucursalId,  EstrategiaEnvio estrategia,  double radioMaximoKm,  List<String> codigosPostalesPermitidos,  bool requerirValidacionCP,  double? montoMinimoEnvioGratis,  bool activa,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _ConfiguracionEnvio():
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sucursalId,  EstrategiaEnvio estrategia,  double radioMaximoKm,  List<String> codigosPostalesPermitidos,  bool requerirValidacionCP,  double? montoMinimoEnvioGratis,  bool activa,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _ConfiguracionEnvio() when $default != null:
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc


class _ConfiguracionEnvio implements ConfiguracionEnvio {
  const _ConfiguracionEnvio({required this.id, required this.sucursalId, required this.estrategia, required this.radioMaximoKm, final  List<String> codigosPostalesPermitidos = const [], this.requerirValidacionCP = false, this.montoMinimoEnvioGratis, this.activa = true, required this.fechaCreacion}): _codigosPostalesPermitidos = codigosPostalesPermitidos;
  

@override final  String id;
@override final  String sucursalId;
@override final  EstrategiaEnvio estrategia;
@override final  double radioMaximoKm;
 final  List<String> _codigosPostalesPermitidos;
@override@JsonKey() List<String> get codigosPostalesPermitidos {
  if (_codigosPostalesPermitidos is EqualUnmodifiableListView) return _codigosPostalesPermitidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codigosPostalesPermitidos);
}

@override@JsonKey() final  bool requerirValidacionCP;
@override final  double? montoMinimoEnvioGratis;
@override@JsonKey() final  bool activa;
@override final  DateTime fechaCreacion;

/// Create a copy of ConfiguracionEnvio
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfiguracionEnvioCopyWith<_ConfiguracionEnvio> get copyWith => __$ConfiguracionEnvioCopyWithImpl<_ConfiguracionEnvio>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfiguracionEnvio&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.estrategia, estrategia) || other.estrategia == estrategia)&&(identical(other.radioMaximoKm, radioMaximoKm) || other.radioMaximoKm == radioMaximoKm)&&const DeepCollectionEquality().equals(other._codigosPostalesPermitidos, _codigosPostalesPermitidos)&&(identical(other.requerirValidacionCP, requerirValidacionCP) || other.requerirValidacionCP == requerirValidacionCP)&&(identical(other.montoMinimoEnvioGratis, montoMinimoEnvioGratis) || other.montoMinimoEnvioGratis == montoMinimoEnvioGratis)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,estrategia,radioMaximoKm,const DeepCollectionEquality().hash(_codigosPostalesPermitidos),requerirValidacionCP,montoMinimoEnvioGratis,activa,fechaCreacion);

@override
String toString() {
  return 'ConfiguracionEnvio(id: $id, sucursalId: $sucursalId, estrategia: $estrategia, radioMaximoKm: $radioMaximoKm, codigosPostalesPermitidos: $codigosPostalesPermitidos, requerirValidacionCP: $requerirValidacionCP, montoMinimoEnvioGratis: $montoMinimoEnvioGratis, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$ConfiguracionEnvioCopyWith<$Res> implements $ConfiguracionEnvioCopyWith<$Res> {
  factory _$ConfiguracionEnvioCopyWith(_ConfiguracionEnvio value, $Res Function(_ConfiguracionEnvio) _then) = __$ConfiguracionEnvioCopyWithImpl;
@override @useResult
$Res call({
 String id, String sucursalId, EstrategiaEnvio estrategia, double radioMaximoKm, List<String> codigosPostalesPermitidos, bool requerirValidacionCP, double? montoMinimoEnvioGratis, bool activa, DateTime fechaCreacion
});




}
/// @nodoc
class __$ConfiguracionEnvioCopyWithImpl<$Res>
    implements _$ConfiguracionEnvioCopyWith<$Res> {
  __$ConfiguracionEnvioCopyWithImpl(this._self, this._then);

  final _ConfiguracionEnvio _self;
  final $Res Function(_ConfiguracionEnvio) _then;

/// Create a copy of ConfiguracionEnvio
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sucursalId = null,Object? estrategia = null,Object? radioMaximoKm = null,Object? codigosPostalesPermitidos = null,Object? requerirValidacionCP = null,Object? montoMinimoEnvioGratis = freezed,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_ConfiguracionEnvio(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,estrategia: null == estrategia ? _self.estrategia : estrategia // ignore: cast_nullable_to_non_nullable
as EstrategiaEnvio,radioMaximoKm: null == radioMaximoKm ? _self.radioMaximoKm : radioMaximoKm // ignore: cast_nullable_to_non_nullable
as double,codigosPostalesPermitidos: null == codigosPostalesPermitidos ? _self._codigosPostalesPermitidos : codigosPostalesPermitidos // ignore: cast_nullable_to_non_nullable
as List<String>,requerirValidacionCP: null == requerirValidacionCP ? _self.requerirValidacionCP : requerirValidacionCP // ignore: cast_nullable_to_non_nullable
as bool,montoMinimoEnvioGratis: freezed == montoMinimoEnvioGratis ? _self.montoMinimoEnvioGratis : montoMinimoEnvioGratis // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
