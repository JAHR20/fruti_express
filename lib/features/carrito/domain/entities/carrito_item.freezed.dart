// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carrito_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarritoItem {

 String get productoId; String get nombre; String? get imagenUrl; int get precioUnitario; int get cantidad; UnidadMedida get unidadMedida; String get sucursalId;
/// Create a copy of CarritoItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarritoItemCopyWith<CarritoItem> get copyWith => _$CarritoItemCopyWithImpl<CarritoItem>(this as CarritoItem, _$identity);

  /// Serializes this CarritoItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarritoItem&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productoId,nombre,imagenUrl,precioUnitario,cantidad,unidadMedida,sucursalId);

@override
String toString() {
  return 'CarritoItem(productoId: $productoId, nombre: $nombre, imagenUrl: $imagenUrl, precioUnitario: $precioUnitario, cantidad: $cantidad, unidadMedida: $unidadMedida, sucursalId: $sucursalId)';
}


}

/// @nodoc
abstract mixin class $CarritoItemCopyWith<$Res>  {
  factory $CarritoItemCopyWith(CarritoItem value, $Res Function(CarritoItem) _then) = _$CarritoItemCopyWithImpl;
@useResult
$Res call({
 String productoId, String nombre, String? imagenUrl, int precioUnitario, int cantidad, UnidadMedida unidadMedida, String sucursalId
});




}
/// @nodoc
class _$CarritoItemCopyWithImpl<$Res>
    implements $CarritoItemCopyWith<$Res> {
  _$CarritoItemCopyWithImpl(this._self, this._then);

  final CarritoItem _self;
  final $Res Function(CarritoItem) _then;

/// Create a copy of CarritoItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productoId = null,Object? nombre = null,Object? imagenUrl = freezed,Object? precioUnitario = null,Object? cantidad = null,Object? unidadMedida = null,Object? sucursalId = null,}) {
  return _then(_self.copyWith(
productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CarritoItem].
extension CarritoItemPatterns on CarritoItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarritoItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarritoItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarritoItem value)  $default,){
final _that = this;
switch (_that) {
case _CarritoItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarritoItem value)?  $default,){
final _that = this;
switch (_that) {
case _CarritoItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productoId,  String nombre,  String? imagenUrl,  int precioUnitario,  int cantidad,  UnidadMedida unidadMedida,  String sucursalId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarritoItem() when $default != null:
return $default(_that.productoId,_that.nombre,_that.imagenUrl,_that.precioUnitario,_that.cantidad,_that.unidadMedida,_that.sucursalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productoId,  String nombre,  String? imagenUrl,  int precioUnitario,  int cantidad,  UnidadMedida unidadMedida,  String sucursalId)  $default,) {final _that = this;
switch (_that) {
case _CarritoItem():
return $default(_that.productoId,_that.nombre,_that.imagenUrl,_that.precioUnitario,_that.cantidad,_that.unidadMedida,_that.sucursalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productoId,  String nombre,  String? imagenUrl,  int precioUnitario,  int cantidad,  UnidadMedida unidadMedida,  String sucursalId)?  $default,) {final _that = this;
switch (_that) {
case _CarritoItem() when $default != null:
return $default(_that.productoId,_that.nombre,_that.imagenUrl,_that.precioUnitario,_that.cantidad,_that.unidadMedida,_that.sucursalId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarritoItem extends CarritoItem {
  const _CarritoItem({required this.productoId, required this.nombre, this.imagenUrl, required this.precioUnitario, required this.cantidad, required this.unidadMedida, required this.sucursalId}): super._();
  factory _CarritoItem.fromJson(Map<String, dynamic> json) => _$CarritoItemFromJson(json);

@override final  String productoId;
@override final  String nombre;
@override final  String? imagenUrl;
@override final  int precioUnitario;
@override final  int cantidad;
@override final  UnidadMedida unidadMedida;
@override final  String sucursalId;

/// Create a copy of CarritoItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarritoItemCopyWith<_CarritoItem> get copyWith => __$CarritoItemCopyWithImpl<_CarritoItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarritoItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarritoItem&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.precioUnitario, precioUnitario) || other.precioUnitario == precioUnitario)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productoId,nombre,imagenUrl,precioUnitario,cantidad,unidadMedida,sucursalId);

@override
String toString() {
  return 'CarritoItem(productoId: $productoId, nombre: $nombre, imagenUrl: $imagenUrl, precioUnitario: $precioUnitario, cantidad: $cantidad, unidadMedida: $unidadMedida, sucursalId: $sucursalId)';
}


}

/// @nodoc
abstract mixin class _$CarritoItemCopyWith<$Res> implements $CarritoItemCopyWith<$Res> {
  factory _$CarritoItemCopyWith(_CarritoItem value, $Res Function(_CarritoItem) _then) = __$CarritoItemCopyWithImpl;
@override @useResult
$Res call({
 String productoId, String nombre, String? imagenUrl, int precioUnitario, int cantidad, UnidadMedida unidadMedida, String sucursalId
});




}
/// @nodoc
class __$CarritoItemCopyWithImpl<$Res>
    implements _$CarritoItemCopyWith<$Res> {
  __$CarritoItemCopyWithImpl(this._self, this._then);

  final _CarritoItem _self;
  final $Res Function(_CarritoItem) _then;

/// Create a copy of CarritoItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productoId = null,Object? nombre = null,Object? imagenUrl = freezed,Object? precioUnitario = null,Object? cantidad = null,Object? unidadMedida = null,Object? sucursalId = null,}) {
  return _then(_CarritoItem(
productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,precioUnitario: null == precioUnitario ? _self.precioUnitario : precioUnitario // ignore: cast_nullable_to_non_nullable
as int,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
