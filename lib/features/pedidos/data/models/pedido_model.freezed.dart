// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedido_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PedidoModel {

 String get id;@JsonKey(name: 'cliente_id') String get clienteId;@JsonKey(name: 'sucursal_id') String get sucursalId;@JsonKey(name: 'repartidor_id') String? get repartidorId;@JsonKey(name: 'cliente_nombre_snapshot') String get clienteNombreSnapshot;@JsonKey(name: 'cliente_telefono_snapshot') String get clienteTelefonoSnapshot;@JsonKey(name: 'direccion_snapshot') String get direccionSnapshot; int get subtotal;@JsonKey(name: 'costo_envio') int get costoEnvio;@JsonKey(name: 'descuentos_aplicados') int get descuentosAplicados; int get total; EstadoPedido get estado;@JsonKey(name: 'url_evidencia_entrega') String? get urlEvidenciaEntrega;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;@JsonKey(name: 'modo_entrega') ModoEntrega get modoEntrega;@JsonKey(name: 'fecha_entrega_estimada') DateTime? get fechaEntregaEstimada;@JsonKey(name: 'fecha_entrega') DateTime? get fechaEntrega;@JsonKey(name: 'idempotency_key') String? get idempotencyKey;@JsonKey(includeFromJson: false, includeToJson: false) String? get codigoConfirmacion;@JsonKey(name: 'detalles_pedido') List<PedidoItemModel> get items;
/// Create a copy of PedidoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PedidoModelCopyWith<PedidoModel> get copyWith => _$PedidoModelCopyWithImpl<PedidoModel>(this as PedidoModel, _$identity);

  /// Serializes this PedidoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PedidoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clienteId, clienteId) || other.clienteId == clienteId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.repartidorId, repartidorId) || other.repartidorId == repartidorId)&&(identical(other.clienteNombreSnapshot, clienteNombreSnapshot) || other.clienteNombreSnapshot == clienteNombreSnapshot)&&(identical(other.clienteTelefonoSnapshot, clienteTelefonoSnapshot) || other.clienteTelefonoSnapshot == clienteTelefonoSnapshot)&&(identical(other.direccionSnapshot, direccionSnapshot) || other.direccionSnapshot == direccionSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.descuentosAplicados, descuentosAplicados) || other.descuentosAplicados == descuentosAplicados)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.urlEvidenciaEntrega, urlEvidenciaEntrega) || other.urlEvidenciaEntrega == urlEvidenciaEntrega)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.codigoConfirmacion, codigoConfirmacion) || other.codigoConfirmacion == codigoConfirmacion)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clienteId,sucursalId,repartidorId,clienteNombreSnapshot,clienteTelefonoSnapshot,direccionSnapshot,subtotal,costoEnvio,descuentosAplicados,total,estado,urlEvidenciaEntrega,fechaCreacion,modoEntrega,fechaEntregaEstimada,fechaEntrega,idempotencyKey,codigoConfirmacion,const DeepCollectionEquality().hash(items)]);

@override
String toString() {
  return 'PedidoModel(id: $id, clienteId: $clienteId, sucursalId: $sucursalId, repartidorId: $repartidorId, clienteNombreSnapshot: $clienteNombreSnapshot, clienteTelefonoSnapshot: $clienteTelefonoSnapshot, direccionSnapshot: $direccionSnapshot, subtotal: $subtotal, costoEnvio: $costoEnvio, descuentosAplicados: $descuentosAplicados, total: $total, estado: $estado, urlEvidenciaEntrega: $urlEvidenciaEntrega, fechaCreacion: $fechaCreacion, modoEntrega: $modoEntrega, fechaEntregaEstimada: $fechaEntregaEstimada, fechaEntrega: $fechaEntrega, idempotencyKey: $idempotencyKey, codigoConfirmacion: $codigoConfirmacion, items: $items)';
}


}

