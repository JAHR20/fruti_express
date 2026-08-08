// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedido_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PedidoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PedidoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidoState()';
}


}

/// @nodoc
class $PedidoStateCopyWith<$Res>  {
$PedidoStateCopyWith(PedidoState _, $Res Function(PedidoState) __);
}


/// Adds pattern-matching-related methods to [PedidoState].
extension PedidoStatePatterns on PedidoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Procesando value)?  procesando,TResult Function( _EsperandoPago value)?  esperandoPago,TResult Function( _ConfirmandoPago value)?  confirmandoPago,TResult Function( _Completado value)?  completado,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Procesando() when procesando != null:
return procesando(_that);case _EsperandoPago() when esperandoPago != null:
return esperandoPago(_that);case _ConfirmandoPago() when confirmandoPago != null:
return confirmandoPago(_that);case _Completado() when completado != null:
return completado(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Procesando value)  procesando,required TResult Function( _EsperandoPago value)  esperandoPago,required TResult Function( _ConfirmandoPago value)  confirmandoPago,required TResult Function( _Completado value)  completado,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Procesando():
return procesando(_that);case _EsperandoPago():
return esperandoPago(_that);case _ConfirmandoPago():
return confirmandoPago(_that);case _Completado():
return completado(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Procesando value)?  procesando,TResult? Function( _EsperandoPago value)?  esperandoPago,TResult? Function( _ConfirmandoPago value)?  confirmandoPago,TResult? Function( _Completado value)?  completado,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Procesando() when procesando != null:
return procesando(_that);case _EsperandoPago() when esperandoPago != null:
return esperandoPago(_that);case _ConfirmandoPago() when confirmandoPago != null:
return confirmandoPago(_that);case _Completado() when completado != null:
return completado(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  procesando,TResult Function( Pedido pedido)?  esperandoPago,TResult Function()?  confirmandoPago,TResult Function( Pedido pedido)?  completado,TResult Function( String mensaje)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Procesando() when procesando != null:
return procesando();case _EsperandoPago() when esperandoPago != null:
return esperandoPago(_that.pedido);case _ConfirmandoPago() when confirmandoPago != null:
return confirmandoPago();case _Completado() when completado != null:
return completado(_that.pedido);case _Error() when error != null:
return error(_that.mensaje);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  procesando,required TResult Function( Pedido pedido)  esperandoPago,required TResult Function()  confirmandoPago,required TResult Function( Pedido pedido)  completado,required TResult Function( String mensaje)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Procesando():
return procesando();case _EsperandoPago():
return esperandoPago(_that.pedido);case _ConfirmandoPago():
return confirmandoPago();case _Completado():
return completado(_that.pedido);case _Error():
return error(_that.mensaje);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  procesando,TResult? Function( Pedido pedido)?  esperandoPago,TResult? Function()?  confirmandoPago,TResult? Function( Pedido pedido)?  completado,TResult? Function( String mensaje)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Procesando() when procesando != null:
return procesando();case _EsperandoPago() when esperandoPago != null:
return esperandoPago(_that.pedido);case _ConfirmandoPago() when confirmandoPago != null:
return confirmandoPago();case _Completado() when completado != null:
return completado(_that.pedido);case _Error() when error != null:
return error(_that.mensaje);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends PedidoState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidoState.initial()';
}


}




/// @nodoc


class _Procesando extends PedidoState {
  const _Procesando(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Procesando);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidoState.procesando()';
}


}




/// @nodoc


class _EsperandoPago extends PedidoState {
  const _EsperandoPago(this.pedido): super._();
  

 final  Pedido pedido;

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EsperandoPagoCopyWith<_EsperandoPago> get copyWith => __$EsperandoPagoCopyWithImpl<_EsperandoPago>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EsperandoPago&&(identical(other.pedido, pedido) || other.pedido == pedido));
}


@override
int get hashCode => Object.hash(runtimeType,pedido);

@override
String toString() {
  return 'PedidoState.esperandoPago(pedido: $pedido)';
}


}

/// @nodoc
abstract mixin class _$EsperandoPagoCopyWith<$Res> implements $PedidoStateCopyWith<$Res> {
  factory _$EsperandoPagoCopyWith(_EsperandoPago value, $Res Function(_EsperandoPago) _then) = __$EsperandoPagoCopyWithImpl;
@useResult
$Res call({
 Pedido pedido
});


$PedidoCopyWith<$Res> get pedido;

}
/// @nodoc
class __$EsperandoPagoCopyWithImpl<$Res>
    implements _$EsperandoPagoCopyWith<$Res> {
  __$EsperandoPagoCopyWithImpl(this._self, this._then);

  final _EsperandoPago _self;
  final $Res Function(_EsperandoPago) _then;

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pedido = null,}) {
  return _then(_EsperandoPago(
null == pedido ? _self.pedido : pedido // ignore: cast_nullable_to_non_nullable
as Pedido,
  ));
}

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PedidoCopyWith<$Res> get pedido {
  
  return $PedidoCopyWith<$Res>(_self.pedido, (value) {
    return _then(_self.copyWith(pedido: value));
  });
}
}

/// @nodoc


class _ConfirmandoPago extends PedidoState {
  const _ConfirmandoPago(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmandoPago);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PedidoState.confirmandoPago()';
}


}




/// @nodoc


class _Completado extends PedidoState {
  const _Completado(this.pedido): super._();
  

 final  Pedido pedido;

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletadoCopyWith<_Completado> get copyWith => __$CompletadoCopyWithImpl<_Completado>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completado&&(identical(other.pedido, pedido) || other.pedido == pedido));
}


@override
int get hashCode => Object.hash(runtimeType,pedido);

@override
String toString() {
  return 'PedidoState.completado(pedido: $pedido)';
}


}

/// @nodoc
abstract mixin class _$CompletadoCopyWith<$Res> implements $PedidoStateCopyWith<$Res> {
  factory _$CompletadoCopyWith(_Completado value, $Res Function(_Completado) _then) = __$CompletadoCopyWithImpl;
@useResult
$Res call({
 Pedido pedido
});


$PedidoCopyWith<$Res> get pedido;

}
/// @nodoc
class __$CompletadoCopyWithImpl<$Res>
    implements _$CompletadoCopyWith<$Res> {
  __$CompletadoCopyWithImpl(this._self, this._then);

  final _Completado _self;
  final $Res Function(_Completado) _then;

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pedido = null,}) {
  return _then(_Completado(
null == pedido ? _self.pedido : pedido // ignore: cast_nullable_to_non_nullable
as Pedido,
  ));
}

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PedidoCopyWith<$Res> get pedido {
  
  return $PedidoCopyWith<$Res>(_self.pedido, (value) {
    return _then(_self.copyWith(pedido: value));
  });
}
}

/// @nodoc


class _Error extends PedidoState {
  const _Error(this.mensaje): super._();
  

 final  String mensaje;

/// Create a copy of PedidoState
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
  return 'PedidoState.error(mensaje: $mensaje)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PedidoStateCopyWith<$Res> {
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

/// Create a copy of PedidoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mensaje = null,}) {
  return _then(_Error(
null == mensaje ? _self.mensaje : mensaje // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
