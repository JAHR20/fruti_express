// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direccion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DireccionModel {

 String get id;@JsonKey(name: 'usuario_id') String get usuarioId; String get alias; String get calle;@JsonKey(name: 'num_ext') String get numExt;@JsonKey(name: 'num_int') String? get numInt; String get colonia;@JsonKey(name: 'codigo_postal') String get codigoPostal; String get municipio; String get estado; String? get referencias;@JsonKey(name: 'es_principal') bool get esPrincipal;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;@JsonKey(name: 'updated_at') DateTime? get updatedAt; double get latitud; double get longitud;
/// Create a copy of DireccionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DireccionModelCopyWith<DireccionModel> get copyWith => _$DireccionModelCopyWithImpl<DireccionModel>(this as DireccionModel, _$identity);

  /// Serializes this DireccionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DireccionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExt, numExt) || other.numExt == numExt)&&(identical(other.numInt, numInt) || other.numInt == numInt)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.referencias, referencias) || other.referencias == referencias)&&(identical(other.esPrincipal, esPrincipal) || other.esPrincipal == esPrincipal)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuarioId,alias,calle,numExt,numInt,colonia,codigoPostal,municipio,estado,referencias,esPrincipal,fechaCreacion,updatedAt,latitud,longitud);

@override
String toString() {
  return 'DireccionModel(id: $id, usuarioId: $usuarioId, alias: $alias, calle: $calle, numExt: $numExt, numInt: $numInt, colonia: $colonia, codigoPostal: $codigoPostal, municipio: $municipio, estado: $estado, referencias: $referencias, esPrincipal: $esPrincipal, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, latitud: $latitud, longitud: $longitud)';
}


}

/// @nodoc
abstract mixin class $DireccionModelCopyWith<$Res>  {
  factory $DireccionModelCopyWith(DireccionModel value, $Res Function(DireccionModel) _then) = _$DireccionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'usuario_id') String usuarioId, String alias, String calle,@JsonKey(name: 'num_ext') String numExt,@JsonKey(name: 'num_int') String? numInt, String colonia,@JsonKey(name: 'codigo_postal') String codigoPostal, String municipio, String estado, String? referencias,@JsonKey(name: 'es_principal') bool esPrincipal,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'updated_at') DateTime? updatedAt, double latitud, double longitud
});




}
/// @nodoc
class _$DireccionModelCopyWithImpl<$Res>
    implements $DireccionModelCopyWith<$Res> {
  _$DireccionModelCopyWithImpl(this._self, this._then);

  final DireccionModel _self;
  final $Res Function(DireccionModel) _then;

/// Create a copy of DireccionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? usuarioId = null,Object? alias = null,Object? calle = null,Object? numExt = null,Object? numInt = freezed,Object? colonia = null,Object? codigoPostal = null,Object? municipio = null,Object? estado = null,Object? referencias = freezed,Object? esPrincipal = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? latitud = null,Object? longitud = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExt: null == numExt ? _self.numExt : numExt // ignore: cast_nullable_to_non_nullable
as String,numInt: freezed == numInt ? _self.numInt : numInt // ignore: cast_nullable_to_non_nullable
as String?,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,referencias: freezed == referencias ? _self.referencias : referencias // ignore: cast_nullable_to_non_nullable
as String?,esPrincipal: null == esPrincipal ? _self.esPrincipal : esPrincipal // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitud: null == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double,longitud: null == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DireccionModel].
extension DireccionModelPatterns on DireccionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DireccionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DireccionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DireccionModel value)  $default,){
final _that = this;
switch (_that) {
case _DireccionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DireccionModel value)?  $default,){
final _that = this;
switch (_that) {
case _DireccionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'usuario_id')  String usuarioId,  String alias,  String calle, @JsonKey(name: 'num_ext')  String numExt, @JsonKey(name: 'num_int')  String? numInt,  String colonia, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String municipio,  String estado,  String? referencias, @JsonKey(name: 'es_principal')  bool esPrincipal, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitud,  double longitud)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DireccionModel() when $default != null:
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.referencias,_that.esPrincipal,_that.fechaCreacion,_that.updatedAt,_that.latitud,_that.longitud);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'usuario_id')  String usuarioId,  String alias,  String calle, @JsonKey(name: 'num_ext')  String numExt, @JsonKey(name: 'num_int')  String? numInt,  String colonia, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String municipio,  String estado,  String? referencias, @JsonKey(name: 'es_principal')  bool esPrincipal, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitud,  double longitud)  $default,) {final _that = this;
switch (_that) {
case _DireccionModel():
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.referencias,_that.esPrincipal,_that.fechaCreacion,_that.updatedAt,_that.latitud,_that.longitud);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'usuario_id')  String usuarioId,  String alias,  String calle, @JsonKey(name: 'num_ext')  String numExt, @JsonKey(name: 'num_int')  String? numInt,  String colonia, @JsonKey(name: 'codigo_postal')  String codigoPostal,  String municipio,  String estado,  String? referencias, @JsonKey(name: 'es_principal')  bool esPrincipal, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitud,  double longitud)?  $default,) {final _that = this;
switch (_that) {
case _DireccionModel() when $default != null:
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.referencias,_that.esPrincipal,_that.fechaCreacion,_that.updatedAt,_that.latitud,_that.longitud);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DireccionModel implements DireccionModel {
  const _DireccionModel({required this.id, @JsonKey(name: 'usuario_id') required this.usuarioId, required this.alias, required this.calle, @JsonKey(name: 'num_ext') required this.numExt, @JsonKey(name: 'num_int') this.numInt, required this.colonia, @JsonKey(name: 'codigo_postal') required this.codigoPostal, required this.municipio, required this.estado, this.referencias, @JsonKey(name: 'es_principal') this.esPrincipal = false, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'updated_at') this.updatedAt, required this.latitud, required this.longitud});
  factory _DireccionModel.fromJson(Map<String, dynamic> json) => _$DireccionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'usuario_id') final  String usuarioId;