/// @nodoc
abstract mixin class $PedidoModelCopyWith<$Res>  {
  factory $PedidoModelCopyWith(PedidoModel value, $Res Function(PedidoModel) _then) = _$PedidoModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'cliente_id') String clienteId,@JsonKey(name: 'sucursal_id') String sucursalId,@JsonKey(name: 'repartidor_id') String? repartidorId,@JsonKey(name: 'cliente_nombre_snapshot') String clienteNombreSnapshot,@JsonKey(name: 'cliente_telefono_snapshot') String clienteTelefonoSnapshot,@JsonKey(name: 'direccion_snapshot') String direccionSnapshot, int subtotal,@JsonKey(name: 'costo_envio') int costoEnvio,@JsonKey(name: 'descuentos_aplicados') int descuentosAplicados, int total, EstadoPedido estado,@JsonKey(name: 'url_evidencia_entrega') String? urlEvidenciaEntrega,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'modo_entrega') ModoEntrega modoEntrega,@JsonKey(name: 'fecha_entrega_estimada') DateTime? fechaEntregaEstimada,@JsonKey(name: 'fecha_entrega') DateTime? fechaEntrega,@JsonKey(name: 'idempotency_key') String? idempotencyKey,@JsonKey(includeFromJson: false, includeToJson: false) String? codigoConfirmacion,@JsonKey(name: 'detalles_pedido') List<PedidoItemModel> items
});




}
/// @nodoc
class _$PedidoModelCopyWithImpl<$Res>
    implements $PedidoModelCopyWith<$Res> {
  _$PedidoModelCopyWithImpl(this._self, this._then);

  final PedidoModel _self;
  final $Res Function(PedidoModel) _then;

/// Create a copy of PedidoModel
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
as List<PedidoItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PedidoModel].
extension PedidoModelPatterns on PedidoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PedidoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PedidoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PedidoModel value)  $default,){
final _that = this;
switch (_that) {
case _PedidoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PedidoModel value)?  $default,){
final _that = this;
switch (_that) {
case _PedidoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'cliente_id')  String clienteId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'repartidor_id')  String? repartidorId, @JsonKey(name: 'cliente_nombre_snapshot')  String clienteNombreSnapshot, @JsonKey(name: 'cliente_telefono_snapshot')  String clienteTelefonoSnapshot, @JsonKey(name: 'direccion_snapshot')  String direccionSnapshot,  int subtotal, @JsonKey(name: 'costo_envio')  int costoEnvio, @JsonKey(name: 'descuentos_aplicados')  int descuentosAplicados,  int total,  EstadoPedido estado, @JsonKey(name: 'url_evidencia_entrega')  String? urlEvidenciaEntrega, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'modo_entrega')  ModoEntrega modoEntrega, @JsonKey(name: 'fecha_entrega_estimada')  DateTime? fechaEntregaEstimada, @JsonKey(name: 'fecha_entrega')  DateTime? fechaEntrega, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(includeFromJson: false, includeToJson: false)  String? codigoConfirmacion, @JsonKey(name: 'detalles_pedido')  List<PedidoItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PedidoModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'cliente_id')  String clienteId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'repartidor_id')  String? repartidorId, @JsonKey(name: 'cliente_nombre_snapshot')  String clienteNombreSnapshot, @JsonKey(name: 'cliente_telefono_snapshot')  String clienteTelefonoSnapshot, @JsonKey(name: 'direccion_snapshot')  String direccionSnapshot,  int subtotal, @JsonKey(name: 'costo_envio')  int costoEnvio, @JsonKey(name: 'descuentos_aplicados')  int descuentosAplicados,  int total,  EstadoPedido estado, @JsonKey(name: 'url_evidencia_entrega')  String? urlEvidenciaEntrega, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'modo_entrega')  ModoEntrega modoEntrega, @JsonKey(name: 'fecha_entrega_estimada')  DateTime? fechaEntregaEstimada, @JsonKey(name: 'fecha_entrega')  DateTime? fechaEntrega, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(includeFromJson: false, includeToJson: false)  String? codigoConfirmacion, @JsonKey(name: 'detalles_pedido')  List<PedidoItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _PedidoModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'cliente_id')  String clienteId, @JsonKey(name: 'sucursal_id')  String sucursalId, @JsonKey(name: 'repartidor_id')  String? repartidorId, @JsonKey(name: 'cliente_nombre_snapshot')  String clienteNombreSnapshot, @JsonKey(name: 'cliente_telefono_snapshot')  String clienteTelefonoSnapshot, @JsonKey(name: 'direccion_snapshot')  String direccionSnapshot,  int subtotal, @JsonKey(name: 'costo_envio')  int costoEnvio, @JsonKey(name: 'descuentos_aplicados')  int descuentosAplicados,  int total,  EstadoPedido estado, @JsonKey(name: 'url_evidencia_entrega')  String? urlEvidenciaEntrega, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'modo_entrega')  ModoEntrega modoEntrega, @JsonKey(name: 'fecha_entrega_estimada')  DateTime? fechaEntregaEstimada, @JsonKey(name: 'fecha_entrega')  DateTime? fechaEntrega, @JsonKey(name: 'idempotency_key')  String? idempotencyKey, @JsonKey(includeFromJson: false, includeToJson: false)  String? codigoConfirmacion, @JsonKey(name: 'detalles_pedido')  List<PedidoItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _PedidoModel() when $default != null:
return $default(_that.id,_that.clienteId,_that.sucursalId,_that.repartidorId,_that.clienteNombreSnapshot,_that.clienteTelefonoSnapshot,_that.direccionSnapshot,_that.subtotal,_that.costoEnvio,_that.descuentosAplicados,_that.total,_that.estado,_that.urlEvidenciaEntrega,_that.fechaCreacion,_that.modoEntrega,_that.fechaEntregaEstimada,_that.fechaEntrega,_that.idempotencyKey,_that.codigoConfirmacion,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PedidoModel implements PedidoModel {
  const _PedidoModel({required this.id, @JsonKey(name: 'cliente_id') required this.clienteId, @JsonKey(name: 'sucursal_id') required this.sucursalId, @JsonKey(name: 'repartidor_id') this.repartidorId, @JsonKey(name: 'cliente_nombre_snapshot') required this.clienteNombreSnapshot, @JsonKey(name: 'cliente_telefono_snapshot') required this.clienteTelefonoSnapshot, @JsonKey(name: 'direccion_snapshot') required this.direccionSnapshot, required this.subtotal, @JsonKey(name: 'costo_envio') required this.costoEnvio, @JsonKey(name: 'descuentos_aplicados') required this.descuentosAplicados, required this.total, required this.estado, @JsonKey(name: 'url_evidencia_entrega') this.urlEvidenciaEntrega, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'modo_entrega') required this.modoEntrega, @JsonKey(name: 'fecha_entrega_estimada') this.fechaEntregaEstimada, @JsonKey(name: 'fecha_entrega') this.fechaEntrega, @JsonKey(name: 'idempotency_key') this.idempotencyKey, @JsonKey(includeFromJson: false, includeToJson: false) this.codigoConfirmacion, @JsonKey(name: 'detalles_pedido') final  List<PedidoItemModel> items = const []}): _items = items;
  factory _PedidoModel.fromJson(Map<String, dynamic> json) => _$PedidoModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'cliente_id') final  String clienteId;
