// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerModel {

 String get id; String get titulo; String get descuento; String get subtitulo;@JsonKey(name: 'color_inicio') String get colorInicio;@JsonKey(name: 'color_fin') String get colorFin;@JsonKey(name: 'imagen_url') String? get imagenUrl; bool get activo; int get orden;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;
/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerModelCopyWith<BannerModel> get copyWith => _$BannerModelCopyWithImpl<BannerModel>(this as BannerModel, _$identity);

  /// Serializes this BannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descuento, descuento) || other.descuento == descuento)&&(identical(other.subtitulo, subtitulo) || other.subtitulo == subtitulo)&&(identical(other.colorInicio, colorInicio) || other.colorInicio == colorInicio)&&(identical(other.colorFin, colorFin) || other.colorFin == colorFin)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descuento,subtitulo,colorInicio,colorFin,imagenUrl,activo,orden,fechaCreacion);

@override
String toString() {
  return 'BannerModel(id: $id, titulo: $titulo, descuento: $descuento, subtitulo: $subtitulo, colorInicio: $colorInicio, colorFin: $colorFin, imagenUrl: $imagenUrl, activo: $activo, orden: $orden, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $BannerModelCopyWith<$Res>  {
  factory $BannerModelCopyWith(BannerModel value, $Res Function(BannerModel) _then) = _$BannerModelCopyWithImpl;
@useResult
$Res call({
 String id, String titulo, String descuento, String subtitulo,@JsonKey(name: 'color_inicio') String colorInicio,@JsonKey(name: 'color_fin') String colorFin,@JsonKey(name: 'imagen_url') String? imagenUrl, bool activo, int orden,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class _$BannerModelCopyWithImpl<$Res>
    implements $BannerModelCopyWith<$Res> {
  _$BannerModelCopyWithImpl(this._self, this._then);

  final BannerModel _self;
  final $Res Function(BannerModel) _then;

/// Create a copy of BannerModel
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


/// Adds pattern-matching-related methods to [BannerModel].
extension BannerModelPatterns on BannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String titulo,  String descuento,  String subtitulo, @JsonKey(name: 'color_inicio')  String colorInicio, @JsonKey(name: 'color_fin')  String colorFin, @JsonKey(name: 'imagen_url')  String? imagenUrl,  bool activo,  int orden, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String titulo,  String descuento,  String subtitulo, @JsonKey(name: 'color_inicio')  String colorInicio, @JsonKey(name: 'color_fin')  String colorFin, @JsonKey(name: 'imagen_url')  String? imagenUrl,  bool activo,  int orden, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _BannerModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String titulo,  String descuento,  String subtitulo, @JsonKey(name: 'color_inicio')  String colorInicio, @JsonKey(name: 'color_fin')  String colorFin, @JsonKey(name: 'imagen_url')  String? imagenUrl,  bool activo,  int orden, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _BannerModel() when $default != null:
return $default(_that.id,_that.titulo,_that.descuento,_that.subtitulo,_that.colorInicio,_that.colorFin,_that.imagenUrl,_that.activo,_that.orden,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerModel implements BannerModel {
  const _BannerModel({required this.id, required this.titulo, required this.descuento, required this.subtitulo, @JsonKey(name: 'color_inicio') required this.colorInicio, @JsonKey(name: 'color_fin') required this.colorFin, @JsonKey(name: 'imagen_url') this.imagenUrl, required this.activo, required this.orden, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion});
  factory _BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

@override final  String id;
@override final  String titulo;
@override final  String descuento;
@override final  String subtitulo;
@override@JsonKey(name: 'color_inicio') final  String colorInicio;
@override@JsonKey(name: 'color_fin') final  String colorFin;
@override@JsonKey(name: 'imagen_url') final  String? imagenUrl;
@override final  bool activo;
@override final  int orden;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerModelCopyWith<_BannerModel> get copyWith => __$BannerModelCopyWithImpl<_BannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.titulo, titulo) || other.titulo == titulo)&&(identical(other.descuento, descuento) || other.descuento == descuento)&&(identical(other.subtitulo, subtitulo) || other.subtitulo == subtitulo)&&(identical(other.colorInicio, colorInicio) || other.colorInicio == colorInicio)&&(identical(other.colorFin, colorFin) || other.colorFin == colorFin)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.orden, orden) || other.orden == orden)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,titulo,descuento,subtitulo,colorInicio,colorFin,imagenUrl,activo,orden,fechaCreacion);

@override
String toString() {
  return 'BannerModel(id: $id, titulo: $titulo, descuento: $descuento, subtitulo: $subtitulo, colorInicio: $colorInicio, colorFin: $colorFin, imagenUrl: $imagenUrl, activo: $activo, orden: $orden, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$BannerModelCopyWith<$Res> implements $BannerModelCopyWith<$Res> {
  factory _$BannerModelCopyWith(_BannerModel value, $Res Function(_BannerModel) _then) = __$BannerModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String titulo, String descuento, String subtitulo,@JsonKey(name: 'color_inicio') String colorInicio,@JsonKey(name: 'color_fin') String colorFin,@JsonKey(name: 'imagen_url') String? imagenUrl, bool activo, int orden,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class __$BannerModelCopyWithImpl<$Res>
    implements _$BannerModelCopyWith<$Res> {
  __$BannerModelCopyWithImpl(this._self, this._then);

  final _BannerModel _self;
  final $Res Function(_BannerModel) _then;

/// Create a copy of BannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? titulo = null,Object? descuento = null,Object? subtitulo = null,Object? colorInicio = null,Object? colorFin = null,Object? imagenUrl = freezed,Object? activo = null,Object? orden = null,Object? fechaCreacion = null,}) {
  return _then(_BannerModel(
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
