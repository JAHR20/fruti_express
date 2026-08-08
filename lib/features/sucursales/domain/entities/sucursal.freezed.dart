// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sucursal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sucursal {

 String get id; String get nombre; String get calle; String get numExterior; String get codigoPostal; String get colonia; String get municipio; String get estado; double? get latitud; double? get longitud; bool get activa; DateTime get fechaCreacion; DateTime? get fechaActualizacion;
/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalCopyWith<Sucursal> get copyWith => _$SucursalCopyWithImpl<Sucursal>(this as Sucursal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sucursal&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExterior, numExterior) || other.numExterior == numExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,calle,numExterior,codigoPostal,colonia,municipio,estado,latitud,longitud,activa,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'Sucursal(id: $id, nombre: $nombre, calle: $calle, numExterior: $numExterior, codigoPostal: $codigoPostal, colonia: $colonia, municipio: $municipio, estado: $estado, latitud: $latitud, longitud: $longitud, activa: $activa, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $SucursalCopyWith<$Res>  {
  factory $SucursalCopyWith(Sucursal value, $Res Function(Sucursal) _then) = _$SucursalCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String calle, String numExterior, String codigoPostal, String colonia, String municipio, String estado, double? latitud, double? longitud, bool activa, DateTime fechaCreacion, DateTime? fechaActualizacion
});




}
/// @nodoc
class _$SucursalCopyWithImpl<$Res>
    implements $SucursalCopyWith<$Res> {
  _$SucursalCopyWithImpl(this._self, this._then);

  final Sucursal _self;
  final $Res Function(Sucursal) _then;

/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? calle = null,Object? numExterior = null,Object? codigoPostal = null,Object? colonia = null,Object? municipio = null,Object? estado = null,Object? latitud = freezed,Object? longitud = freezed,Object? activa = null,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExterior: null == numExterior ? _self.numExterior : numExterior // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaActualizacion: freezed == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sucursal].
extension SucursalPatterns on Sucursal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sucursal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sucursal value)  $default,){
final _that = this;
switch (_that) {
case _Sucursal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sucursal value)?  $default,){
final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String calle,  String numExterior,  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud,  bool activa,  DateTime fechaCreacion,  DateTime? fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
return $default(_that.id,_that.nombre,_that.calle,_that.numExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String calle,  String numExterior,  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud,  bool activa,  DateTime fechaCreacion,  DateTime? fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _Sucursal():
return $default(_that.id,_that.nombre,_that.calle,_that.numExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String calle,  String numExterior,  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud,  bool activa,  DateTime fechaCreacion,  DateTime? fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
return $default(_that.id,_that.nombre,_that.calle,_that.numExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc


class _Sucursal implements Sucursal {
  const _Sucursal({required this.id, required this.nombre, required this.calle, required this.numExterior, required this.codigoPostal, required this.colonia, required this.municipio, required this.estado, this.latitud, this.longitud, required this.activa, required this.fechaCreacion, this.fechaActualizacion});
  

@override final  String id;
@override final  String nombre;
@override final  String calle;
@override final  String numExterior;
@override final  String codigoPostal;
@override final  String colonia;
@override final  String municipio;
@override final  String estado;
@override final  double? latitud;
@override final  double? longitud;
@override final  bool activa;
@override final  DateTime fechaCreacion;
@override final  DateTime? fechaActualizacion;

/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SucursalCopyWith<_Sucursal> get copyWith => __$SucursalCopyWithImpl<_Sucursal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sucursal&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExterior, numExterior) || other.numExterior == numExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,calle,numExterior,codigoPostal,colonia,municipio,estado,latitud,longitud,activa,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'Sucursal(id: $id, nombre: $nombre, calle: $calle, numExterior: $numExterior, codigoPostal: $codigoPostal, colonia: $colonia, municipio: $municipio, estado: $estado, latitud: $latitud, longitud: $longitud, activa: $activa, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$SucursalCopyWith<$Res> implements $SucursalCopyWith<$Res> {
  factory _$SucursalCopyWith(_Sucursal value, $Res Function(_Sucursal) _then) = __$SucursalCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String calle, String numExterior, String codigoPostal, String colonia, String municipio, String estado, double? latitud, double? longitud, bool activa, DateTime fechaCreacion, DateTime? fechaActualizacion
});




}
/// @nodoc
class __$SucursalCopyWithImpl<$Res>
    implements _$SucursalCopyWith<$Res> {
  __$SucursalCopyWithImpl(this._self, this._then);

  final _Sucursal _self;
  final $Res Function(_Sucursal) _then;

/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? calle = null,Object? numExterior = null,Object? codigoPostal = null,Object? colonia = null,Object? municipio = null,Object? estado = null,Object? latitud = freezed,Object? longitud = freezed,Object? activa = null,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_Sucursal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExterior: null == numExterior ? _self.numExterior : numExterior // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaActualizacion: freezed == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
