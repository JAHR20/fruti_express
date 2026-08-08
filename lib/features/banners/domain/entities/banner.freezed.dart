// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Banner {

 String get id; String get titulo; String get descuento; String get subtitulo; String get colorInicio; String get colorFin; String? get imagenUrl; bool get activo; int get orden; DateTime get fechaCreacion;
/// Create a copy of Banner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerCopyWith<Banner> get copyWith => _$BannerCopyWithImpl<Banner>(this as Banner, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Banner&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descuento, descuento) || other.descuento == descuento)&&(identical(other.subtitulo, subtitulo) || other.subtitulo == subtitulo)&&(identical(other.colorInicio, colorInicio) || other.colorInicio == colorInicio)&&(identical(other.colorFin, colorFin) || other.colorFin == colorFin)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,descuento,subtitulo,colorInicio,colorFin,imagenUrl,activo,orden,fechaCreacion);

@override
String toString() {
  return 'Banner(id: $id, titulo: $titulo, descuento: $descuento, subtitulo: $subtitulo, colorInicio: $colorInicio, colorFin: $colorFin, imagenUrl: $imagenUrl, activo: $activo, orden: $orden, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $BannerCopyWith<$Res>  {
  factory $BannerCopyWith(Banner value, $Res Function(Banner) _then) = _$BannerCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, String descuento, String subtitulo, String colorInicio, String colorFin, String? imagenUrl, bool activo, int orden, DateTime fechaCreacion
});




}
/// @nodoc
class _$BannerCopyWithImpl<$Res>
    implements $BannerCopyWith<$Res> {
  _$BannerCopyWithImpl(this._self, this._then);

  final Banner _self;
  final $Res Function(Banner) _then;

/// Create a copy of Banner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? titulo = null,Object? descuento = null,Object? subtitulo = null,Object? colorInicio = null,Object? colorFin = null,Object? imagenUrl = freezed,Object? activo = null,Object? orden = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descuento: null == descuento ? _self.descuento : descuento // ignore: cast_nullable_to_non_nullable
as String,subtitulo: null == subtitulo ? _self.subtitulo : subtitulo // ignore: cast_nullable_to_non_nullable
as String,colorInicio: null == colorInicio ? _self.colorInicio : colorInicio // ignore: cast_nullable_to_non_nullable
as String,colorFin: null == colorFin ? _self.colorFin : colorFin // ignore: cast_nullable_to_non_nullable
as String,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Banner].
extension BannerPatterns on Banner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Banner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Banner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Banner value)  $default,){
final _that = this;
switch (_that) {
case _Banner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Banner value)?  $default,){
final _that = this;
switch (_that) {
case _Banner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titulo,  String descuento,  String subtitulo,  String colorInicio,  String colorFin,  String? imagenUrl,  bool activo,  int orden,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Banner() when $default != null:
return $default(_that.id,_that.titulo,_that.descuento,_that.subtitulo,_that.colorInicio,_that.colorFin,_that.imagenUrl,_that.activo,_that.orden,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titulo,  String descuento,  String subtitulo,  String colorInicio,  String colorFin,  String? imagenUrl,  bool activo,  int orden,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _Banner():
return $default(_that.id,_that.titulo,_that.descuento,_that.subtitulo,_that.colorInicio,_that.colorFin,_that.imagenUrl,_that.activo,_that.orden,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titulo,  String descuento,  String subtitulo,  String colorInicio,  String colorFin,  String? imagenUrl,  bool activo,  int orden,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _Banner() when $default != null:
return $default(_that.id,_that.titulo,_that.descuento,_that.subtitulo,_that.colorInicio,_that.colorFin,_that.imagenUrl,_that.activo,_that.orden,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc


class _Banner implements Banner {
  const _Banner({required this.id, required this.titulo, required this.descuento, required this.subtitulo, required this.colorInicio, required this.colorFin, this.imagenUrl, required this.activo, required this.orden, required this.fechaCreacion});
  

@override final  String id;
@override final  String titulo;
@override final  String descuento;
@override final  String subtitulo;
@override final  String colorInicio;
@override final  String colorFin;
@override final  String? imagenUrl;
@override final  bool activo;
@override final  int orden;
@override final  DateTime fechaCreacion;

/// Create a copy of Banner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerCopyWith<_Banner> get copyWith => __$BannerCopyWithImpl<_Banner>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Banner&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descuento, descuento) || other.descuento == descuento)&&(identical(other.subtitulo, subtitulo) || other.subtitulo == subtitulo)&&(identical(other.colorInicio, colorInicio) || other.colorInicio == colorInicio)&&(identical(other.colorFin, colorFin) || other.colorFin == colorFin)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}


@override
int get hashCode => Object.hash(runtimeType,id,titulo,descuento,subtitulo,colorInicio,colorFin,imagenUrl,activo,orden,fechaCreacion);

@override
String toString() {
  return 'Banner(id: $id, titulo: $titulo, descuento: $descuento, subtitulo: $subtitulo, colorInicio: $colorInicio, colorFin: $colorFin, imagenUrl: $imagenUrl, activo: $activo, orden: $orden, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$BannerCopyWith<$Res> implements $BannerCopyWith<$Res> {
  factory _$BannerCopyWith(_Banner value, $Res Function(_Banner) _then) = __$BannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, String descuento, String subtitulo, String colorInicio, String colorFin, String? imagenUrl, bool activo, int orden, DateTime fechaCreacion
});




}
/// @nodoc
class __$BannerCopyWithImpl<$Res>
    implements _$BannerCopyWith<$Res> {
  __$BannerCopyWithImpl(this._self, this._then);

  final _Banner _self;
  final $Res Function(_Banner) _then;

/// Create a copy of Banner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? descuento = null,Object? subtitulo = null,Object? colorInicio = null,Object? colorFin = null,Object? imagenUrl = freezed,Object? activo = null,Object? orden = null,Object? fechaCreacion = null,}) {
  return _then(_Banner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,titulo: null == titulo ? _self.titulo : titulo // ignore: cast_nullable_to_non_nullable
as String,descuento: null == descuento ? _self.descuento : descuento // ignore: cast_nullable_to_non_nullable
as String,subtitulo: null == subtitulo ? _self.subtitulo : subtitulo // ignore: cast_nullable_to_non_nullable
as String,colorInicio: null == colorInicio ? _self.colorInicio : colorInicio // ignore: cast_nullable_to_non_nullable
as String,colorFin: null == colorFin ? _self.colorFin : colorFin // ignore: cast_nullable_to_non_nullable
as String,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,orden: null == orden ? _self.orden : orden // ignore: cast_nullable_to_non_nullable
as int,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
