// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedido_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PedidoItemModel {

 String get id;@JsonKey(name: 'pedido_id') String get pedidoId;@JsonKey(name: 'producto_id') String get productoId;@JsonKey(name: 'nombre_producto_snapshot') String get nombreProductoSnapshot; int get cantidad;@JsonKey(name: 'precio_unitario_snapshot') int get precioUnitarioSnapshot;@UnidadMedidaConverter()@JsonKey(name: 'unidad_medida') UnidadMedida? get unidadMedida;
/// Create a copy of PedidoItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PedidoItemModelCopyWith<PedidoItemModel> get copyWith => _$PedidoItemModelCopyWithImpl<PedidoItemModel>(this as PedidoItemModel, _$identity);

  /// Serializes this PedidoItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PedidoItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.pedidoId, pedidoId) || other.pedidoId == pedidoId)&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.nombreProductoSnapshot, nombreProductoSnapshot) || other.nombreProductoSnapshot == nombreProductoSnapshot)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioSnapshot, precioUnitarioSnapshot) || other.precioUnitarioSnapshot == precioUnitarioSnapshot)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pedidoId,productoId,nombreProductoSnapshot,cantidad,precioUnitarioSnapshot,unidadMedida);

@override
String toString() {
  return 'PedidoItemModel(id: $id, pedidoId: $pedidoId, productoId: $productoId, nombreProductoSnapshot: $nombreProductoSnapshot, cantidad: $cantidad, precioUnitarioSnapshot: $precioUnitarioSnapshot, unidadMedida: $unidadMedida)';
}


}

/// @nodoc
abstract mixin class $PedidoItemModelCopyWith<$Res>  {
  factory $PedidoItemModelCopyWith(PedidoItemModel value, $Res Function(PedidoItemModel) _then) = _$PedidoItemModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'pedido_id') String pedidoId,@JsonKey(name: 'producto_id') String productoId,@JsonKey(name: 'nombre_producto_snapshot') String nombreProductoSnapshot, int cantidad,@JsonKey(name: 'precio_unitario_snapshot') int precioUnitarioSnapshot,@UnidadMedidaConverter()@JsonKey(name: 'unidad_medida') UnidadMedida? unidadMedida
});




}
/// @nodoc
class _$PedidoItemModelCopyWithImpl<$Res>
    implements $PedidoItemModelCopyWith<$Res> {
  _$PedidoItemModelCopyWithImpl(this._self, this._then);

  final PedidoItemModel _self;
  final $Res Function(PedidoItemModel) _then;

/// Create a copy of PedidoItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pedidoId = null,Object? productoId = null,Object? nombreProductoSnapshot = null,Object? cantidad = null,Object? precioUnitarioSnapshot = null,Object? unidadMedida = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pedidoId: null == pedidoId ? _self.pedidoId : pedidoId // ignore: cast_nullable_to_non_nullable
as String,productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,nombreProductoSnapshot: null == nombreProductoSnapshot ? _self.nombreProductoSnapshot : nombreProductoSnapshot // ignore: cast_nullable_to_non_nullable
as String,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioSnapshot: null == precioUnitarioSnapshot ? _self.precioUnitarioSnapshot : precioUnitarioSnapshot // ignore: cast_nullable_to_non_nullable
as int,unidadMedida: freezed == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida?,
  ));
}

}


