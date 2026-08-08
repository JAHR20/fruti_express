// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventario_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventarioModel {

@JsonKey(name: 'producto_id') String get productoId;@JsonKey(name: 'sucursal_id') String get sucursalId;@JsonKey(name: 'stock_disponible') int get stockDisponible;@JsonKey(name: 'stock_reservado') int get stockReservado;@JsonKey(name: 'precio_local') int? get precioLocal;@JsonKey(name: 'fecha_actualizacion') DateTime get fechaActualizacion;
/// Create a copy of InventarioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioModelCopyWith<InventarioModel> get copyWith => _$InventarioModelCopyWithImpl<InventarioModel>(this as InventarioModel, _$identity);

  /// Serializes this InventarioModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioModel&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.stockDisponible, stockDisponible) || other.stockDisponible == stockDisponible)&&(identical(other.stockReservado, stockReservado) || other.stockReservado == stockReservado)&&(identical(other.precioLocal, precioLocal) || other.precioLocal == precioLocal)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productoId,sucursalId,stockDisponible,stockReservado,precioLocal,fechaActualizacion);

@override
String toString() {
  return 'InventarioModel(productoId: $productoId, sucursalId: $sucursalId, stockDisponible: $stockDisponible, stockReservado: $stockReservado, precioLocal: $precioLocal, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class $InventarioModelCopyWith<$Res>  {
  factory $InventarioModelCopyWith(InventarioModel value, $Res Function(InventarioModel) _then) = _$InventarioModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'producto_id') String productoId,@JsonKey(name: 'sucursal_id') String sucursalId,@JsonKey(name: 'stock_disponible') int stockDisponible,@JsonKey(name: 'stock_reservado') int stockReservado,@JsonKey(name: 'precio_local') int? precioLocal,@JsonKey(name: 'fecha_actualizacion') DateTime fechaActualizacion
});




}
/// @nodoc
class _$InventarioModelCopyWithImpl<$Res>
    implements $InventarioModelCopyWith<$Res> {
  _$InventarioModelCopyWithImpl(this._self, this._then);

  final InventarioModel _self;
  final $Res Function(InventarioModel) _then;

/// Create a copy of InventarioModel
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


/// Adds pattern-matching-related methods to [InventarioModel].
extension InventarioModelPatterns on InventarioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventarioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventarioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventarioModel value)  $default,){
final _that = this;
switch (_that) {
case _InventarioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventarioModel value)?  $default,){
final _that = this;
switch (_that) {
case _InventarioModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'stock_disponible')  int stockDisponible, @JsonKey(name: 'stock_reservado')  int stockReservado, @JsonKey(name: 'precio_local')  int? precioLocal, @JsonKey(name: 'fecha_actualizacion')  DateTime fechaActualizacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventarioModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'stock_disponible')  int stockDisponible, @JsonKey(name: 'stock_reservado')  int stockReservado, @JsonKey(name: 'precio_local')  int? precioLocal, @JsonKey(name: 'fecha_actualizacion')  DateTime fechaActualizacion)  $default,) {final _that = this;
switch (_that) {
case _InventarioModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'stock_disponible')  int stockDisponible, @JsonKey(name: 'stock_reservado')  int stockReservado, @JsonKey(name: 'precio_local')  int? precioLocal, @JsonKey(name: 'fecha_actualizacion')  DateTime fechaActualizacion)?  $default,) {final _that = this;
switch (_that) {
case _InventarioModel() when $default != null:
return $default(_that.productoId,_that.sucursalId,_that.stockDisponible,_that.stockReservado,_that.precioLocal,_that.fechaActualizacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventarioModel implements InventarioModel {
  const _InventarioModel({@JsonKey(name: 'producto_id') required this.productoId, @JsonKey(name: 'sucursal_id') required this.sucursalId, @JsonKey(name: 'stock_disponible') required this.stockDisponible, @JsonKey(name: 'stock_reservado') required this.stockReservado, @JsonKey(name: 'precio_local') this.precioLocal, @JsonKey(name: 'fecha_actualizacion') required this.fechaActualizacion});
  factory _InventarioModel.fromJson(Map<String, dynamic> json) => _$InventarioModelFromJson(json);

@override@JsonKey(name: 'producto_id') final  String productoId;
@override@JsonKey(name: 'sucursal_id') final  String sucursalId;
@override@JsonKey(name: 'stock_disponible') final  int stockDisponible;
@override@JsonKey(name: 'stock_reservado') final  int stockReservado;
@override@JsonKey(name: 'precio_local') final  int? precioLocal;
@override@JsonKey(name: 'fecha_actualizacion') final  DateTime fechaActualizacion;

/// Create a copy of InventarioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventarioModelCopyWith<_InventarioModel> get copyWith => __$InventarioModelCopyWithImpl<_InventarioModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventarioModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventarioModel&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.stockDisponible, stockDisponible) || other.stockDisponible == stockDisponible)&&(identical(other.stockReservado, stockReservado) || other.stockReservado == stockReservado)&&(identical(other.precioLocal, precioLocal) || other.precioLocal == precioLocal)&&(identical(other.fechaActualizacion, fechaActualizacion) || other.fechaActualizacion == fechaActualizacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productoId,sucursalId,stockDisponible,stockReservado,precioLocal,fechaActualizacion);

@override
String toString() {
  return 'InventarioModel(productoId: $productoId, sucursalId: $sucursalId, stockDisponible: $stockDisponible, stockReservado: $stockReservado, precioLocal: $precioLocal, fechaActualizacion: $fechaActualizacion)';
}


}

/// @nodoc
abstract mixin class _$InventarioModelCopyWith<$Res> implements $InventarioModelCopyWith<$Res> {
  factory _$InventarioModelCopyWith(_InventarioModel value, $Res Function(_InventarioModel) _then) = __$InventarioModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'producto_id') String productoId,@JsonKey(name: 'sucursal_id') String sucursalId,@JsonKey(name: 'stock_disponible') int stockDisponible,@JsonKey(name: 'stock_reservado') int stockReservado,@JsonKey(name: 'precio_local') int? precioLocal,@JsonKey(name: 'fecha_actualizacion') DateTime fechaActualizacion
});




}
/// @nodoc
class __$InventarioModelCopyWithImpl<$Res>
    implements _$InventarioModelCopyWith<$Res> {
  __$InventarioModelCopyWithImpl(this._self, this._then);

  final _InventarioModel _self;
  final $Res Function(_InventarioModel) _then;

/// Create a copy of InventarioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productoId = null,Object? sucursalId = null,Object? stockDisponible = null,Object? stockReservado = null,Object? precioLocal = freezed,Object? fechaActualizacion = null,}) {
  return _then(_InventarioModel(
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
