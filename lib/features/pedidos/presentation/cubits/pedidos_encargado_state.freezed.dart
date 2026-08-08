// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedidos_encargado_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PedidosEncargadoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PedidosEncargadoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidosEncargadoState()';
}


}

/// @nodoc
class $PedidosEncargadoStateCopyWith<$Res>  {
$PedidosEncargadoStateCopyWith(PedidosEncargadoState _, $Res Function(PedidosEncargadoState) __);
}


/// Adds pattern-matching-related methods to [PedidosEncargadoState].
extension PedidosEncargadoStatePatterns on PedidosEncargadoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Inicial value)?  inicial,TResult Function( _Cargando value)?  cargando,TResult Function( _Cargado value)?  cargado,TResult Function( _Error value)?  error,TResult Function( _Accionando value)?  accionando,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inicial() when inicial != null:
return inicial(_that);case _Cargando() when cargando != null:
return cargando(_that);case _Cargado() when cargado != null:
return cargado(_that);case _Error() when error != null:
return error(_that);case _Accionando() when accionando != null:
return accionando(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Inicial value)  inicial,required TResult Function( _Cargando value)  cargando,required TResult Function( _Cargado value)  cargado,required TResult Function( _Error value)  error,required TResult Function( _Accionando value)  accionando,}){
final _that = this;
switch (_that) {
case _Inicial():
return inicial(_that);case _Cargando():
return cargando(_that);case _Cargado():
return cargado(_that);case _Error():
return error(_that);case _Accionando():
return accionando(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Inicial value)?  inicial,TResult? Function( _Cargando value)?  cargando,TResult? Function( _Cargado value)?  cargado,TResult? Function( _Error value)?  error,TResult? Function( _Accionando value)?  accionando,}){
final _that = this;
switch (_that) {
case _Inicial() when inicial != null:
return inicial(_that);case _Cargando() when cargando != null:
return cargando(_that);case _Cargado() when cargado != null:
return cargado(_that);case _Error() when error != null:
return error(_that);case _Accionando() when accionando != null:
return accionando(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  inicial,TResult Function()?  cargando,TResult Function( List<Pedido> pedidos)?  cargado,TResult Function( String mensaje)?  error,TResult Function( List<Pedido> pedidos,  String pedidoId)?  accionando,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inicial() when inicial != null:
return inicial();case _Cargando() when cargando != null:
return cargando();case _Cargado() when cargado != null:
return cargado(_that.pedidos);case _Error() when error != null:
return error(_that.mensaje);case _Accionando() when accionando != null:
return accionando(_that.pedidos,_that.pedidoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  inicial,required TResult Function()  cargando,required TResult Function( List<Pedido> pedidos)  cargado,required TResult Function( String mensaje)  error,required TResult Function( List<Pedido> pedidos,  String pedidoId)  accionando,}) {final _that = this;
switch (_that) {
case _Inicial():
return inicial();case _Cargando():
return cargando();case _Cargado():
return cargado(_that.pedidos);case _Error():
return error(_that.mensaje);case _Accionando():
return accionando(_that.pedidos,_that.pedidoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  inicial,TResult? Function()?  cargando,TResult? Function( List<Pedido> pedidos)?  cargado,TResult? Function( String mensaje)?  error,TResult? Function( List<Pedido> pedidos,  String pedidoId)?  accionando,}) {final _that = this;
switch (_that) {
case _Inicial() when inicial != null:
return inicial();case _Cargando() when cargando != null:
return cargando();case _Cargado() when cargado != null:
return cargado(_that.pedidos);case _Error() when error != null:
return error(_that.mensaje);case _Accionando() when accionando != null:
return accionando(_that.pedidos,_that.pedidoId);case _:
  return null;

}
}

}

/// @nodoc


class _Inicial implements PedidosEncargadoState {
  const _Inicial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inicial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidosEncargadoState.inicial()';
}


}




/// @nodoc


class _Cargando implements PedidosEncargadoState {
  const _Cargando();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cargando);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidosEncargadoState.cargando()';
}


}




