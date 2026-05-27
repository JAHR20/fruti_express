// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Inventario {

 String get id; String get productoId; String get sucursalId; int get cantidadDisponible; int get cantidadReservada; DateTime get ultimaActualizacion;
/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioCopyWith<Inventario> get copyWith => _$InventarioCopyWithImpl<Inventario>(this as Inventario, _$identity);

  /// Serializes this Inventario to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inventario&&(identical(other.id, id) || other.id == id)&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.cantidadDisponible, cantidadDisponible) || other.cantidadDisponible == cantidadDisponible)&&(identical(other.cantidadReservada, cantidadReservada) || other.cantidadReservada == cantidadReservada)&&(identical(other.ultimaActualizacion, ultimaActualizacion) || other.ultimaActualizacion == ultimaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productoId,sucursalId,cantidadDisponible,cantidadReservada,ultimaActualizacion);

@override
String toString() {
  return 'Inventario(id: $id, productoId: $productoId, sucursalId: $sucursalId, cantidadDisponible: $cantidadDisponible, cantidadReservada: $cantidadReservada, ultimaActualizacion: $ultimaActualizacion)';
}


}

/// @nodoc
abstract mixin class $InventarioCopyWith<$Res>  {
  factory $InventarioCopyWith(Inventario value, $Res Function(Inventario) _then) = _$InventarioCopyWithImpl;
@useResult
$Res call({
 String id, String productoId, String sucursalId, int cantidadDisponible, int cantidadReservada, DateTime ultimaActualizacion
});




}
/// @nodoc
class _$InventarioCopyWithImpl<$Res>
    implements $InventarioCopyWith<$Res> {
  _$InventarioCopyWithImpl(this._self, this._then);

  final Inventario _self;
  final $Res Function(Inventario) _then;

/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productoId = null,Object? sucursalId = null,Object? cantidadDisponible = null,Object? cantidadReservada = null,Object? ultimaActualizacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,cantidadDisponible: null == cantidadDisponible ? _self.cantidadDisponible : cantidadDisponible // ignore: cast_nullable_to_non_nullable
as int,cantidadReservada: null == cantidadReservada ? _self.cantidadReservada : cantidadReservada // ignore: cast_nullable_to_non_nullable
as int,ultimaActualizacion: null == ultimaActualizacion ? _self.ultimaActualizacion : ultimaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Inventario].
extension InventarioPatterns on Inventario {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inventario value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inventario() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inventario value)  $default,){
final _that = this;
switch (_that) {
case _Inventario():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inventario value)?  $default,){
final _that = this;
switch (_that) {
case _Inventario() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productoId,  String sucursalId,  int cantidadDisponible,  int cantidadReservada,  DateTime ultimaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inventario() when $default != null:
return $default(_that.id,_that.productoId,_that.sucursalId,_that.cantidadDisponible,_that.cantidadReservada,_that.ultimaActualizacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productoId,  String sucursalId,  int cantidadDisponible,  int cantidadReservada,  DateTime ultimaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _Inventario():
return $default(_that.id,_that.productoId,_that.sucursalId,_that.cantidadDisponible,_that.cantidadReservada,_that.ultimaActualizacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productoId,  String sucursalId,  int cantidadDisponible,  int cantidadReservada,  DateTime ultimaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _Inventario() when $default != null:
return $default(_that.id,_that.productoId,_that.sucursalId,_that.cantidadDisponible,_that.cantidadReservada,_that.ultimaActualizacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inventario implements Inventario {
  const _Inventario({required this.id, required this.productoId, required this.sucursalId, required this.cantidadDisponible, required this.cantidadReservada, required this.ultimaActualizacion});
  factory _Inventario.fromJson(Map<String, dynamic> json) => _$InventarioFromJson(json);

@override final  String id;
@override final  String productoId;
@override final  String sucursalId;
@override final  int cantidadDisponible;
@override final  int cantidadReservada;
@override final  DateTime ultimaActualizacion;

/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventarioCopyWith<_Inventario> get copyWith => __$InventarioCopyWithImpl<_Inventario>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventarioToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inventario&&(identical(other.id, id) || other.id == id)&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.cantidadDisponible, cantidadDisponible) || other.cantidadDisponible == cantidadDisponible)&&(identical(other.cantidadReservada, cantidadReservada) || other.cantidadReservada == cantidadReservada)&&(identical(other.ultimaActualizacion, ultimaActualizacion) || other.ultimaActualizacion == ultimaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productoId,sucursalId,cantidadDisponible,cantidadReservada,ultimaActualizacion);

@override
String toString() {
  return 'Inventario(id: $id, productoId: $productoId, sucursalId: $sucursalId, cantidadDisponible: $cantidadDisponible, cantidadReservada: $cantidadReservada, ultimaActualizacion: $ultimaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$InventarioCopyWith<$Res> implements $InventarioCopyWith<$Res> {
  factory _$InventarioCopyWith(_Inventario value, $Res Function(_Inventario) _then) = __$InventarioCopyWithImpl;
@override @useResult
$Res call({
 String id, String productoId, String sucursalId, int cantidadDisponible, int cantidadReservada, DateTime ultimaActualizacion
});




}
/// @nodoc
class __$InventarioCopyWithImpl<$Res>
    implements _$InventarioCopyWith<$Res> {
  __$InventarioCopyWithImpl(this._self, this._then);

  final _Inventario _self;
  final $Res Function(_Inventario) _then;

/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productoId = null,Object? sucursalId = null,Object? cantidadDisponible = null,Object? cantidadReservada = null,Object? ultimaActualizacion = null,}) {
  return _then(_Inventario(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,cantidadDisponible: null == cantidadDisponible ? _self.cantidadDisponible : cantidadDisponible // ignore: cast_nullable_to_non_nullable
as int,cantidadReservada: null == cantidadReservada ? _self.cantidadReservada : cantidadReservada // ignore: cast_nullable_to_non_nullable
as int,ultimaActualizacion: null == ultimaActualizacion ? _self.ultimaActualizacion : ultimaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
