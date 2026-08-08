// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'producto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Producto {

 String? get id; String get categoriaId; String get nombre; String? get descripcion; int get precioActual; int? get precioComparacion; UnidadMedida get unidadMedida; String? get imagenUrl; bool get isActive; DateTime get fechaCreacion; DateTime? get updatedAt; int get stock;
/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductoCopyWith<Producto> get copyWith => _$ProductoCopyWithImpl<Producto>(this as Producto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Producto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioActual, precioActual) || other.precioActual == precioActual)&&(identical(other.precioComparacion, precioComparacion) || other.precioComparacion == precioComparacion)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoriaId,nombre,descripcion,precioActual,precioComparacion,unidadMedida,imagenUrl,isActive,fechaCreacion,updatedAt,stock);

@override
String toString() {
  return 'Producto(id: $id, categoriaId: $categoriaId, nombre: $nombre, descripcion: $descripcion, precioActual: $precioActual, precioComparacion: $precioComparacion, unidadMedida: $unidadMedida, imagenUrl: $imagenUrl, isActive: $isActive, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ProductoCopyWith<$Res>  {
  factory $ProductoCopyWith(Producto value, $Res Function(Producto) _then) = _$ProductoCopyWithImpl;
@useResult
$Res call({
 String? id, String categoriaId, String nombre, String? descripcion, int precioActual, int? precioComparacion, UnidadMedida unidadMedida, String? imagenUrl, bool isActive, DateTime fechaCreacion, DateTime? updatedAt, int stock
});




}
/// @nodoc
class _$ProductoCopyWithImpl<$Res>
    implements $ProductoCopyWith<$Res> {
  _$ProductoCopyWithImpl(this._self, this._then);

  final Producto _self;
  final $Res Function(Producto) _then;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoriaId = null,Object? nombre = null,Object? descripcion = freezed,Object? precioActual = null,Object? precioComparacion = freezed,Object? unidadMedida = null,Object? imagenUrl = freezed,Object? isActive = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: null == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioActual: null == precioActual ? _self.precioActual : precioActual // ignore: cast_nullable_to_non_nullable
as int,precioComparacion: freezed == precioComparacion ? _self.precioComparacion : precioComparacion // ignore: cast_nullable_to_non_nullable
as int?,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Producto].
extension ProductoPatterns on Producto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Producto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Producto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Producto value)  $default,){
final _that = this;
switch (_that) {
case _Producto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Producto value)?  $default,){
final _that = this;
switch (_that) {
case _Producto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String categoriaId,  String nombre,  String? descripcion,  int precioActual,  int? precioComparacion,  UnidadMedida unidadMedida,  String? imagenUrl,  bool isActive,  DateTime fechaCreacion,  DateTime? updatedAt,  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Producto() when $default != null:
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String categoriaId,  String nombre,  String? descripcion,  int precioActual,  int? precioComparacion,  UnidadMedida unidadMedida,  String? imagenUrl,  bool isActive,  DateTime fechaCreacion,  DateTime? updatedAt,  int stock)  $default,) {final _that = this;
switch (_that) {
case _Producto():
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String categoriaId,  String nombre,  String? descripcion,  int precioActual,  int? precioComparacion,  UnidadMedida unidadMedida,  String? imagenUrl,  bool isActive,  DateTime fechaCreacion,  DateTime? updatedAt,  int stock)?  $default,) {final _that = this;
switch (_that) {
case _Producto() when $default != null:
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
  return null;

}
}

}

/// @nodoc


class _Producto extends Producto {
  const _Producto({this.id, required this.categoriaId, required this.nombre, this.descripcion, required this.precioActual, this.precioComparacion, required this.unidadMedida, this.imagenUrl, required this.isActive, required this.fechaCreacion, this.updatedAt, this.stock = 0}): super._();
  

@override final  String? id;
@override final  String categoriaId;
@override final  String nombre;
@override final  String? descripcion;
@override final  int precioActual;
@override final  int? precioComparacion;
@override final  UnidadMedida unidadMedida;
@override final  String? imagenUrl;
@override final  bool isActive;
@override final  DateTime fechaCreacion;
@override final  DateTime? updatedAt;
@override@JsonKey() final  int stock;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductoCopyWith<_Producto> get copyWith => __$ProductoCopyWithImpl<_Producto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Producto&&(identical(other.id, id) || other.id == id)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioActual, precioActual) || other.precioActual == precioActual)&&(identical(other.precioComparacion, precioComparacion) || other.precioComparacion == precioComparacion)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}


@override
int get hashCode => Object.hash(runtimeType,id,categoriaId,nombre,descripcion,precioActual,precioComparacion,unidadMedida,imagenUrl,isActive,fechaCreacion,updatedAt,stock);

@override
String toString() {
  return 'Producto(id: $id, categoriaId: $categoriaId, nombre: $nombre, descripcion: $descripcion, precioActual: $precioActual, precioComparacion: $precioComparacion, unidadMedida: $unidadMedida, imagenUrl: $imagenUrl, isActive: $isActive, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ProductoCopyWith<$Res> implements $ProductoCopyWith<$Res> {
  factory _$ProductoCopyWith(_Producto value, $Res Function(_Producto) _then) = __$ProductoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String categoriaId, String nombre, String? descripcion, int precioActual, int? precioComparacion, UnidadMedida unidadMedida, String? imagenUrl, bool isActive, DateTime fechaCreacion, DateTime? updatedAt, int stock
});




}
/// @nodoc
class __$ProductoCopyWithImpl<$Res>
    implements _$ProductoCopyWith<$Res> {
  __$ProductoCopyWithImpl(this._self, this._then);

  final _Producto _self;
  final $Res Function(_Producto) _then;

/// Create a copy of Producto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoriaId = null,Object? nombre = null,Object? descripcion = freezed,Object? precioActual = null,Object? precioComparacion = freezed,Object? unidadMedida = null,Object? imagenUrl = freezed,Object? isActive = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_Producto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: null == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioActual: null == precioActual ? _self.precioActual : precioActual // ignore: cast_nullable_to_non_nullable
as int,precioComparacion: freezed == precioComparacion ? _self.precioComparacion : precioComparacion // ignore: cast_nullable_to_non_nullable
as int?,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
