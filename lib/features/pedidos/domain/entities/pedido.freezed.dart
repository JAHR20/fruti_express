// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedido.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pedido {

 String get id; String get clienteId; String get sucursalId; String? get repartidorId; String get clienteNombreSnapshot; String get clienteTelefonoSnapshot; String get direccionSnapshot; int get subtotal; int get costoEnvio; int get descuentosAplicados; int get total; EstadoPedido get estado; String? get urlEvidenciaEntrega; DateTime get fechaCreacion; ModoEntrega get modoEntrega; DateTime? get fechaEntregaEstimada; DateTime? get fechaEntrega; String? get idempotencyKey; String? get codigoConfirmacion; List<PedidoItem> get items;
/// Create a copy of Pedido
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PedidoCopyWith<Pedido> get copyWith => _$PedidoCopyWithImpl<Pedido>(this as Pedido, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pedido&&(identical(other.id, id) || other.id == id)&&(identical(other.clienteId, clienteId) || other.clienteId == clienteId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.repartidorId, repartidorId) || other.repartidorId == repartidorId)&&(identical(other.clienteNombreSnapshot, clienteNombreSnapshot) || other.clienteNombreSnapshot == clienteNombreSnapshot)&&(identical(other.clienteTelefonoSnapshot, clienteTelefonoSnapshot) || other.clienteTelefonoSnapshot == clienteTelefonoSnapshot)&&(identical(other.direccionSnapshot, direccionSnapshot) || other.direccionSnapshot == direccionSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.descuentosAplicados, descuentosAplicados) || other.descuentosAplicados == descuentosAplicados)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.urlEvidenciaEntrega, urlEvidenciaEntrega) || other.urlEvidenciaEntrega == urlEvidenciaEntrega)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.codigoConfirmacion, codigoConfirmacion) || other.codigoConfirmacion == codigoConfirmacion)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,clienteId,sucursalId,repartidorId,clienteNombreSnapshot,clienteTelefonoSnapshot,direccionSnapshot,subtotal,costoEnvio,descuentosAplicados,total,estado,urlEvidenciaEntrega,fechaCreacion,modoEntrega,fechaEntregaEstimada,fechaEntrega,idempotencyKey,codigoConfirmacion,const DeepCollectionEquality().hash(items)]);

@override
String toString() {
  return 'Pedido(id: $id, clienteId: $clienteId, sucursalId: $sucursalId, repartidorId: $repartidorId, clienteNombreSnapshot: $clienteNombreSnapshot, clienteTelefonoSnapshot: $clienteTelefonoSnapshot, direccionSnapshot: $direccionSnapshot, subtotal: $subtotal, costoEnvio: $costoEnvio, descuentosAplicados: $descuentosAplicados, total: $total, estado: $estado, urlEvidenciaEntrega: $urlEvidenciaEntrega, fechaCreacion: $fechaCreacion, modoEntrega: $modoEntrega, fechaEntregaEstimada: $fechaEntregaEstimada, fechaEntrega: $fechaEntrega, idempotencyKey: $idempotencyKey, codigoConfirmacion: $codigoConfirmacion, items: $items)';
}


}