@override final  String alias;
@override final  String calle;
@override@JsonKey(name: 'num_ext') final  String numExt;
@override@JsonKey(name: 'num_int') final  String? numInt;
@override final  String colonia;
@override@JsonKey(name: 'codigo_postal') final  String codigoPostal;
@override final  String municipio;
@override final  String estado;
@override final  String? referencias;
@override@JsonKey(name: 'es_principal') final  bool esPrincipal;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  double latitud;
@override final  double longitud;

/// Create a copy of DireccionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DireccionModelCopyWith<_DireccionModel> get copyWith => __$DireccionModelCopyWithImpl<_DireccionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DireccionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DireccionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExt, numExt) || other.numExt == numExt)&&(identical(other.numInt, numInt) || other.numInt == numInt)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.referencias, referencias) || other.referencias == referencias)&&(identical(other.esPrincipal, esPrincipal) || other.esPrincipal == esPrincipal)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuarioId,alias,calle,numExt,numInt,colonia,codigoPostal,municipio,estado,referencias,esPrincipal,fechaCreacion,updatedAt,latitud,longitud);

@override
String toString() {
  return 'DireccionModel(id: $id, usuarioId: $usuarioId, alias: $alias, calle: $calle, numExt: $numExt, numInt: $numInt, colonia: $colonia, codigoPostal: $codigoPostal, municipio: $municipio, estado: $estado, referencias: $referencias, esPrincipal: $esPrincipal, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, latitud: $latitud, longitud: $longitud)';
}


}

/// @nodoc
abstract mixin class _$DireccionModelCopyWith<$Res> implements $DireccionModelCopyWith<$Res> {
  factory _$DireccionModelCopyWith(_DireccionModel value, $Res Function(_DireccionModel) _then) = __$DireccionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'usuario_id') String usuarioId, String alias, String calle,@JsonKey(name: 'num_ext') String numExt,@JsonKey(name: 'num_int') String? numInt, String colonia,@JsonKey(name: 'codigo_postal') String codigoPostal, String municipio, String estado, String? referencias,@JsonKey(name: 'es_principal') bool esPrincipal,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'updated_at') DateTime? updatedAt, double latitud, double longitud
});




}
/// @nodoc
class __$DireccionModelCopyWithImpl<$Res>
    implements _$DireccionModelCopyWith<$Res> {
  __$DireccionModelCopyWithImpl(this._self, this._then);

  final _DireccionModel _self;
  final $Res Function(_DireccionModel) _then;

/// Create a copy of DireccionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? usuarioId = null,Object? alias = null,Object? calle = null,Object? numExt = null,Object? numInt = freezed,Object? colonia = null,Object? codigoPostal = null,Object? municipio = null,Object? estado = null,Object? referencias = freezed,Object? esPrincipal = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? latitud = null,Object? longitud = null,}) {
  return _then(_DireccionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExt: null == numExt ? _self.numExt : numExt // ignore: cast_nullable_to_non_nullable
as String,numInt: freezed == numInt ? _self.numInt : numInt // ignore: cast_nullable_to_non_nullable
as String?,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,referencias: freezed == referencias ? _self.referencias : referencias // ignore: cast_nullable_to_non_nullable
as String?,esPrincipal: null == esPrincipal ? _self.esPrincipal : esPrincipal // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitud: null == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double,longitud: null == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
