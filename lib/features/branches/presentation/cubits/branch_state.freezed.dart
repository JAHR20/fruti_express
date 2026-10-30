// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BranchState {

 List<Branch> get branches; bool get isLoading; String? get errorMessage; String? get branchProcessingId; Set<String> get branchesWithShippingConfigured; Set<String> get branchesWithRatesConfigured;
/// Create a copy of BranchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchStateCopyWith<BranchState> get copyWith => _$BranchStateCopyWithImpl<BranchState>(this as BranchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchState&&const DeepCollectionEquality().equals(other.branches, branches)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.branchProcessingId, branchProcessingId) || other.branchProcessingId == branchProcessingId)&&const DeepCollectionEquality().equals(other.branchesWithShippingConfigured, branchesWithShippingConfigured)&&const DeepCollectionEquality().equals(other.branchesWithRatesConfigured, branchesWithRatesConfigured));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(branches),isLoading,errorMessage,branchProcessingId,const DeepCollectionEquality().hash(branchesWithShippingConfigured),const DeepCollectionEquality().hash(branchesWithRatesConfigured));

@override
String toString() {
  return 'BranchState(branches: $branches, isLoading: $isLoading, errorMessage: $errorMessage, branchProcessingId: $branchProcessingId, branchesWithShippingConfigured: $branchesWithShippingConfigured, branchesWithRatesConfigured: $branchesWithRatesConfigured)';
}


}

/// @nodoc
abstract mixin class $BranchStateCopyWith<$Res>  {
  factory $BranchStateCopyWith(BranchState value, $Res Function(BranchState) _then) = _$BranchStateCopyWithImpl;
@useResult
$Res call({
 List<Branch> branches, bool isLoading, String? errorMessage, String? branchProcessingId, Set<String> branchesWithShippingConfigured, Set<String> branchesWithRatesConfigured
});




}
/// @nodoc
class _$BranchStateCopyWithImpl<$Res>
    implements $BranchStateCopyWith<$Res> {
  _$BranchStateCopyWithImpl(this._self, this._then);

  final BranchState _self;
  final $Res Function(BranchState) _then;

/// Create a copy of BranchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? branches = null,Object? isLoading = null,Object? errorMessage = freezed,Object? branchProcessingId = freezed,Object? branchesWithShippingConfigured = null,Object? branchesWithRatesConfigured = null,}) {
  return _then(_self.copyWith(
branches: null == branches ? _self.branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,branchProcessingId: freezed == branchProcessingId ? _self.branchProcessingId : branchProcessingId // ignore: cast_nullable_to_non_nullable
as String?,branchesWithShippingConfigured: null == branchesWithShippingConfigured ? _self.branchesWithShippingConfigured : branchesWithShippingConfigured // ignore: cast_nullable_to_non_nullable
as Set<String>,branchesWithRatesConfigured: null == branchesWithRatesConfigured ? _self.branchesWithRatesConfigured : branchesWithRatesConfigured // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchState].
extension BranchStatePatterns on BranchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchState value)  $default,){
final _that = this;
switch (_that) {
case _BranchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchState value)?  $default,){
final _that = this;
switch (_that) {
case _BranchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Branch> branches,  bool isLoading,  String? errorMessage,  String? branchProcessingId,  Set<String> branchesWithShippingConfigured,  Set<String> branchesWithRatesConfigured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchState() when $default != null:
return $default(_that.branches,_that.isLoading,_that.errorMessage,_that.branchProcessingId,_that.branchesWithShippingConfigured,_that.branchesWithRatesConfigured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Branch> branches,  bool isLoading,  String? errorMessage,  String? branchProcessingId,  Set<String> branchesWithShippingConfigured,  Set<String> branchesWithRatesConfigured)  $default,) {final _that = this;
switch (_that) {
case _BranchState():
return $default(_that.branches,_that.isLoading,_that.errorMessage,_that.branchProcessingId,_that.branchesWithShippingConfigured,_that.branchesWithRatesConfigured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Branch> branches,  bool isLoading,  String? errorMessage,  String? branchProcessingId,  Set<String> branchesWithShippingConfigured,  Set<String> branchesWithRatesConfigured)?  $default,) {final _that = this;
switch (_that) {
case _BranchState() when $default != null:
return $default(_that.branches,_that.isLoading,_that.errorMessage,_that.branchProcessingId,_that.branchesWithShippingConfigured,_that.branchesWithRatesConfigured);case _:
  return null;

}
}

}

/// @nodoc


class _BranchState implements BranchState {
  const _BranchState({final  List<Branch> branches = const [], this.isLoading = false, this.errorMessage, this.branchProcessingId, final  Set<String> branchesWithShippingConfigured = const <String>{}, final  Set<String> branchesWithRatesConfigured = const <String>{}}): _branches = branches,_branchesWithShippingConfigured = branchesWithShippingConfigured,_branchesWithRatesConfigured = branchesWithRatesConfigured;
  

 final  List<Branch> _branches;
@override@JsonKey() List<Branch> get branches {
  if (_branches is EqualUnmodifiableListView) return _branches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_branches);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override final  String? branchProcessingId;
 final  Set<String> _branchesWithShippingConfigured;
@override@JsonKey() Set<String> get branchesWithShippingConfigured {
  if (_branchesWithShippingConfigured is EqualUnmodifiableSetView) return _branchesWithShippingConfigured;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_branchesWithShippingConfigured);
}

 final  Set<String> _branchesWithRatesConfigured;
@override@JsonKey() Set<String> get branchesWithRatesConfigured {
  if (_branchesWithRatesConfigured is EqualUnmodifiableSetView) return _branchesWithRatesConfigured;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_branchesWithRatesConfigured);
}


/// Create a copy of BranchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchStateCopyWith<_BranchState> get copyWith => __$BranchStateCopyWithImpl<_BranchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchState&&const DeepCollectionEquality().equals(other._branches, _branches)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.branchProcessingId, branchProcessingId) || other.branchProcessingId == branchProcessingId)&&const DeepCollectionEquality().equals(other._branchesWithShippingConfigured, _branchesWithShippingConfigured)&&const DeepCollectionEquality().equals(other._branchesWithRatesConfigured, _branchesWithRatesConfigured));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_branches),isLoading,errorMessage,branchProcessingId,const DeepCollectionEquality().hash(_branchesWithShippingConfigured),const DeepCollectionEquality().hash(_branchesWithRatesConfigured));

@override
String toString() {
  return 'BranchState(branches: $branches, isLoading: $isLoading, errorMessage: $errorMessage, branchProcessingId: $branchProcessingId, branchesWithShippingConfigured: $branchesWithShippingConfigured, branchesWithRatesConfigured: $branchesWithRatesConfigured)';
}


}

