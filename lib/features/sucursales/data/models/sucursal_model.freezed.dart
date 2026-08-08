// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sucursal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SucursalModel {

 String get id; String get nombre; String get calle;@JsonKey(name: 'numero_exterior') String get numeroExterior;@JsonKey(name: 'codigo_postal') String get codigoPostal; String get colonia; String get municipio; String get estado; double? get latitud; double? get longitud;@JsonKey(name: 'is_active') bool get activa;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;@JsonKey(name: 'fecha_actualizacion') DateTime? get fechaActualizacion;
/// Create a copy of SucursalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalModelCopyWith<SucursalModel> get copyWith => _$SucursalModelCopyWithImpl<SucursalModel>(this as SucursalModel, _$identity);

  /// Serializes this SucursalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numeroExterior, numeroExterior) || other.numeroExterior == numeroExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,calle,numeroExterior,codigoPostal,colonia,municipio,estado,latitud,longitud,activa,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'SucursalModel(id: $id, nombre: $nombre, calle: $calle, numeroExterior: $numeroExterior, codigoPostal: $codigoPostal, colonia: $colonia, municipio: $municipio, estado: $estado, latitud: $latitud, longitud: $longitud, activa: $activa, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $SucursalModelCopyWith<$Res>  {
  factory $SucursalModelCopyWith(SucursalModel value, $Res Function(SucursalModel) _then) = _$SucursalModelCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String calle,@JsonKey(name: 'numero_exterior') String numeroExterior,@JsonKey(name: 'codigo_postal') String codigoPostal, String colonia, String municipio, String estado, double? latitud, double? longitud,@JsonKey(name: 'is_active') bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion
});




}
/// @nodoc
class _$SucursalModelCopyWithImpl<$Res>
    implements $SucursalModelCopyWith<$Res> {
  _$SucursalModelCopyWithImpl(this._self, this._then);

  final SucursalModel _self;
  final $Res Function(SucursalModel) _then;

/// Create a copy of SucursalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? calle = null,Object? numeroExterior = null,Object? codigoPostal = null,Object? colonia = null,Object? municipio = null,Object? estado = null,Object? latitud = freezed,Object? longitud = freezed,Object? activa = null,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numeroExterior: null == numeroExterior ? _self.numeroExterior : numeroExterior // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [SucursalModel].
extension SucursalModelPatterns on SucursalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SucursalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SucursalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SucursalModel value)  $default,){
final _that = this;
switch (_that) {
case _SucursalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SucursalModel value)?  $default,){
final _that = this;
switch (_that) {
case _SucursalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String calle, @JsonKey(name: 'numero_exterior')  String numeroExterior, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SucursalModel() when $default != null:
return $default(_that.id,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String calle, @JsonKey(name: 'numero_exterior')  String numeroExterior, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _SucursalModel():
return $default(_that.id,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String calle, @JsonKey(name: 'numero_exterior')  String numeroExterior, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String colonia,  String municipio,  String estado,  double? latitud,  double? longitud, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _SucursalModel() when $default != null:
return $default(_that.id,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.municipio,_that.estado,_that.latitud,_that.longitud,_that.activa,_that.fechaCreacion,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SucursalModel implements SucursalModel {
  const _SucursalModel({required this.id, required this.nombre, required this.calle, @JsonKey(name: 'numero_exterior') required this.numeroExterior, @JsonKey(name: 'codigo_postal') required this.codigoPostal, required this.colonia, required this.municipio, required this.estado, this.latitud, this.longitud, @JsonKey(name: 'is_active') required this.activa, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'fecha_actualizacion') this.fechaActualizacion});
  factory _SucursalModel.fromJson(Map<String, dynamic> json) => _$SucursalModelFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String calle;
@override@JsonKey(name: 'numero_exterior') final  String numeroExterior;
@override@JsonKey(name: 'codigo_postal') final  String codigoPostal;
@override final  String colonia;
@override final  String municipio;
@override final  String estado;
@override final  double? latitud;
@override final  double? longitud;
@override@JsonKey(name: 'is_active') final  bool activa;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;
@override@JsonKey(name: 'fecha_actualizacion') final  DateTime? fechaActualizacion;

/// Create a copy of SucursalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SucursalModelCopyWith<_SucursalModel> get copyWith => __$SucursalModelCopyWithImpl<_SucursalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SucursalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SucursalModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numeroExterior, numeroExterior) || other.numeroExterior == numeroExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,calle,numeroExterior,codigoPostal,colonia,municipio,estado,latitud,longitud,activa,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'SucursalModel(id: $id, nombre: $nombre, calle: $calle, numeroExterior: $numeroExterior, codigoPostal: $codigoPostal, colonia: $colonia, municipio: $municipio, estado: $estado, latitud: $latitud, longitud: $longitud, activa: $activa, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$SucursalModelCopyWith<$Res> implements $SucursalModelCopyWith<$Res> {
  factory _$SucursalModelCopyWith(_SucursalModel value, $Res Function(_SucursalModel) _then) = __$SucursalModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String calle,@JsonKey(name: 'numero_exterior') String numeroExterior,@JsonKey(name: 'codigo_postal') String codigoPostal, String colonia, String municipio, String estado, double? latitud, double? longitud,@JsonKey(name: 'is_active') bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion
});




}
/// @nodoc
class __$SucursalModelCopyWithImpl<$Res>
    implements _$SucursalModelCopyWith<$Res> {
  __$SucursalModelCopyWithImpl(this._self, this._then);

  final _SucursalModel _self;
  final $Res Function(_SucursalModel) _then;

/// Create a copy of SucursalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? calle = null,Object? numeroExterior = null,Object? codigoPostal = null,Object? colonia = null,Object? municipio = null,Object? estado = null,Object? latitud = freezed,Object? longitud = freezed,Object? activa = null,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_SucursalModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numeroExterior: null == numeroExterior ? _self.numeroExterior : numeroExterior // ignore: cast_nullable_to_non_nullable
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
