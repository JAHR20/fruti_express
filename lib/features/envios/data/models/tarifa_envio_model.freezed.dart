// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarifa_envio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TarifaEnvioModel {

 String get id;@JsonKey(name: 'sucursal_id') String get sucursalId; String get nombre;@JsonKey(name: 'distancia_min_km') double get distanciaMinKm;@JsonKey(name: 'distancia_max_km') double get distanciaMaxKm; int get costo; bool get activa;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;
/// Create a copy of TarifaEnvioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TarifaEnvioModelCopyWith<TarifaEnvioModel> get copyWith => _$TarifaEnvioModelCopyWithImpl<TarifaEnvioModel>(this as TarifaEnvioModel, _$identity);

  /// Serializes this TarifaEnvioModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TarifaEnvioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.distanciaMinKm, distanciaMinKm) || other.distanciaMinKm == distanciaMinKm)&&(identical(other.distanciaMaxKm, distanciaMaxKm) || other.distanciaMaxKm == distanciaMaxKm)&&(identical(other.costo, costo) || other.costo == costo)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,nombre,distanciaMinKm,distanciaMaxKm,costo,activa,fechaCreacion);

@override
String toString() {
  return 'TarifaEnvioModel(id: $id, sucursalId: $sucursalId, nombre: $nombre, distanciaMinKm: $distanciaMinKm, distanciaMaxKm: $distanciaMaxKm, costo: $costo, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $TarifaEnvioModelCopyWith<$Res>  {
  factory $TarifaEnvioModelCopyWith(TarifaEnvioModel value, $Res Function(TarifaEnvioModel) _then) = _$TarifaEnvioModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'sucursal_id') String sucursalId, String nombre,@JsonKey(name: 'distancia_min_km') double distanciaMinKm,@JsonKey(name: 'distancia_max_km') double distanciaMaxKm, int costo, bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class _$TarifaEnvioModelCopyWithImpl<$Res>
    implements $TarifaEnvioModelCopyWith<$Res> {
  _$TarifaEnvioModelCopyWithImpl(this._self, this._then);

  final TarifaEnvioModel _self;
  final $Res Function(TarifaEnvioModel) _then;

/// Create a copy of TarifaEnvioModel
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


/// Adds pattern-matching-related methods to [TarifaEnvioModel].
extension TarifaEnvioModelPatterns on TarifaEnvioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TarifaEnvioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TarifaEnvioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TarifaEnvioModel value)  $default,){
final _that = this;
switch (_that) {
case _TarifaEnvioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TarifaEnvioModel value)?  $default,){
final _that = this;
switch (_that) {
case _TarifaEnvioModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  String nombre, @JsonKey(name: 'distancia_min_km')  double distanciaMinKm, @JsonKey(name: 'distancia_max_km')  double distanciaMaxKm,  int costo,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TarifaEnvioModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  String nombre, @JsonKey(name: 'distancia_min_km')  double distanciaMinKm, @JsonKey(name: 'distancia_max_km')  double distanciaMaxKm,  int costo,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _TarifaEnvioModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  String nombre, @JsonKey(name: 'distancia_min_km')  double distanciaMinKm, @JsonKey(name: 'distancia_max_km')  double distanciaMaxKm,  int costo,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _TarifaEnvioModel() when $default != null:
return $default(_that.id,_that.sucursalId,_that.nombre,_that.distanciaMinKm,_that.distanciaMaxKm,_that.costo,_that.activa,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TarifaEnvioModel extends TarifaEnvioModel {
  const _TarifaEnvioModel({required this.id, @JsonKey(name: 'sucursal_id') required this.sucursalId, required this.nombre, @JsonKey(name: 'distancia_min_km') required this.distanciaMinKm, @JsonKey(name: 'distancia_max_km') required this.distanciaMaxKm, required this.costo, required this.activa, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion}): super._();
  factory _TarifaEnvioModel.fromJson(Map<String, dynamic> json) => _$TarifaEnvioModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'sucursal_id') final  String sucursalId;
@override final  String nombre;
@override@JsonKey(name: 'distancia_min_km') final  double distanciaMinKm;
@override@JsonKey(name: 'distancia_max_km') final  double distanciaMaxKm;
@override final  int costo;
@override final  bool activa;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;

/// Create a copy of TarifaEnvioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TarifaEnvioModelCopyWith<_TarifaEnvioModel> get copyWith => __$TarifaEnvioModelCopyWithImpl<_TarifaEnvioModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TarifaEnvioModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TarifaEnvioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.distanciaMinKm, distanciaMinKm) || other.distanciaMinKm == distanciaMinKm)&&(identical(other.distanciaMaxKm, distanciaMaxKm) || other.distanciaMaxKm == distanciaMaxKm)&&(identical(other.costo, costo) || other.costo == costo)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,nombre,distanciaMinKm,distanciaMaxKm,costo,activa,fechaCreacion);

@override
String toString() {
  return 'TarifaEnvioModel(id: $id, sucursalId: $sucursalId, nombre: $nombre, distanciaMinKm: $distanciaMinKm, distanciaMaxKm: $distanciaMaxKm, costo: $costo, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$TarifaEnvioModelCopyWith<$Res> implements $TarifaEnvioModelCopyWith<$Res> {
  factory _$TarifaEnvioModelCopyWith(_TarifaEnvioModel value, $Res Function(_TarifaEnvioModel) _then) = __$TarifaEnvioModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'sucursal_id') String sucursalId, String nombre,@JsonKey(name: 'distancia_min_km') double distanciaMinKm,@JsonKey(name: 'distancia_max_km') double distanciaMaxKm, int costo, bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class __$TarifaEnvioModelCopyWithImpl<$Res>
    implements _$TarifaEnvioModelCopyWith<$Res> {
  __$TarifaEnvioModelCopyWithImpl(this._self, this._then);

  final _TarifaEnvioModel _self;
  final $Res Function(_TarifaEnvioModel) _then;

/// Create a copy of TarifaEnvioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sucursalId = null,Object? nombre = null,Object? distanciaMinKm = null,Object? distanciaMaxKm = null,Object? costo = null,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_TarifaEnvioModel(
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