/// @nodoc
abstract mixin class $PedidoCopyWith<$Res>  {
  factory $PedidoCopyWith(Pedido value, $Res Function(Pedido) _then) = _$PedidoCopyWithImpl;
@useResult
$Res call({
 String id, String clienteId, String sucursalId, String? repartidorId, String clienteNombreSnapshot, String clienteTelefonoSnapshot, String direccionSnapshot, int subtotal, int costoEnvio, int descuentosAplicados, int total, EstadoPedido estado, String? urlEvidenciaEntrega, DateTime fechaCreacion, ModoEntrega modoEntrega, DateTime? fechaEntregaEstimada, DateTime? fechaEntrega, String? idempotencyKey, String? codigoConfirmacion, List<PedidoItem> items
});




}
/// @nodoc
class _$PedidoCopyWithImpl<$Res>
    implements $PedidoCopyWith<$Res> {
  _$PedidoCopyWithImpl(this._self, this._then);

  final Pedido _self;
  final $Res Function(Pedido) _then;

/// Create a copy of Pedido
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clienteId = null,Object? sucursalId = null,Object? repartidorId = freezed,Object? clienteNombreSnapshot = null,Object? clienteTelefonoSnapshot = null,Object? direccionSnapshot = null,Object? subtotal = null,Object? costoEnvio = null,Object? descuentosAplicados = null,Object? total = null,Object? estado = null,Object? urlEvidenciaEntrega = freezed,Object? fechaCreacion = null,Object? modoEntrega = null,Object? fechaEntregaEstimada = freezed,Object? fechaEntrega = freezed,Object? idempotencyKey = freezed,Object? codigoConfirmacion = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clienteId: null == clienteId ? _self.clienteId : clienteId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,repartidorId: freezed == repartidorId ? _self.repartidorId : repartidorId // ignore: cast_nullable_to_non_nullable
as String?,clienteNombreSnapshot: null == clienteNombreSnapshot ? _self.clienteNombreSnapshot : clienteNombreSnapshot // ignore: cast_nullable_to_non_nullable
as String,clienteTelefonoSnapshot: null == clienteTelefonoSnapshot ? _self.clienteTelefonoSnapshot : clienteTelefonoSnapshot // ignore: cast_nullable_to_non_nullable
as String,direccionSnapshot: null == direccionSnapshot ? _self.direccionSnapshot : direccionSnapshot // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,costoEnvio: null == costoEnvio ? _self.costoEnvio : costoEnvio // ignore: cast_nullable_to_non_nullable
as int,descuentosAplicados: null == descuentosAplicados ? _self.descuentosAplicados : descuentosAplicados // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoPedido,urlEvidenciaEntrega: freezed == urlEvidenciaEntrega ? _self.urlEvidenciaEntrega : urlEvidenciaEntrega // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,modoEntrega: null == modoEntrega ? _self.modoEntrega : modoEntrega // ignore: cast_nullable_to_non_nullable
as ModoEntrega,fechaEntregaEstimada: freezed == fechaEntregaEstimada ? _self.fechaEntregaEstimada : fechaEntregaEstimada // ignore: cast_nullable_to_non_nullable
as DateTime?,fechaEntrega: freezed == fechaEntrega ? _self.fechaEntrega : fechaEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,codigoConfirmacion: freezed == codigoConfirmacion ? _self.codigoConfirmacion : codigoConfirmacion // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PedidoItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [Pedido].
extension PedidoPatterns on Pedido {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pedido value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pedido() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pedido value)  $default,){
final _that = this;
switch (_that) {
case _Pedido():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pedido value)?  $default,){
final _that = this;
switch (_that) {
case _Pedido() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clienteId,  String sucursalId,  String? repartidorId,  String clienteNombreSnapshot,  String clienteTelefonoSnapshot,  String direccionSnapshot,  int subtotal,  int costoEnvio,  int descuentosAplicados,  int total,  EstadoPedido estado,  String? urlEvidenciaEntrega,  DateTime fechaCreacion,  ModoEntrega modoEntrega,  DateTime? fechaEntregaEstimada,  DateTime? fechaEntrega,  String? idempotencyKey,  String? codigoConfirmacion,  List<PedidoItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pedido() when $default != null:
return $default(_that.id,_that.clienteId,_that.sucursalId,_that.repartidorId,_that.clienteNombreSnapshot,_that.clienteTelefonoSnapshot,_that.direccionSnapshot,_that.subtotal,_that.costoEnvio,_that.descuentosAplicados,_that.total,_that.estado,_that.urlEvidenciaEntrega,_that.fechaCreacion,_that.modoEntrega,_that.fechaEntregaEstimada,_that.fechaEntrega,_that.idempotencyKey,_that.codigoConfirmacion,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clienteId,  String sucursalId,  String? repartidorId,  String clienteNombreSnapshot,  String clienteTelefonoSnapshot,  String direccionSnapshot,  int subtotal,  int costoEnvio,  int descuentosAplicados,  int total,  EstadoPedido estado,  String? urlEvidenciaEntrega,  DateTime fechaCreacion,  ModoEntrega modoEntrega,  DateTime? fechaEntregaEstimada,  DateTime? fechaEntrega,  String? idempotencyKey,  String? codigoConfirmacion,  List<PedidoItem> items)  $default,) {final _that = this;
switch (_that) {
case _Pedido():
return $default(_that.id,_that.clienteId,_that.sucursalId,_that.repartidorId,_that.clienteNombreSnapshot,_that.clienteTelefonoSnapshot,_that.direccionSnapshot,_that.subtotal,_that.costoEnvio,_that.descuentosAplicados,_that.total,_that.estado,_that.urlEvidenciaEntrega,_that.fechaCreacion,_that.modoEntrega,_that.fechaEntregaEstimada,_that.fechaEntrega,_that.idempotencyKey,_that.codigoConfirmacion,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clienteId,  String sucursalId,  String? repartidorId,  String clienteNombreSnapshot,  String clienteTelefonoSnapshot,  String direccionSnapshot,  int subtotal,  int costoEnvio,  int descuentosAplicados,  int total,  EstadoPedido estado,  String? urlEvidenciaEntrega,  DateTime fechaCreacion,  ModoEntrega modoEntrega,  DateTime? fechaEntregaEstimada,  DateTime? fechaEntrega,  String? idempotencyKey,  String? codigoConfirmacion,  List<PedidoItem> items)?  $default,) {final _that = this;
switch (_that) {
case _Pedido() when $default != null:
return $default(_that.id,_that.clienteId,_that.sucursalId,_that.repartidorId,_that.clienteNombreSnapshot,_that.clienteTelefonoSnapshot,_that.direccionSnapshot,_that.subtotal,_that.costoEnvio,_that.descuentosAplicados,_that.total,_that.estado,_that.urlEvidenciaEntrega,_that.fechaCreacion,_that.modoEntrega,_that.fechaEntregaEstimada,_that.fechaEntrega,_that.idempotencyKey,_that.codigoConfirmacion,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Pedido implements Pedido {
  const _Pedido({required this.id, required this.clienteId, required this.sucursalId, this.repartidorId, required this.clienteNombreSnapshot, required this.clienteTelefonoSnapshot, required this.direccionSnapshot, required this.subtotal, required this.costoEnvio, required this.descuentosAplicados, required this.total, required this.estado, this.urlEvidenciaEntrega, required this.fechaCreacion, required this.modoEntrega, this.fechaEntregaEstimada, this.fechaEntrega, this.idempotencyKey, this.codigoConfirmacion, required final  List<PedidoItem> items}): _items = items;
  

@override final  String id;
@override final  String clienteId;
@override final  String sucursalId;
@override final  String? repartidorId;
@override final  String clienteNombreSnapshot;
@override final  String clienteTelefonoSnapshot;
@override final  String direccionSnapshot;
@override final  int subtotal;
@override final  int costoEnvio;
@override final  int descuentosAplicados;
@override final  int total;
@override final  EstadoPedido estado;
@override final  String? urlEvidenciaEntrega;
@override final  DateTime fechaCreacion;
@override final  ModoEntrega modoEntrega;
@override final  DateTime? fechaEntregaEstimada;
@override final  DateTime? fechaEntrega;
@override final  String? idempotencyKey;
@override final  String? codigoConfirmacion;
 final  List<PedidoItem> _items;
@override List<PedidoItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of Pedido
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PedidoCopyWith<_Pedido> get copyWith => __$PedidoCopyWithImpl<_Pedido>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pedido&&(identical(other.id, id) || other.id == id)&&(identical(other.clienteId, clienteId) || other.clienteId == clienteId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.repartidorId, repartidorId) || other.repartidorId == repartidorId)&&(identical(other.clienteNombreSnapshot, clienteNombreSnapshot) || other.clienteNombreSnapshot == clienteNombreSnapshot)&&(identical(other.clienteTelefonoSnapshot, clienteTelefonoSnapshot) || other.clienteTelefonoSnapshot == clienteTelefonoSnapshot)&&(identical(other.direccionSnapshot, direccionSnapshot) || other.direccionSnapshot == direccionSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.descuentosAplicados, descuentosAplicados) || other.descuentosAplicados == descuentosAplicados)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.urlEvidenciaEntrega, urlEvidenciaEntrega) || other.urlEvidenciaEntrega == urlEvidenciaEntrega)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.codigoConfirmacion, codigoConfirmacion) || other.codigoConfirmacion == codigoConfirmacion)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,clienteId,sucursalId,repartidorId,clienteNombreSnapshot,clienteTelefonoSnapshot,direccionSnapshot,subtotal,costoEnvio,descuentosAplicados,total,estado,urlEvidenciaEntrega,fechaCreacion,modoEntrega,fechaEntregaEstimada,fechaEntrega,idempotencyKey,codigoConfirmacion,const DeepCollectionEquality().hash(_items)]);

