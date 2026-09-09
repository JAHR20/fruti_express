// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryState {

 List<Inventory> get inventory; bool get isLoading; String? get processingProductId; String? get errorMessage; String? get operationError; bool get operationSuccessful; String? get branchId;
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateCopyWith<InventoryState> get copyWith => _$InventoryStateCopyWithImpl<InventoryState>(this as InventoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState&&const DeepCollectionEquality().equals(other.inventory, inventory)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.branchId, branchId) || other.branchId == branchId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inventory),isLoading,processingProductId,errorMessage,operationError,operationSuccessful,branchId);

@override
String toString() {
  return 'InventoryState(inventory: $inventory, isLoading: $isLoading, processingProductId: $processingProductId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, branchId: $branchId)';
}


}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res>  {
  factory $InventoryStateCopyWith(InventoryState value, $Res Function(InventoryState) _then) = _$InventoryStateCopyWithImpl;
@useResult
$Res call({
 List<Inventory> inventory, bool isLoading, String? processingProductId, String? errorMessage, String? operationError, bool operationSuccessful, String? branchId
});




}
/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inventory = null,Object? isLoading = null,Object? processingProductId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? branchId = freezed,}) {
  return _then(_self.copyWith(
inventory: null == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as List<Inventory>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Inventory> inventory,  bool isLoading,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? branchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.inventory,_that.isLoading,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.branchId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Inventory> inventory,  bool isLoading,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? branchId)  $default,) {final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that.inventory,_that.isLoading,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.branchId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Inventory> inventory,  bool isLoading,  String? processingProductId,  String? errorMessage,  String? operationError,  bool operationSuccessful,  String? branchId)?  $default,) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.inventory,_that.isLoading,_that.processingProductId,_that.errorMessage,_that.operationError,_that.operationSuccessful,_that.branchId);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryState implements InventoryState {
  const _InventoryState({final  List<Inventory> inventory = const [], this.isLoading = false, this.processingProductId, this.errorMessage, this.operationError, this.operationSuccessful = false, this.branchId}): _inventory = inventory;
  

 final  List<Inventory> _inventory;
@override@JsonKey() List<Inventory> get inventory {
  if (_inventory is EqualUnmodifiableListView) return _inventory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inventory);
}

@override@JsonKey() final  bool isLoading;
@override final  String? processingProductId;
@override final  String? errorMessage;
@override final  String? operationError;
@override@JsonKey() final  bool operationSuccessful;
@override final  String? branchId;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryStateCopyWith<_InventoryState> get copyWith => __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryState&&const DeepCollectionEquality().equals(other._inventory, _inventory)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingProductId, processingProductId) || other.processingProductId == processingProductId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.branchId, branchId) || other.branchId == branchId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inventory),isLoading,processingProductId,errorMessage,operationError,operationSuccessful,branchId);

@override
String toString() {
  return 'InventoryState(inventory: $inventory, isLoading: $isLoading, processingProductId: $processingProductId, errorMessage: $errorMessage, operationError: $operationError, operationSuccessful: $operationSuccessful, branchId: $branchId)';
}


}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(_InventoryState value, $Res Function(_InventoryState) _then) = __$InventoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<Inventory> inventory, bool isLoading, String? processingProductId, String? errorMessage, String? operationError, bool operationSuccessful, String? branchId
});




}
/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inventory = null,Object? isLoading = null,Object? processingProductId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? operationSuccessful = null,Object? branchId = freezed,}) {
  return _then(_InventoryState(
inventory: null == inventory ? _self._inventory : inventory // ignore: cast_nullable_to_non_nullable
as List<Inventory>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingProductId: freezed == processingProductId ? _self.processingProductId : processingProductId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
