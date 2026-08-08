// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoriaModel {

 String get id; String get nombre; String? get descripcion;@JsonKey(name: 'imagen_url') String? get imagenUrl;@JsonKey(name: 'is_active') bool get activa;@JsonKey(name: 'categoria_padre_id') String? get categoriaPadreId;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;@JsonKey(name: 'fecha_actualizacion') DateTime? get fechaActualizacion;
/// Create a copy of CategoriaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaModelCopyWith<CategoriaModel> get copyWith => _$CategoriaModelCopyWithImpl<CategoriaModel>(this as CategoriaModel, _$identity);

  /// Serializes this CategoriaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.categoriaPadreId, categoriaPadreId) || other.categoriaPadreId == categoriaPadreId)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,imagenUrl,activa,categoriaPadreId,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'CategoriaModel(id: $id, nombre: $nombre, descripcion: $descripcion, imagenUrl: $imagenUrl, activa: $activa, categoriaPadreId: $categoriaPadreId, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $CategoriaModelCopyWith<$Res>  {
  factory $CategoriaModelCopyWith(CategoriaModel value, $Res Function(CategoriaModel) _then) = _$CategoriaModelCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String? descripcion,@JsonKey(name: 'imagen_url') String? imagenUrl,@JsonKey(name: 'is_active') bool activa,@JsonKey(name: 'categoria_padre_id') String? categoriaPadreId,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion
});




}
/// @nodoc
class _$CategoriaModelCopyWithImpl<$Res>
    implements $CategoriaModelCopyWith<$Res> {
  _$CategoriaModelCopyWithImpl(this._self, this._then);

  final CategoriaModel _self;
  final $Res Function(CategoriaModel) _then;

/// Create a copy of CategoriaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? descripcion = freezed,Object? imagenUrl = freezed,Object? activa = null,Object? categoriaPadreId = freezed,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,categoriaPadreId: freezed == categoriaPadreId ? _self.categoriaPadreId : categoriaPadreId // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaActualizacion: freezed == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoriaModel].
extension CategoriaModelPatterns on CategoriaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriaModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoriaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriaModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String? descripcion, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'categoria_padre_id')  String? categoriaPadreId, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriaModel() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.imagenUrl,_that.activa,_that.categoriaPadreId,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String? descripcion, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'categoria_padre_id')  String? categoriaPadreId, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _CategoriaModel():
return $default(_that.id,_that.nombre,_that.descripcion,_that.imagenUrl,_that.activa,_that.categoriaPadreId,_that.fechaCreacion,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String? descripcion, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool activa, @JsonKey(name: 'categoria_padre_id')  String? categoriaPadreId, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'fecha_actualizacion')  DateTime? fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _CategoriaModel() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.imagenUrl,_that.activa,_that.categoriaPadreId,_that.fechaCreacion,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoriaModel implements CategoriaModel {
  const _CategoriaModel({required this.id, required this.nombre, this.descripcion, @JsonKey(name: 'imagen_url') this.imagenUrl, @JsonKey(name: 'is_active') required this.activa, @JsonKey(name: 'categoria_padre_id') this.categoriaPadreId, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'fecha_actualizacion') this.fechaActualizacion});
  factory _CategoriaModel.fromJson(Map<String, dynamic> json) => _$CategoriaModelFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String? descripcion;
@override@JsonKey(name: 'imagen_url') final  String? imagenUrl;
@override@JsonKey(name: 'is_active') final  bool activa;
@override@JsonKey(name: 'categoria_padre_id') final  String? categoriaPadreId;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;
@override@JsonKey(name: 'fecha_actualizacion') final  DateTime? fechaActualizacion;

/// Create a copy of CategoriaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriaModelCopyWith<_CategoriaModel> get copyWith => __$CategoriaModelCopyWithImpl<_CategoriaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoriaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.categoriaPadreId, categoriaPadreId) || other.categoriaPadreId == categoriaPadreId)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,imagenUrl,activa,categoriaPadreId,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'CategoriaModel(id: $id, nombre: $nombre, descripcion: $descripcion, imagenUrl: $imagenUrl, activa: $activa, categoriaPadreId: $categoriaPadreId, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$CategoriaModelCopyWith<$Res> implements $CategoriaModelCopyWith<$Res> {
  factory _$CategoriaModelCopyWith(_CategoriaModel value, $Res Function(_CategoriaModel) _then) = __$CategoriaModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String? descripcion,@JsonKey(name: 'imagen_url') String? imagenUrl,@JsonKey(name: 'is_active') bool activa,@JsonKey(name: 'categoria_padre_id') String? categoriaPadreId,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion
});




}
/// @nodoc
class __$CategoriaModelCopyWithImpl<$Res>
    implements _$CategoriaModelCopyWith<$Res> {
  __$CategoriaModelCopyWithImpl(this._self, this._then);

  final _CategoriaModel _self;
  final $Res Function(_CategoriaModel) _then;

/// Create a copy of CategoriaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = freezed,Object? imagenUrl = freezed,Object? activa = null,Object? categoriaPadreId = freezed,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_CategoriaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,categoriaPadreId: freezed == categoriaPadreId ? _self.categoriaPadreId : categoriaPadreId // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,fechaActualizacion: freezed == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