/// Adds pattern-matching-related methods to [PedidoItemModel].
extension PedidoItemModelPatterns on PedidoItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PedidoItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PedidoItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PedidoItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PedidoItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PedidoItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PedidoItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pedido_id')  String pedidoId, @JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'nombre_producto_snapshot')  String nombreProductoSnapshot,  int cantidad, @JsonKey(name: 'precio_unitario_snapshot')  int precioUnitarioSnapshot, @UnidadMedidaConverter()@JsonKey(name: 'unidad_medida')  UnidadMedida? unidadMedida)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PedidoItemModel() when $default != null:
return $default(_that.id,_that.pedidoId,_that.productoId,_that.nombreProductoSnapshot,_that.cantidad,_that.precioUnitarioSnapshot,_that.unidadMedida);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'pedido_id')  String pedidoId, @JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'nombre_producto_snapshot')  String nombreProductoSnapshot,  int cantidad, @JsonKey(name: 'precio_unitario_snapshot')  int precioUnitarioSnapshot, @UnidadMedidaConverter()@JsonKey(name: 'unidad_medida')  UnidadMedida? unidadMedida)  $default,) {final _that = this;
switch (_that) {
case _PedidoItemModel():
return $default(_that.id,_that.pedidoId,_that.productoId,_that.nombreProductoSnapshot,_that.cantidad,_that.precioUnitarioSnapshot,_that.unidadMedida);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'pedido_id')  String pedidoId, @JsonKey(name: 'producto_id')  String productoId, @JsonKey(name: 'nombre_producto_snapshot')  String nombreProductoSnapshot,  int cantidad, @JsonKey(name: 'precio_unitario_snapshot')  int precioUnitarioSnapshot, @UnidadMedidaConverter()@JsonKey(name: 'unidad_medida')  UnidadMedida? unidadMedida)?  $default,) {final _that = this;
switch (_that) {
case _PedidoItemModel() when $default != null:
return $default(_that.id,_that.pedidoId,_that.productoId,_that.nombreProductoSnapshot,_that.cantidad,_that.precioUnitarioSnapshot,_that.unidadMedida);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PedidoItemModel implements PedidoItemModel {
  const _PedidoItemModel({required this.id, @JsonKey(name: 'pedido_id') required this.pedidoId, @JsonKey(name: 'producto_id') required this.productoId, @JsonKey(name: 'nombre_producto_snapshot') required this.nombreProductoSnapshot, required this.cantidad, @JsonKey(name: 'precio_unitario_snapshot') required this.precioUnitarioSnapshot, @UnidadMedidaConverter()@JsonKey(name: 'unidad_medida') this.unidadMedida});
  factory _PedidoItemModel.fromJson(Map<String, dynamic> json) => _$PedidoItemModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'pedido_id') final  String pedidoId;
@override@JsonKey(name: 'producto_id') final  String productoId;
@override@JsonKey(name: 'nombre_producto_snapshot') final  String nombreProductoSnapshot;
@override final  int cantidad;
@override@JsonKey(name: 'precio_unitario_snapshot') final  int precioUnitarioSnapshot;
@override@UnidadMedidaConverter()@JsonKey(name: 'unidad_medida') final  UnidadMedida? unidadMedida;

/// Create a copy of PedidoItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PedidoItemModelCopyWith<_PedidoItemModel> get copyWith => __$PedidoItemModelCopyWithImpl<_PedidoItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PedidoItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PedidoItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.pedidoId, pedidoId) || other.pedidoId == pedidoId)&&(identical(other.productoId, productoId) || other.productoId == productoId)&&(identical(other.nombreProductoSnapshot, nombreProductoSnapshot) || other.nombreProductoSnapshot == nombreProductoSnapshot)&&(identical(other.cantidad, cantidad) || other.cantidad == cantidad)&&(identical(other.precioUnitarioSnapshot, precioUnitarioSnapshot) || other.precioUnitarioSnapshot == precioUnitarioSnapshot)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,pedidoId,productoId,nombreProductoSnapshot,cantidad,precioUnitarioSnapshot,unidadMedida);

@override
String toString() {
  return 'PedidoItemModel(id: $id, pedidoId: $pedidoId, productoId: $productoId, nombreProductoSnapshot: $nombreProductoSnapshot, cantidad: $cantidad, precioUnitarioSnapshot: $precioUnitarioSnapshot, unidadMedida: $unidadMedida)';
}


}

/// @nodoc
abstract mixin class _$PedidoItemModelCopyWith<$Res> implements $PedidoItemModelCopyWith<$Res> {
  factory _$PedidoItemModelCopyWith(_PedidoItemModel value, $Res Function(_PedidoItemModel) _then) = __$PedidoItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'pedido_id') String pedidoId,@JsonKey(name: 'producto_id') String productoId,@JsonKey(name: 'nombre_producto_snapshot') String nombreProductoSnapshot, int cantidad,@JsonKey(name: 'precio_unitario_snapshot') int precioUnitarioSnapshot,@UnidadMedidaConverter()@JsonKey(name: 'unidad_medida') UnidadMedida? unidadMedida
});




}
/// @nodoc
class __$PedidoItemModelCopyWithImpl<$Res>
    implements _$PedidoItemModelCopyWith<$Res> {
  __$PedidoItemModelCopyWithImpl(this._self, this._then);

  final _PedidoItemModel _self;
  final $Res Function(_PedidoItemModel) _then;

/// Create a copy of PedidoItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pedidoId = null,Object? productoId = null,Object? nombreProductoSnapshot = null,Object? cantidad = null,Object? precioUnitarioSnapshot = null,Object? unidadMedida = freezed,}) {
  return _then(_PedidoItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pedidoId: null == pedidoId ? _self.pedidoId : pedidoId // ignore: cast_nullable_to_non_nullable
as String,productoId: null == productoId ? _self.productoId : productoId // ignore: cast_nullable_to_non_nullable
as String,nombreProductoSnapshot: null == nombreProductoSnapshot ? _self.nombreProductoSnapshot : nombreProductoSnapshot // ignore: cast_nullable_to_non_nullable
as String,cantidad: null == cantidad ? _self.cantidad : cantidad // ignore: cast_nullable_to_non_nullable
as int,precioUnitarioSnapshot: null == precioUnitarioSnapshot ? _self.precioUnitarioSnapshot : precioUnitarioSnapshot // ignore: cast_nullable_to_non_nullable
as int,unidadMedida: freezed == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida?,
  ));
}


}

// dart format on