/// @nodoc
abstract mixin class _$BranchStateCopyWith<$Res> implements $BranchStateCopyWith<$Res> {
  factory _$BranchStateCopyWith(_BranchState value, $Res Function(_BranchState) _then) = __$BranchStateCopyWithImpl;
@override @useResult
$Res call({
 List<Branch> branches, bool isLoading, String? errorMessage, String? branchProcessingId, Set<String> branchesWithShippingConfigured, Set<String> branchesWithRatesConfigured
});




}
/// @nodoc
class __$BranchStateCopyWithImpl<$Res>
    implements _$BranchStateCopyWith<$Res> {
  __$BranchStateCopyWithImpl(this._self, this._then);

  final _BranchState _self;
  final $Res Function(_BranchState) _then;

/// Create a copy of BranchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? branches = null,Object? isLoading = null,Object? errorMessage = freezed,Object? branchProcessingId = freezed,Object? branchesWithShippingConfigured = null,Object? branchesWithRatesConfigured = null,}) {
  return _then(_BranchState(
branches: null == branches ? _self._branches : branches // ignore: cast_nullable_to_non_nullable
as List<Branch>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,branchProcessingId: freezed == branchProcessingId ? _self.branchProcessingId : branchProcessingId // ignore: cast_nullable_to_non_nullable
as String?,branchesWithShippingConfigured: null == branchesWithShippingConfigured ? _self._branchesWithShippingConfigured : branchesWithShippingConfigured // ignore: cast_nullable_to_non_nullable
as Set<String>,branchesWithRatesConfigured: null == branchesWithRatesConfigured ? _self._branchesWithRatesConfigured : branchesWithRatesConfigured // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
