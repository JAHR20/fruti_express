// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventario_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventarioState {

 List<Inventario> get inventario; bool get isLoading; String? get productoProcesandoId; String? get errorMessage; String? get operacionError; bool get operacionExitosa; String? get sucursalId;
/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioStateCopyWith<InventarioState> get copyWith => _$InventarioStateCopyWithImpl<InventarioState>(this as InventarioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioState&&const DeepCollectionEquality().equals(other.inventario, inventario)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inventario),isLoading,productoProcesandoId,errorMessage,operacionError,operacionExitosa,sucursalId);

@override
String toString() {
  return 'InventarioState(inventario: $inventario, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa, sucursalId: $sucursalId)';
}


}

/// @nodoc
abstract mixin class $InventarioStateCopyWith<$Res>  {
  factory $InventarioStateCopyWith(InventarioState value, $Res Function(InventarioState) _then) = _$InventarioStateCopyWithImpl;
@useResult
$Res call({
 List<Inventario> inventario, bool isLoading, String? productoProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa, String? sucursalId
});




}
/// @nodoc
class _$InventarioStateCopyWithImpl<$Res>
    implements $InventarioStateCopyWith<$Res> {
  _$InventarioStateCopyWithImpl(this._self, this._then);

  final InventarioState _self;
  final $Res Function(InventarioState) _then;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inventario = null,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,Object? sucursalId = freezed,}) {
  return _then(_self.copyWith(
inventario: null == inventario ? _self.inventario : inventario // ignore: cast_nullable_to_non_nullable
as List<Inventario>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventarioState].
extension InventarioStatePatterns on InventarioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventarioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventarioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventarioState value)  $default,){
final _that = this;
switch (_that) {
case _InventarioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventarioState value)?  $default,){
final _that = this;
switch (_that) {
case _InventarioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Inventario> inventario,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? sucursalId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventarioState() when $default != null:
return $default(_that.inventario,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.sucursalId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Inventario> inventario,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? sucursalId)  $default,) {final _that = this;
switch (_that) {
case _InventarioState():
return $default(_that.inventario,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.sucursalId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Inventario> inventario,  bool isLoading,  String? productoProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa,  String? sucursalId)?  $default,) {final _that = this;
switch (_that) {
case _InventarioState() when $default != null:
return $default(_that.inventario,_that.isLoading,_that.productoProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa,_that.sucursalId);case _:
  return null;

}
}

}

/// @nodoc


class _InventarioState implements InventarioState {
  const _InventarioState({final  List<Inventario> inventario = const [], this.isLoading = false, this.productoProcesandoId, this.errorMessage, this.operacionError, this.operacionExitosa = false, this.sucursalId}): _inventario = inventario;
  

 final  List<Inventario> _inventario;
@override@JsonKey() List<Inventario> get inventario {
  if (_inventario is EqualUnmodifiableListView) return _inventario;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inventario);
}

@override@JsonKey() final  bool isLoading;
@override final  String? productoProcesandoId;
@override final  String? errorMessage;
@override final  String? operacionError;
@override@JsonKey() final  bool operacionExitosa;
@override final  String? sucursalId;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventarioStateCopyWith<_InventarioState> get copyWith => __$InventarioStateCopyWithImpl<_InventarioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventarioState&&const DeepCollectionEquality().equals(other._inventario, _inventario)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.productoProcesandoId, productoProcesandoId) || other.productoProcesandoId == productoProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inventario),isLoading,productoProcesandoId,errorMessage,operacionError,operacionExitosa,sucursalId);

@override
String toString() {
  return 'InventarioState(inventario: $inventario, isLoading: $isLoading, productoProcesandoId: $productoProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa, sucursalId: $sucursalId)';
}


}

/// @nodoc
abstract mixin class _$InventarioStateCopyWith<$Res> implements $InventarioStateCopyWith<$Res> {
  factory _$InventarioStateCopyWith(_InventarioState value, $Res Function(_InventarioState) _then) = __$InventarioStateCopyWithImpl;
@override @useResult
$Res call({
 List<Inventario> inventario, bool isLoading, String? productoProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa, String? sucursalId
});




}
/// @nodoc
class __$InventarioStateCopyWithImpl<$Res>
    implements _$InventarioStateCopyWith<$Res> {
  __$InventarioStateCopyWithImpl(this._self, this._then);

  final _InventarioState _self;
  final $Res Function(_InventarioState) _then;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inventario = null,Object? isLoading = null,Object? productoProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,Object? sucursalId = freezed,}) {
  return _then(_InventarioState(
inventario: null == inventario ? _self._inventario : inventario // ignore: cast_nullable_to_non_nullable
as List<Inventario>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,productoProcesandoId: freezed == productoProcesandoId ? _self.productoProcesandoId : productoProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
