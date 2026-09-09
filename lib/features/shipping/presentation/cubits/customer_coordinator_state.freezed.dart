// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_coordinator_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerCoordinatorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCoordinatorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerCoordinatorState()';
}


}

/// @nodoc
class $CustomerCoordinatorStateCopyWith<$Res>  {
$CustomerCoordinatorStateCopyWith(CustomerCoordinatorState _, $Res Function(CustomerCoordinatorState) __);
}


/// Adds pattern-matching-related methods to [CustomerCoordinatorState].
extension CustomerCoordinatorStatePatterns on CustomerCoordinatorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Processing value)?  processing,TResult Function( _ChangeSuccessful value)?  changeSuccessful,TResult Function( _OutOfCoverage value)?  outOfCoverage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Processing() when processing != null:
return processing(_that);case _ChangeSuccessful() when changeSuccessful != null:
return changeSuccessful(_that);case _OutOfCoverage() when outOfCoverage != null:
return outOfCoverage(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Processing value)  processing,required TResult Function( _ChangeSuccessful value)  changeSuccessful,required TResult Function( _OutOfCoverage value)  outOfCoverage,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Processing():
return processing(_that);case _ChangeSuccessful():
return changeSuccessful(_that);case _OutOfCoverage():
return outOfCoverage(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Processing value)?  processing,TResult? Function( _ChangeSuccessful value)?  changeSuccessful,TResult? Function( _OutOfCoverage value)?  outOfCoverage,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Processing() when processing != null:
return processing(_that);case _ChangeSuccessful() when changeSuccessful != null:
return changeSuccessful(_that);case _OutOfCoverage() when outOfCoverage != null:
return outOfCoverage(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  processing,TResult Function( Branch newBranch,  bool wasAutomatic)?  changeSuccessful,TResult Function( Address address)?  outOfCoverage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Processing() when processing != null:
return processing();case _ChangeSuccessful() when changeSuccessful != null:
return changeSuccessful(_that.newBranch,_that.wasAutomatic);case _OutOfCoverage() when outOfCoverage != null:
return outOfCoverage(_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  processing,required TResult Function( Branch newBranch,  bool wasAutomatic)  changeSuccessful,required TResult Function( Address address)  outOfCoverage,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Processing():
return processing();case _ChangeSuccessful():
return changeSuccessful(_that.newBranch,_that.wasAutomatic);case _OutOfCoverage():
return outOfCoverage(_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  processing,TResult? Function( Branch newBranch,  bool wasAutomatic)?  changeSuccessful,TResult? Function( Address address)?  outOfCoverage,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Processing() when processing != null:
return processing();case _ChangeSuccessful() when changeSuccessful != null:
return changeSuccessful(_that.newBranch,_that.wasAutomatic);case _OutOfCoverage() when outOfCoverage != null:
return outOfCoverage(_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements CustomerCoordinatorState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerCoordinatorState.idle()';
}


}




/// @nodoc


class _Processing implements CustomerCoordinatorState {
  const _Processing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Processing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomerCoordinatorState.processing()';
}


}




/// @nodoc


class _ChangeSuccessful implements CustomerCoordinatorState {
  const _ChangeSuccessful(this.newBranch, this.wasAutomatic);
  

 final  Branch newBranch;
 final  bool wasAutomatic;

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeSuccessfulCopyWith<_ChangeSuccessful> get copyWith => __$ChangeSuccessfulCopyWithImpl<_ChangeSuccessful>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeSuccessful&&(identical(other.newBranch, newBranch) || other.newBranch == newBranch)&&(identical(other.wasAutomatic, wasAutomatic) || other.wasAutomatic == wasAutomatic));
}


@override
int get hashCode => Object.hash(runtimeType,newBranch,wasAutomatic);

@override
String toString() {
  return 'CustomerCoordinatorState.changeSuccessful(newBranch: $newBranch, wasAutomatic: $wasAutomatic)';
}


}

/// @nodoc
abstract mixin class _$ChangeSuccessfulCopyWith<$Res> implements $CustomerCoordinatorStateCopyWith<$Res> {
  factory _$ChangeSuccessfulCopyWith(_ChangeSuccessful value, $Res Function(_ChangeSuccessful) _then) = __$ChangeSuccessfulCopyWithImpl;
@useResult
$Res call({
 Branch newBranch, bool wasAutomatic
});


$BranchCopyWith<$Res> get newBranch;

}
/// @nodoc
class __$ChangeSuccessfulCopyWithImpl<$Res>
    implements _$ChangeSuccessfulCopyWith<$Res> {
  __$ChangeSuccessfulCopyWithImpl(this._self, this._then);

  final _ChangeSuccessful _self;
  final $Res Function(_ChangeSuccessful) _then;

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? newBranch = null,Object? wasAutomatic = null,}) {
  return _then(_ChangeSuccessful(
null == newBranch ? _self.newBranch : newBranch // ignore: cast_nullable_to_non_nullable
as Branch,null == wasAutomatic ? _self.wasAutomatic : wasAutomatic // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchCopyWith<$Res> get newBranch {
  
  return $BranchCopyWith<$Res>(_self.newBranch, (value) {
    return _then(_self.copyWith(newBranch: value));
  });
}
}

/// @nodoc


class _OutOfCoverage implements CustomerCoordinatorState {
  const _OutOfCoverage(this.address);
  

 final  Address address;

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutOfCoverageCopyWith<_OutOfCoverage> get copyWith => __$OutOfCoverageCopyWithImpl<_OutOfCoverage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutOfCoverage&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'CustomerCoordinatorState.outOfCoverage(address: $address)';
}


}

/// @nodoc
abstract mixin class _$OutOfCoverageCopyWith<$Res> implements $CustomerCoordinatorStateCopyWith<$Res> {
  factory _$OutOfCoverageCopyWith(_OutOfCoverage value, $Res Function(_OutOfCoverage) _then) = __$OutOfCoverageCopyWithImpl;
@useResult
$Res call({
 Address address
});


$AddressCopyWith<$Res> get address;

}
/// @nodoc
class __$OutOfCoverageCopyWithImpl<$Res>
    implements _$OutOfCoverageCopyWith<$Res> {
  __$OutOfCoverageCopyWithImpl(this._self, this._then);

  final _OutOfCoverage _self;
  final $Res Function(_OutOfCoverage) _then;

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_OutOfCoverage(
null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as Address,
  ));
}

/// Create a copy of CustomerCoordinatorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get address {
  
  return $AddressCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
