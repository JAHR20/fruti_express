// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CouponState {

 List<Coupon> get coupons; bool get isLoading; bool get isSavingOperation; CouponsTab get tab; String? get processingCouponId; bool? get operationSuccessful; String? get operationError; String? get errorMessage; String get searchQuery;
/// Create a copy of CouponState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CouponStateCopyWith<CouponState> get copyWith => _$CouponStateCopyWithImpl<CouponState>(this as CouponState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponState&&const DeepCollectionEquality().equals(other.coupons, coupons)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.processingCouponId, processingCouponId) || other.processingCouponId == processingCouponId)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(coupons),isLoading,isSavingOperation,tab,processingCouponId,operationSuccessful,operationError,errorMessage,searchQuery);

@override
String toString() {
  return 'CouponState(coupons: $coupons, isLoading: $isLoading, isSavingOperation: $isSavingOperation, tab: $tab, processingCouponId: $processingCouponId, operationSuccessful: $operationSuccessful, operationError: $operationError, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $CouponStateCopyWith<$Res>  {
  factory $CouponStateCopyWith(CouponState value, $Res Function(CouponState) _then) = _$CouponStateCopyWithImpl;
@useResult
$Res call({
 List<Coupon> coupons, bool isLoading, bool isSavingOperation, CouponsTab tab, String? processingCouponId, bool? operationSuccessful, String? operationError, String? errorMessage, String searchQuery
});




}
/// @nodoc
class _$CouponStateCopyWithImpl<$Res>
    implements $CouponStateCopyWith<$Res> {
  _$CouponStateCopyWithImpl(this._self, this._then);

  final CouponState _self;
  final $Res Function(CouponState) _then;

/// Create a copy of CouponState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coupons = null,Object? isLoading = null,Object? isSavingOperation = null,Object? tab = null,Object? processingCouponId = freezed,Object? operationSuccessful = freezed,Object? operationError = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
coupons: null == coupons ? _self.coupons : coupons // ignore: cast_nullable_to_non_nullable
as List<Coupon>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as CouponsTab,processingCouponId: freezed == processingCouponId ? _self.processingCouponId : processingCouponId // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: freezed == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CouponState].
extension CouponStatePatterns on CouponState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CouponState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CouponState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CouponState value)  $default,){
final _that = this;
switch (_that) {
case _CouponState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CouponState value)?  $default,){
final _that = this;
switch (_that) {
case _CouponState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Coupon> coupons,  bool isLoading,  bool isSavingOperation,  CouponsTab tab,  String? processingCouponId,  bool? operationSuccessful,  String? operationError,  String? errorMessage,  String searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CouponState() when $default != null:
return $default(_that.coupons,_that.isLoading,_that.isSavingOperation,_that.tab,_that.processingCouponId,_that.operationSuccessful,_that.operationError,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Coupon> coupons,  bool isLoading,  bool isSavingOperation,  CouponsTab tab,  String? processingCouponId,  bool? operationSuccessful,  String? operationError,  String? errorMessage,  String searchQuery)  $default,) {final _that = this;
switch (_that) {
case _CouponState():
return $default(_that.coupons,_that.isLoading,_that.isSavingOperation,_that.tab,_that.processingCouponId,_that.operationSuccessful,_that.operationError,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Coupon> coupons,  bool isLoading,  bool isSavingOperation,  CouponsTab tab,  String? processingCouponId,  bool? operationSuccessful,  String? operationError,  String? errorMessage,  String searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _CouponState() when $default != null:
return $default(_that.coupons,_that.isLoading,_that.isSavingOperation,_that.tab,_that.processingCouponId,_that.operationSuccessful,_that.operationError,_that.errorMessage,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _CouponState implements CouponState {
  const _CouponState({final  List<Coupon> coupons = const [], this.isLoading = false, this.isSavingOperation = false, this.tab = CouponsTab.all, this.processingCouponId, this.operationSuccessful, this.operationError, this.errorMessage, this.searchQuery = ''}): _coupons = coupons;
  

 final  List<Coupon> _coupons;
@override@JsonKey() List<Coupon> get coupons {
  if (_coupons is EqualUnmodifiableListView) return _coupons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coupons);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSavingOperation;
@override@JsonKey() final  CouponsTab tab;
@override final  String? processingCouponId;
@override final  bool? operationSuccessful;
@override final  String? operationError;
@override final  String? errorMessage;
@override@JsonKey() final  String searchQuery;

/// Create a copy of CouponState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CouponStateCopyWith<_CouponState> get copyWith => __$CouponStateCopyWithImpl<_CouponState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CouponState&&const DeepCollectionEquality().equals(other._coupons, _coupons)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.processingCouponId, processingCouponId) || other.processingCouponId == processingCouponId)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_coupons),isLoading,isSavingOperation,tab,processingCouponId,operationSuccessful,operationError,errorMessage,searchQuery);

@override
String toString() {
  return 'CouponState(coupons: $coupons, isLoading: $isLoading, isSavingOperation: $isSavingOperation, tab: $tab, processingCouponId: $processingCouponId, operationSuccessful: $operationSuccessful, operationError: $operationError, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$CouponStateCopyWith<$Res> implements $CouponStateCopyWith<$Res> {
  factory _$CouponStateCopyWith(_CouponState value, $Res Function(_CouponState) _then) = __$CouponStateCopyWithImpl;
@override @useResult
$Res call({
 List<Coupon> coupons, bool isLoading, bool isSavingOperation, CouponsTab tab, String? processingCouponId, bool? operationSuccessful, String? operationError, String? errorMessage, String searchQuery
});




}
/// @nodoc
class __$CouponStateCopyWithImpl<$Res>
    implements _$CouponStateCopyWith<$Res> {
  __$CouponStateCopyWithImpl(this._self, this._then);

  final _CouponState _self;
  final $Res Function(_CouponState) _then;

/// Create a copy of CouponState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coupons = null,Object? isLoading = null,Object? isSavingOperation = null,Object? tab = null,Object? processingCouponId = freezed,Object? operationSuccessful = freezed,Object? operationError = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_CouponState(
coupons: null == coupons ? _self._coupons : coupons // ignore: cast_nullable_to_non_nullable
as List<Coupon>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as CouponsTab,processingCouponId: freezed == processingCouponId ? _self.processingCouponId : processingCouponId // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: freezed == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
