// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressState {

 List<Address> get addresses;// direcciones -> addresses
 bool get isLoading;/// ID de la dirección que está siendo creada/actualizada/eliminada.
 String? get processingAddressId;// direccionProcesandoId -> processingAddressId
/// ID de la dirección que se está marcando como principal.
 String? get processingMainAddressId;// direccionPrincipalProcesandoId -> processingMainAddressId
/// Error al cargar la lista completa.
 String? get errorMessage;/// Error producido durante una operación puntual.
 String? get operationError;// operacionError -> operationError
/// Indica que una operación puntual terminó correctamente.
 bool get operationSuccessful;// operacionExitosa -> operationSuccessful
/// Usuario cuyas direcciones están actualmente cargadas.
 String? get userId;
/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressStateCopyWith<AddressState> get copyWith => _$AddressStateCopyWithImpl<AddressState>(this as AddressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressState&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingAddressId, processingAddressId) || other.processingAddressId == processingAddressId)&&(identical(other.processingMainAddressId, processingMainAddressId) || other.processingMainAddressId == processingMainAddressId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(addresses),isLoading,processingAddressId,processingMainAddressId,errorMessage,operationError,operationSuccessful,userId);

@override
String toString() {
  return 'AddressState(addresses: $addresses, isLoading: $isLoading, processingAddressId: $processingAddressId, processingMainAddressId: $processingMainAddressId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AddressStateCopyWith<$Res>  {
  factory $AddressStateCopyWith(AddressState value, $Res Function(AddressState) _then) = _$AddressStateCopyWithImpl;
@useResult
$Res call({
 List<Address> addresses, bool isLoading, String? processingAddressId, String? processingMainAddressId, String? errorMessage, String? operationError, bool operationSuccessful, String? userId
});




}
/// @nodoc
class _$AddressStateCopyWithImpl<$Res>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._self, this._then);

  final AddressState _self;
  final $Res Function(AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addresses = null,Object? isLoading = null,Object? processingAddressId = freezed,Object? processingMainAddressId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? userId = freezed,}) {
  return _then(_self.copyWith(
addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingAddressId: freezed == processingAddressId ? _self.processingAddressId : processingAddressId // ignore: cast_nullable_to_non_nullable
as String?,processingMainAddressId: freezed == processingMainAddressId ? _self.processingMainAddressId : processingMainAddressId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressState].
extension AddressStatePatterns on AddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressState value)  $default,){
final _that = this;
switch (_that) {
case _AddressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressState value)?  $default,){
final _that = this;
switch (_that) {
case _AddressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Address> addresses,  bool isLoading,  String? processingAddressId,  String? processingMainAddressId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.addresses,_that.isLoading,_that.processingAddressId,_that.processingMainAddressId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Address> addresses,  bool isLoading,  String? processingAddressId,  String? processingMainAddressId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? userId)  $default,) {final _that = this;
switch (_that) {
case _AddressState():
return $default(_that.addresses,_that.isLoading,_that.processingAddressId,_that.processingMainAddressId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Address> addresses,  bool isLoading,  String? processingAddressId,  String? processingMainAddressId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? userId)?  $default,) {final _that = this;
switch (_that) {
case _AddressState() when $default != null:
return $default(_that.addresses,_that.isLoading,_that.processingAddressId,_that.processingMainAddressId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _AddressState implements AddressState {
  const _AddressState({final  List<Address> addresses = const <Address>[], this.isLoading = false, this.processingAddressId, this.processingMainAddressId, this.errorMessage, this.operationError, this.operationSuccessful = false, this.userId}): _addresses = addresses;
  

 final  List<Address> _addresses;
@override@JsonKey() List<Address> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

// direcciones -> addresses
@override@JsonKey() final  bool isLoading;
/// ID de la dirección que está siendo creada/actualizada/eliminada.
@override final  String? processingAddressId;
// direccionProcesandoId -> processingAddressId
/// ID de la dirección que se está marcando como principal.
@override final  String? processingMainAddressId;
// direccionPrincipalProcesandoId -> processingMainAddressId
/// Error al cargar la lista completa.
@override final  String? errorMessage;
/// Error producido durante una operación puntual.
@override final  String? operationError;
// operacionError -> operationError
/// Indica que una operación puntual terminó correctamente.
@override@JsonKey() final  bool operationSuccessful;
// operacionExitosa -> operationSuccessful
/// Usuario cuyas direcciones están actualmente cargadas.
@override final  String? userId;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressStateCopyWith<_AddressState> get copyWith => __$AddressStateCopyWithImpl<_AddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressState&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingAddressId, processingAddressId) || other.processingAddressId == processingAddressId)&&(identical(other.processingMainAddressId, processingMainAddressId) || other.processingMainAddressId == processingMainAddressId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addresses),isLoading,processingAddressId,processingMainAddressId,errorMessage,operationError,operationSuccessful,userId);

@override
String toString() {
  return 'AddressState(addresses: $addresses, isLoading: $isLoading, processingAddressId: $processingAddressId, processingMainAddressId: $processingMainAddressId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$AddressStateCopyWith<$Res> implements $AddressStateCopyWith<$Res> {
  factory _$AddressStateCopyWith(_AddressState value, $Res Function(_AddressState) _then) = __$AddressStateCopyWithImpl;
@override @useResult
$Res call({
 List<Address> addresses, bool isLoading, String? processingAddressId, String? processingMainAddressId, String? errorMessage, String? operationError, bool operationSuccessful, String? userId
});




}
/// @nodoc
class __$AddressStateCopyWithImpl<$Res>
    implements _$AddressStateCopyWith<$Res> {
  __$AddressStateCopyWithImpl(this._self, this._then);

  final _AddressState _self;
  final $Res Function(_AddressState) _then;

/// Create a copy of AddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addresses = null,Object? isLoading = null,Object? processingAddressId = freezed,Object? processingMainAddressId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? userId = freezed,}) {
  return _then(_AddressState(
addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingAddressId: freezed == processingAddressId ? _self.processingAddressId : processingAddressId // ignore: cast_nullable_to_non_nullable
as String?,processingMainAddressId: freezed == processingMainAddressId ? _self.processingMainAddressId : processingMainAddressId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