@override@JsonKey(name: 'sucursal_id') final  String sucursalId;
@override@JsonKey(name: 'repartidor_id') final  String? repartidorId;
@override@JsonKey(name: 'cliente_nombre_snapshot') final  String clienteNombreSnapshot;
@override@JsonKey(name: 'cliente_telefono_snapshot') final  String clienteTelefonoSnapshot;
@override@JsonKey(name: 'direccion_snapshot') final  String direccionSnapshot;
@override final  int subtotal;
@override@JsonKey(name: 'costo_envio') final  int costoEnvio;
@override@JsonKey(name: 'descuentos_aplicados') final  int descuentosAplicados;
@override final  int total;
@override final  EstadoPedido estado;
@override@JsonKey(name: 'url_evidencia_entrega') final  String? urlEvidenciaEntrega;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;
@override@JsonKey(name: 'modo_entrega') final  ModoEntrega modoEntrega;
@override@JsonKey(name: 'fecha_entrega_estimada') final  DateTime? fechaEntregaEstimada;
@override@JsonKey(name: 'fecha_entrega') final  DateTime? fechaEntrega;
@override@JsonKey(name: 'idempotency_key') final  String? idempotencyKey;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? codigoConfirmacion;
 final  List<PedidoItemModel> _items;
@override@JsonKey(name: 'detalles_pedido') List<PedidoItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PedidoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PedidoModelCopyWith<_PedidoModel> get copyWith => __$PedidoModelCopyWithImpl<_PedidoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PedidoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PedidoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clienteId, clienteId) || other.clienteId == clienteId)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.repartidorId, repartidorId) || other.repartidorId == repartidorId)&&(identical(other.clienteNombreSnapshot, clienteNombreSnapshot) || other.clienteNombreSnapshot == clienteNombreSnapshot)&&(identical(other.clienteTelefonoSnapshot, clienteTelefonoSnapshot) || other.clienteTelefonoSnapshot == clienteTelefonoSnapshot)&&(identical(other.direccionSnapshot, direccionSnapshot) || other.direccionSnapshot == direccionSnapshot)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.costoEnvio, costoEnvio) || other.costoEnvio == costoEnvio)&&(identical(other.descuentosAplicados, descuentosAplicados) || other.descuentosAplicados == descuentosAplicados)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.urlEvidenciaEntrega, urlEvidenciaEntrega) || other.urlEvidenciaEntrega == urlEvidenciaEntrega)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.modoEntrega, modoEntrega) || other.modoEntrega == modoEntrega)&&(identical(other.fechaEntregaEstimada, fechaEntregaEstimada) || other.fechaEntregaEstimada == fechaEntregaEstimada)&&(identical(other.fechaEntrega, fechaEntrega) || other.fechaEntrega == fechaEntrega)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.codigoConfirmacion, codigoConfirmacion) || other.codigoConfirmacion == codigoConfirmacion)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,clienteId,sucursalId,repartidorId,clienteNombreSnapshot,clienteTelefonoSnapshot,direccionSnapshot,subtotal,costoEnvio,descuentosAplicados,total,estado,urlEvidenciaEntrega,fechaCreacion,modoEntrega,fechaEntregaEstimada,fechaEntrega,idempotencyKey,codigoConfirmacion,const DeepCollectionEquality().hash(_items)]);

