// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Categoria {

 String get id; String get nombre; String? get descripcion; String? get imagenUrl; bool get activa; String? get categoriaPadreId; DateTime get fechaCreacion; DateTime? get fechaActualizacion;
/// Create a copy of Categoria
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaCopyWith<Categoria> get copyWith => _$CategoriaCopyWithImpl<Categoria>(this as Categoria, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Categoria&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.categoriaPadreId, categoriaPadreId) || other.categoriaPadreId == categoriaPadreId)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,imagenUrl,activa,categoriaPadreId,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'Categoria(id: $id, nombre: $nombre, descripcion: $descripcion, imagenUrl: $imagenUrl, activa: $activa, categoriaPadreId: $categoriaPadreId, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $CategoriaCopyWith<$Res>  {
  factory $CategoriaCopyWith(Categoria value, $Res Function(Categoria) _then) = _$CategoriaCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String? descripcion, String? imagenUrl, bool activa, String? categoriaPadreId, DateTime fechaCreacion, DateTime? fechaActualizacion
});




}
/// @nodoc
class _$CategoriaCopyWithImpl<$Res>
    implements $CategoriaCopyWith<$Res> {
  _$CategoriaCopyWithImpl(this._self, this._then);

  final Categoria _self;
  final $Res Function(Categoria) _then;

/// Create a copy of Categoria
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


/// Adds pattern-matching-related methods to [Categoria].
extension CategoriaPatterns on Categoria {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Categoria value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Categoria() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Categoria value)  $default,){
final _that = this;
switch (_that) {
case _Categoria():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Categoria value)?  $default,){
final _that = this;
switch (_that) {
case _Categoria() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String? descripcion,  String? imagenUrl,  bool activa,  String? categoriaPadreId,  DateTime fechaCreacion,  DateTime? fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Categoria() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String? descripcion,  String? imagenUrl,  bool activa,  String? categoriaPadreId,  DateTime fechaCreacion,  DateTime? fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _Categoria():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String? descripcion,  String? imagenUrl,  bool activa,  String? categoriaPadreId,  DateTime fechaCreacion,  DateTime? fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _Categoria() when $default != null:
return $default(_that.id,_that.nombre,_that.descripcion,_that.imagenUrl,_that.activa,_that.categoriaPadreId,_that.fechaCreacion,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc


class _Categoria implements Categoria {
  const _Categoria({required this.id, required this.nombre, this.descripcion, this.imagenUrl, required this.activa, this.categoriaPadreId, required this.fechaCreacion, this.fechaActualizacion});
  

@override final  String id;
@override final  String nombre;
@override final  String? descripcion;
@override final  String? imagenUrl;
@override final  bool activa;
@override final  String? categoriaPadreId;
@override final  DateTime fechaCreacion;
@override final  DateTime? fechaActualizacion;

/// Create a copy of Categoria
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriaCopyWith<_Categoria> get copyWith => __$CategoriaCopyWithImpl<_Categoria>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Categoria&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.categoriaPadreId, categoriaPadreId) || other.categoriaPadreId == categoriaPadreId)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,descripcion,imagenUrl,activa,categoriaPadreId,fechaCreacion,fechaActualizacion);

@override
String toString() {
  return 'Categoria(id: $id, nombre: $nombre, descripcion: $descripcion, imagenUrl: $imagenUrl, activa: $activa, categoriaPadreId: $categoriaPadreId, fechaCreacion: $fechaCreacion, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$CategoriaCopyWith<$Res> implements $CategoriaCopyWith<$Res> {
  factory _$CategoriaCopyWith(_Categoria value, $Res Function(_Categoria) _then) = __$CategoriaCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String? descripcion, String? imagenUrl, bool activa, String? categoriaPadreId, DateTime fechaCreacion, DateTime? fechaActualizacion
});




}
/// @nodoc
class __$CategoriaCopyWithImpl<$Res>
    implements _$CategoriaCopyWith<$Res> {
  __$CategoriaCopyWithImpl(this._self, this._then);

  final _Categoria _self;
  final $Res Function(_Categoria) _then;

/// Create a copy of Categoria
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? descripcion = freezed,Object? imagenUrl = freezed,Object? activa = null,Object? categoriaPadreId = freezed,Object? fechaCreacion = null,Object? fechaActualizacion = freezed,}) {
  return _then(_Categoria(
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
