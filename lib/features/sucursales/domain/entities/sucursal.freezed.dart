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

 String get id; String get nombre; String get direccion; bool get activa; DateTime get fechaCreacion;
/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalCopyWith<Sucursal> get copyWith => _$SucursalCopyWithImpl<Sucursal>(this as Sucursal, _$identity);

  /// Serializes this Sucursal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sucursal&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,direccion,activa,fechaCreacion);

@override
String toString() {
  return 'Sucursal(id: $id, nombre: $nombre, direccion: $direccion, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $SucursalCopyWith<$Res>  {
  factory $SucursalCopyWith(Sucursal value, $Res Function(Sucursal) _then) = _$SucursalCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String direccion, bool activa, DateTime fechaCreacion
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? direccion = null,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String direccion,  bool activa,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
return $default(_that.id,_that.nombre,_that.direccion,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String direccion,  bool activa,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _Sucursal():
return $default(_that.id,_that.nombre,_that.direccion,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String direccion,  bool activa,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _Sucursal() when $default != null:
return $default(_that.id,_that.nombre,_that.direccion,_that.activa,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sucursal implements Sucursal {
  const _Sucursal({required this.id, required this.nombre, required this.direccion, required this.activa, required this.fechaCreacion});
  factory _Sucursal.fromJson(Map<String, dynamic> json) => _$SucursalFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String direccion;
@override final  bool activa;
@override final  DateTime fechaCreacion;

/// Create a copy of Sucursal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SucursalCopyWith<_Sucursal> get copyWith => __$SucursalCopyWithImpl<_Sucursal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SucursalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sucursal&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.direccion, direccion) || other.direccion == direccion)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,direccion,activa,fechaCreacion);

@override
String toString() {
  return 'Sucursal(id: $id, nombre: $nombre, direccion: $direccion, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$SucursalCopyWith<$Res> implements $SucursalCopyWith<$Res> {
  factory _$SucursalCopyWith(_Sucursal value, $Res Function(_Sucursal) _then) = __$SucursalCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String direccion, bool activa, DateTime fechaCreacion
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? direccion = null,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_Sucursal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,direccion: null == direccion ? _self.direccion : direccion // ignore: cast_nullable_to_non_nullable
as String,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
