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

 String get productoId; String get sucursalId; int get stockDisponible; int get stockReservado; int? get precioLocal;// 🌟 CORRECCIÓN CRÍTICA: int en lugar de double para los centavos
 DateTime get fechaActualizacion;
/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioCopyWith<Inventario> get copyWith => _$InventarioCopyWithImpl<Inventario>(this as Inventario, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inventario&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.stockDisponible, stockDisponible) || other.stockDisponible == stockDisponible)&&(identical(other.stockReservado, stockReservado) || other.stockReservado == stockReservado)&&(identical(other.precioLocal, precioLocal) || other.precioLocal == precioLocal)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,productoId,sucursalId,stockDisponible,stockReservado,precioLocal,fechaActualizacion);

@override
String toString() {
  return 'Inventario(productoId: $productoId, sucursalId: $sucursalId, stockDisponible: $stockDisponible, stockReservado: $stockReservado, precioLocal: $precioLocal, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $InventarioCopyWith<$Res>  {
  factory $InventarioCopyWith(Inventario value, $Res Function(Inventario) _then) = _$InventarioCopyWithImpl;
@useResult
$Res call({
 String productoId, String sucursalId, int stockDisponible, int stockReservado, int? precioLocal, DateTime fechaActualizacion
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
@pragma('vm:prefer-inline') @override $Res call({Object? productoId = null,Object? sucursalId = null,Object? stockDisponible = null,Object? stockReservado = null,Object? precioLocal = freezed,Object? fechaActualizacion = null,}) {
  return _then(_self.copyWith(
productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,stockDisponible: null == stockDisponible ? _self.stockDisponible : stockDisponible // ignore: cast_nullable_to_non_nullable
as int,stockReservado: null == stockReservado ? _self.stockReservado : stockReservado // ignore: cast_nullable_to_non_nullable
as int,precioLocal: freezed == precioLocal ? _self.precioLocal : precioLocal // ignore: cast_nullable_to_non_nullable
as int?,fechaActualizacion: null == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productoId,  String sucursalId,  int stockDisponible,  int stockReservado,  int? precioLocal,  DateTime fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inventario() when $default != null:
return $default(_that.productoId,_that.sucursalId,_that.stockDisponible,_that.stockReservado,_that.precioLocal,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productoId,  String sucursalId,  int stockDisponible,  int stockReservado,  int? precioLocal,  DateTime fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _Inventario():
return $default(_that.productoId,_that.sucursalId,_that.stockDisponible,_that.stockReservado,_that.precioLocal,_that.fechaActualizacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productoId,  String sucursalId,  int stockDisponible,  int stockReservado,  int? precioLocal,  DateTime fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _Inventario() when $default != null:
return $default(_that.productoId,_that.sucursalId,_that.stockDisponible,_that.stockReservado,_that.precioLocal,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc


class _Inventario extends Inventario {
  const _Inventario({required this.productoId, required this.sucursalId, required this.stockDisponible, required this.stockReservado, this.precioLocal, required this.fechaActualizacion}): super._();
  

@override final  String productoId;
@override final  String sucursalId;
@override final  int stockDisponible;
@override final  int stockReservado;
@override final  int? precioLocal;
// 🌟 CORRECCIÓN CRÍTICA: int en lugar de double para los centavos
@override final  DateTime fechaActualizacion;

/// Create a copy of Inventario
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventarioCopyWith<_Inventario> get copyWith => __$InventarioCopyWithImpl<_Inventario>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inventario&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.stockDisponible, stockDisponible) || other.stockDisponible == stockDisponible)&&(identical(other.stockReservado, stockReservado) || other.stockReservado == stockReservado)&&(identical(other.precioLocal, precioLocal) || other.precioLocal == precioLocal)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}


@override
int get hashCode => Object.hash(runtimeType,productoId,sucursalId,stockDisponible,stockReservado,precioLocal,fechaActualizacion);

@override
String toString() {
  return 'Inventario(productoId: $productoId, sucursalId: $sucursalId, stockDisponible: $stockDisponible, stockReservado: $stockReservado, precioLocal: $precioLocal, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$InventarioCopyWith<$Res> implements $InventarioCopyWith<$Res> {
  factory _$InventarioCopyWith(_Inventario value, $Res Function(_Inventario) _then) = __$InventarioCopyWithImpl;
@override @useResult
$Res call({
 String productoId, String sucursalId, int stockDisponible, int stockReservado, int? precioLocal, DateTime fechaActualizacion
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
@override @pragma('vm:prefer-inline') $Res call({Object? productoId = null,Object? sucursalId = null,Object? stockDisponible = null,Object? stockReservado = null,Object? precioLocal = freezed,Object? fechaActualizacion = null,}) {
  return _then(_Inventario(
productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,stockDisponible: null == stockDisponible ? _self.stockDisponible : stockDisponible // ignore: cast_nullable_to_non_nullable
as int,stockReservado: null == stockReservado ? _self.stockReservado : stockReservado // ignore: cast_nullable_to_non_nullable
as int,precioLocal: freezed == precioLocal ? _self.precioLocal : precioLocal // ignore: cast_nullable_to_non_nullable
as int?,fechaActualizacion: null == fechaActualizacion ? _self.fechaActualizacion : fechaActualizacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