/// @nodoc


class _Cargado implements PedidosEncargadoState {
  const _Cargado(final  List<Pedido> pedidos): _pedidos = pedidos;
  

 final  List<Pedido> _pedidos;
 List<Pedido> get pedidos {
  if (_pedidos is EqualUnmodifiableListView) return _pedidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pedidos);
}


/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CargadoCopyWith<_Cargado> get copyWith => __$CargadoCopyWithImpl<_Cargado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cargado&&const DeepCollectionEquality().equals(other._pedidos, _pedidos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pedidos));

@override
String toString() {
  return 'PedidosEncargadoState.cargado(pedidos: $pedidos)';
}


}

/// @nodoc
abstract mixin class _$CargadoCopyWith<$Res> implements $PedidosEncargadoStateCopyWith<$Res> {
  factory _$CargadoCopyWith(_Cargado value, $Res Function(_Cargado) _then) = __$CargadoCopyWithImpl;
@useResult
$Res call({
 List<Pedido> pedidos
});




}
/// @nodoc
class __$CargadoCopyWithImpl<$Res>
    implements _$CargadoCopyWith<$Res> {
  __$CargadoCopyWithImpl(this._self, this._then);

  final _Cargado _self;
  final $Res Function(_Cargado) _then;

/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pedidos = null,}) {
  return _then(_Cargado(
null == pedidos ? _self._pedidos : pedidos // ignore: cast_nullable_to_non_nullable
as List<Pedido>,
  ));
}


}

/// @nodoc


class _Error implements PedidosEncargadoState {
  const _Error(this.mensaje);
  

 final  String mensaje;

/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.mensaje, mensaje) || other.mensaje == mensaje));
}


@override
int get hashCode => Object.hash(runtimeType,mensaje);

@override
String toString() {
  return 'PedidosEncargadoState.error(mensaje: $mensaje)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PedidosEncargadoStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String mensaje
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mensaje = null,}) {
  return _then(_Error(
null == mensaje ? _self.mensaje : mensaje // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Accionando implements PedidosEncargadoState {
  const _Accionando({required final  List<Pedido> pedidos, required this.pedidoId}): _pedidos = pedidos;
  

 final  List<Pedido> _pedidos;
 List<Pedido> get pedidos {
  if (_pedidos is EqualUnmodifiableListView) return _pedidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pedidos);
}

 final  String pedidoId;

/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccionandoCopyWith<_Accionando> get copyWith => __$AccionandoCopyWithImpl<_Accionando>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Accionando&&const DeepCollectionEquality().equals(other._pedidos, _pedidos)&&(identical(other.pedidoId, pedidoId) || other.pedidoId == pedidoId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pedidos),pedidoId);

@override
String toString() {
  return 'PedidosEncargadoState.accionando(pedidos: $pedidos, pedidoId: $pedidoId)';
}


}

/// @nodoc
abstract mixin class _$AccionandoCopyWith<$Res> implements $PedidosEncargadoStateCopyWith<$Res> {
  factory _$AccionandoCopyWith(_Accionando value, $Res Function(_Accionando) _then) = __$AccionandoCopyWithImpl;
@useResult
$Res call({
 List<Pedido> pedidos, String pedidoId
});




}
/// @nodoc
class __$AccionandoCopyWithImpl<$Res>
    implements _$AccionandoCopyWith<$Res> {
  __$AccionandoCopyWithImpl(this._self, this._then);

  final _Accionando _self;
  final $Res Function(_Accionando) _then;

/// Create a copy of PedidosEncargadoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pedidos = null,Object? pedidoId = null,}) {
  return _then(_Accionando(
pedidos: null == pedidos ? _self._pedidos : pedidos // ignore: cast_nullable_to_non_nullable
as List<Pedido>,pedidoId: null == pedidoId ? _self.pedidoId : pedidoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