@override
String toString() {
  return 'Pedido(id: $id, clienteId: $clienteId, sucursalId: $sucursalId, repartidorId: $repartidorId, clienteNombreSnapshot: $clienteNombreSnapshot, clienteTelefonoSnapshot: $clienteTelefonoSnapshot, direccionSnapshot: $direccionSnapshot, subtotal: $subtotal, costoEnvio: $costoEnvio, descuentosAplicados: $descuentosAplicados, total: $total, estado: $estado, urlEvidenciaEntrega: $urlEvidenciaEntrega, fechaCreacion: $fechaCreacion, modoEntrega: $modoEntrega, fechaEntregaEstimada: $fechaEntregaEstimada, fechaEntrega: $fechaEntrega, idempotencyKey: $idempotencyKey, codigoConfirmacion: $codigoConfirmacion, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PedidoCopyWith<$Res> implements $PedidoCopyWith<$Res> {
  factory _$PedidoCopyWith(_Pedido value, $Res Function(_Pedido) _then) = __$PedidoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clienteId, String sucursalId, String? repartidorId, String clienteNombreSnapshot, String clienteTelefonoSnapshot, String direccionSnapshot, int subtotal, int costoEnvio, int descuentosAplicados, int total, EstadoPedido estado, String? urlEvidenciaEntrega, DateTime fechaCreacion, ModoEntrega modoEntrega, DateTime? fechaEntregaEstimada, DateTime? fechaEntrega, String? idempotencyKey, String? codigoConfirmacion, List<PedidoItem> items
});




}
/// @nodoc
class __$PedidoCopyWithImpl<$Res>
    implements _$PedidoCopyWith<$Res> {
  __$PedidoCopyWithImpl(this._self, this._then);

  final _Pedido _self;
  final $Res Function(_Pedido) _then;

/// Create a copy of Pedido
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clienteId = null,Object? sucursalId = null,Object? repartidorId = freezed,Object? clienteNombreSnapshot = null,Object? clienteTelefonoSnapshot = null,Object? direccionSnapshot = null,Object? subtotal = null,Object? costoEnvio = null,Object? descuentosAplicados = null,Object? total = null,Object? estado = null,Object? urlEvidenciaEntrega = freezed,Object? fechaCreacion = null,Object? modoEntrega = null,Object? fechaEntregaEstimada = freezed,Object? fechaEntrega = freezed,Object? idempotencyKey = freezed,Object? codigoConfirmacion = freezed,Object? items = null,}) {
  return _then(_Pedido(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clienteId: null == clienteId ? _self.clienteId : clienteId // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,repartidorId: freezed == repartidorId ? _self.repartidorId : repartidorId // ignore: cast_nullable_to_non_nullable
as String?,clienteNombreSnapshot: null == clienteNombreSnapshot ? _self.clienteNombreSnapshot : clienteNombreSnapshot // ignore: cast_nullable_to_non_nullable
as String,clienteTelefonoSnapshot: null == clienteTelefonoSnapshot ? _self.clienteTelefonoSnapshot : clienteTelefonoSnapshot // ignore: cast_nullable_to_non_nullable
as String,direccionSnapshot: null == direccionSnapshot ? _self.direccionSnapshot : direccionSnapshot // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,costoEnvio: null == costoEnvio ? _self.costoEnvio : costoEnvio // ignore: cast_nullable_to_non_nullable
as int,descuentosAplicados: null == descuentosAplicados ? _self.descuentosAplicados : descuentosAplicados // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoPedido,urlEvidenciaEntrega: freezed == urlEvidenciaEntrega ? _self.urlEvidenciaEntrega : urlEvidenciaEntrega // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,modoEntrega: null == modoEntrega ? _self.modoEntrega : modoEntrega // ignore: cast_nullable_to_non_nullable
as ModoEntrega,fechaEntregaEstimada: freezed == fechaEntregaEstimada ? _self.fechaEntregaEstimada : fechaEntregaEstimada // ignore: cast_nullable_to_non_nullable
as DateTime?,fechaEntrega: freezed == fechaEntrega ? _self.fechaEntrega : fechaEntrega // ignore: cast_nullable_to_non_nullable
as DateTime?,idempotencyKey: freezed == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String?,codigoConfirmacion: freezed == codigoConfirmacion ? _self.codigoConfirmacion : codigoConfirmacion // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PedidoItem>,
  ));
}


}

// dart format on
