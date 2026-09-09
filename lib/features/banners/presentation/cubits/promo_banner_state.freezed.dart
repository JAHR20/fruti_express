// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PromoBannerState {

 List<PromoBanner> get banners; bool get isLoading; String? get processingBannerId; String? get errorMessage; String? get operationError; bool get isOperationSuccessful;
/// Create a copy of PromoBannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoBannerStateCopyWith<PromoBannerState> get copyWith => _$PromoBannerStateCopyWithImpl<PromoBannerState>(this as PromoBannerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoBannerState&&const DeepCollectionEquality().equals(other.banners, banners)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingBannerId, processingBannerId) || other.processingBannerId == processingBannerId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.isOperationSuccessful, isOperationSuccessful) || other.isOperationSuccessful == isOperationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(banners),isLoading,processingBannerId,errorMessage,operationError,isOperationSuccessful);

@override
String toString() {
  return 'PromoBannerState(banners: $banners, isLoading: $isLoading, processingBannerId: $processingBannerId, errorMessage: $errorMessage, operationError: $operationError, isOperationSuccessful: $isOperationSuccessful)';
}


}

/// @nodoc
abstract mixin class $PromoBannerStateCopyWith<$Res>  {
  factory $PromoBannerStateCopyWith(PromoBannerState value, $Res Function(PromoBannerState) _then) = _$PromoBannerStateCopyWithImpl;
@useResult
$Res call({
 List<PromoBanner> banners, bool isLoading, String? processingBannerId, String? errorMessage, String? operationError, bool isOperationSuccessful
});




}
/// @nodoc
class _$PromoBannerStateCopyWithImpl<$Res>
    implements $PromoBannerStateCopyWith<$Res> {
  _$PromoBannerStateCopyWithImpl(this._self, this._then);

  final PromoBannerState _self;
  final $Res Function(PromoBannerState) _then;

/// Create a copy of PromoBannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banners = null,Object? isLoading = null,Object? processingBannerId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? isOperationSuccessful = null,}) {
  return _then(_self.copyWith(
banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<PromoBanner>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingBannerId: freezed == processingBannerId ? _self.processingBannerId : processingBannerId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,isOperationSuccessful: null == isOperationSuccessful ? _self.isOperationSuccessful : isOperationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoBannerState].
extension PromoBannerStatePatterns on PromoBannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoBannerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoBannerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoBannerState value)  $default,){
final _that = this;
switch (_that) {
case _PromoBannerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoBannerState value)?  $default,){
final _that = this;
switch (_that) {
case _PromoBannerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PromoBanner> banners,  bool isLoading,  String? processingBannerId,  String? errorMessage,  String? operationError,  bool isOperationSuccessful)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoBannerState() when $default != null:
return $default(_that.banners,_that.isLoading,_that.processingBannerId,_that.errorMessage,_that.operationError,_that.isOperationSuccessful);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PromoBanner> banners,  bool isLoading,  String? processingBannerId,  String? errorMessage,  String? operationError,  bool isOperationSuccessful)  $default,) {final _that = this;
switch (_that) {
case _PromoBannerState():
return $default(_that.banners,_that.isLoading,_that.processingBannerId,_that.errorMessage,_that.operationError,_that.isOperationSuccessful);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PromoBanner> banners,  bool isLoading,  String? processingBannerId,  String? errorMessage,  String? operationError,  bool isOperationSuccessful)?  $default,) {final _that = this;
switch (_that) {
case _PromoBannerState() when $default != null:
return $default(_that.banners,_that.isLoading,_that.processingBannerId,_that.errorMessage,_that.operationError,_that.isOperationSuccessful);case _:
  return null;

}
}

}

/// @nodoc


class _PromoBannerState extends PromoBannerState {
  const _PromoBannerState({final  List<PromoBanner> banners = const <PromoBanner>[], this.isLoading = false, this.processingBannerId, this.errorMessage, this.operationError, this.isOperationSuccessful = false}): _banners = banners,super._();
  

 final  List<PromoBanner> _banners;
@override@JsonKey() List<PromoBanner> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

@override@JsonKey() final  bool isLoading;
@override final  String? processingBannerId;
@override final  String? errorMessage;
@override final  String? operationError;
@override@JsonKey() final  bool isOperationSuccessful;

/// Create a copy of PromoBannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoBannerStateCopyWith<_PromoBannerState> get copyWith => __$PromoBannerStateCopyWithImpl<_PromoBannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoBannerState&&const DeepCollectionEquality().equals(other._banners, _banners)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.processingBannerId, processingBannerId) || other.processingBannerId == processingBannerId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.isOperationSuccessful, isOperationSuccessful) || other.isOperationSuccessful == isOperationSuccessful));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_banners),isLoading,processingBannerId,errorMessage,operationError,isOperationSuccessful);

@override
String toString() {
  return 'PromoBannerState(banners: $banners, isLoading: $isLoading, processingBannerId: $processingBannerId, errorMessage: $errorMessage, operationError: $operationError, isOperationSuccessful: $isOperationSuccessful)';
}


}

/// @nodoc
abstract mixin class _$PromoBannerStateCopyWith<$Res> implements $PromoBannerStateCopyWith<$Res> {
  factory _$PromoBannerStateCopyWith(_PromoBannerState value, $Res Function(_PromoBannerState) _then) = __$PromoBannerStateCopyWithImpl;
@override @useResult
$Res call({
 List<PromoBanner> banners, bool isLoading, String? processingBannerId, String? errorMessage, String? operationError, bool isOperationSuccessful
});




}
/// @nodoc
class __$PromoBannerStateCopyWithImpl<$Res>
    implements _$PromoBannerStateCopyWith<$Res> {
  __$PromoBannerStateCopyWithImpl(this._self, this._then);

  final _PromoBannerState _self;
  final $Res Function(_PromoBannerState) _then;

/// Create a copy of PromoBannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banners = null,Object? isLoading = null,Object? processingBannerId = freezed,Object? errorMessage = freezed,Object? operationError = freezed,Object? isOperationSuccessful = null,}) {
  return _then(_PromoBannerState(
banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<PromoBanner>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,processingBannerId: freezed == processingBannerId ? _self.processingBannerId : processingBannerId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,isOperationSuccessful: null == isOperationSuccessful ? _self.isOperationSuccessful : isOperationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