@override
String toString() {
  return 'PedidoModel(id: $id, clienteId: $clienteId, sucursalId: $sucursalId, repartidorId: $repartidorId, clienteNombreSnapshot: $clienteNombreSnapshot, clienteTelefonoSnapshot: $clienteTelefonoSnapshot, direccionSnapshot: $direccionSnapshot, subtotal: $subtotal, costoEnvio: $costoEnvio, descuentosAplicados: $descuentosAplicados, total: $total, estado: $estado, urlEvidenciaEntrega: $urlEvidenciaEntrega, fechaCreacion: $fechaCreacion, modoEntrega: $modoEntrega, fechaEntregaEstimada: $fechaEntregaEstimada, fechaEntrega: $fechaEntrega, idempotencyKey: $idempotencyKey, codigoConfirmacion: $codigoConfirmacion, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PedidoModelCopyWith<$Res> implements $PedidoModelCopyWith<$Res> {
  factory _$PedidoModelCopyWith(_PedidoModel value, $Res Function(_PedidoModel) _then) = __$PedidoModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'cliente_id') String clienteId,@JsonKey(name: 'sucursal_id') String sucursalId,@JsonKey(name: 'repartidor_id') String? repartidorId,@JsonKey(name: 'cliente_nombre_snapshot') String clienteNombreSnapshot,@JsonKey(name: 'cliente_telefono_snapshot') String clienteTelefonoSnapshot,@JsonKey(name: 'direccion_snapshot') String direccionSnapshot, int subtotal,@JsonKey(name: 'costo_envio') int costoEnvio,@JsonKey(name: 'descuentos_aplicados') int descuentosAplicados, int total, EstadoPedido estado,@JsonKey(name: 'url_evidencia_entrega') String? urlEvidenciaEntrega,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'modo_entrega') ModoEntrega modoEntrega,@JsonKey(name: 'fecha_entrega_estimada') DateTime? fechaEntregaEstimada,@JsonKey(name: 'fecha_entrega') DateTime? fechaEntrega,@JsonKey(name: 'idempotency_key') String? idempotencyKey,@JsonKey(includeFromJson: false, includeToJson: false) String? codigoConfirmacion,@JsonKey(name: 'detalles_pedido') List<PedidoItemModel> items
});




}
/// @nodoc
class __$PedidoModelCopyWithImpl<$Res>
    implements _$PedidoModelCopyWith<$Res> {
  __$PedidoModelCopyWithImpl(this._self, this._then);

  final _PedidoModel _self;
  final $Res Function(_PedidoModel) _then;

/// Create a copy of PedidoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clienteId = null,Object? sucursalId = null,Object? repartidorId = freezed,Object? clienteNombreSnapshot = null,Object? clienteTelefonoSnapshot = null,Object? direccionSnapshot = null,Object? subtotal = null,Object? costoEnvio = null,Object? descuentosAplicados = null,Object? total = null,Object? estado = null,Object? urlEvidenciaEntrega = freezed,Object? fechaCreacion = null,Object? modoEntrega = null,Object? fechaEntregaEstimada = freezed,Object? fechaEntrega = freezed,Object? idempotencyKey = freezed,Object? codigoConfirmacion = freezed,Object? items = null,}) {
  return _then(_PedidoModel(
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
as List<PedidoItemModel>,
  ));
}


}

// dart format on
