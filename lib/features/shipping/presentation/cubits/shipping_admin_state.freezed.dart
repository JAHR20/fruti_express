// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipping_admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShippingAdminState {

 bool get isLoading; ShippingConfig? get config; List<ShippingRate> get rates; double get tempRadiusKm; bool get tempRequireZipCode; int? get tempFreeShippingAmount; String? get error; String? get successMessage; String? get processingRateId;
/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingAdminStateCopyWith<ShippingAdminState> get copyWith => _$ShippingAdminStateCopyWithImpl<ShippingAdminState>(this as ShippingAdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingAdminState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other.rates, rates)&&(identical(other.tempRadiusKm, tempRadiusKm) || other.tempRadiusKm == tempRadiusKm)&&(identical(other.tempRequireZipCode, tempRequireZipCode) || other.tempRequireZipCode == tempRequireZipCode)&&(identical(other.tempFreeShippingAmount, tempFreeShippingAmount) || other.tempFreeShippingAmount == tempFreeShippingAmount)&&(identical(other.error, error) || other.error == error)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.processingRateId, processingRateId) || other.processingRateId == processingRateId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,config,const DeepCollectionEquality().hash(rates),tempRadiusKm,tempRequireZipCode,tempFreeShippingAmount,error,successMessage,processingRateId);

@override
String toString() {
  return 'ShippingAdminState(isLoading: $isLoading, config: $config, rates: $rates, tempRadiusKm: $tempRadiusKm, tempRequireZipCode: $tempRequireZipCode, tempFreeShippingAmount: $tempFreeShippingAmount, error: $error, successMessage: $successMessage, processingRateId: $processingRateId)';
}


}

/// @nodoc
abstract mixin class $ShippingAdminStateCopyWith<$Res>  {
  factory $ShippingAdminStateCopyWith(ShippingAdminState value, $Res Function(ShippingAdminState) _then) = _$ShippingAdminStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, ShippingConfig? config, List<ShippingRate> rates, double tempRadiusKm, bool tempRequireZipCode, int? tempFreeShippingAmount, String? error, String? successMessage, String? processingRateId
});


$ShippingConfigCopyWith<$Res>? get config;

}
/// @nodoc
class _$ShippingAdminStateCopyWithImpl<$Res>
    implements $ShippingAdminStateCopyWith<$Res> {
  _$ShippingAdminStateCopyWithImpl(this._self, this._then);

  final ShippingAdminState _self;
  final $Res Function(ShippingAdminState) _then;

/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? config = freezed,Object? rates = null,Object? tempRadiusKm = null,Object? tempRequireZipCode = null,Object? tempFreeShippingAmount = freezed,Object? error = freezed,Object? successMessage = freezed,Object? processingRateId = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ShippingConfig?,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as List<ShippingRate>,tempRadiusKm: null == tempRadiusKm ? _self.tempRadiusKm : tempRadiusKm // ignore: cast_nullable_to_non_nullable
as double,tempRequireZipCode: null == tempRequireZipCode ? _self.tempRequireZipCode : tempRequireZipCode // ignore: cast_nullable_to_non_nullable
as bool,tempFreeShippingAmount: freezed == tempFreeShippingAmount ? _self.tempFreeShippingAmount : tempFreeShippingAmount // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,processingRateId: freezed == processingRateId ? _self.processingRateId : processingRateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $ShippingConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShippingAdminState].
extension ShippingAdminStatePatterns on ShippingAdminState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingAdminState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingAdminState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingAdminState value)  $default,){
final _that = this;
switch (_that) {
case _ShippingAdminState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingAdminState value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingAdminState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  ShippingConfig? config,  List<ShippingRate> rates,  double tempRadiusKm,  bool tempRequireZipCode,  int? tempFreeShippingAmount,  String? error,  String? successMessage,  String? processingRateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingAdminState() when $default != null:
return $default(_that.isLoading,_that.config,_that.rates,_that.tempRadiusKm,_that.tempRequireZipCode,_that.tempFreeShippingAmount,_that.error,_that.successMessage,_that.processingRateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  ShippingConfig? config,  List<ShippingRate> rates,  double tempRadiusKm,  bool tempRequireZipCode,  int? tempFreeShippingAmount,  String? error,  String? successMessage,  String? processingRateId)  $default,) {final _that = this;
switch (_that) {
case _ShippingAdminState():
return $default(_that.isLoading,_that.config,_that.rates,_that.tempRadiusKm,_that.tempRequireZipCode,_that.tempFreeShippingAmount,_that.error,_that.successMessage,_that.processingRateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  ShippingConfig? config,  List<ShippingRate> rates,  double tempRadiusKm,  bool tempRequireZipCode,  int? tempFreeShippingAmount,  String? error,  String? successMessage,  String? processingRateId)?  $default,) {final _that = this;
switch (_that) {
case _ShippingAdminState() when $default != null:
return $default(_that.isLoading,_that.config,_that.rates,_that.tempRadiusKm,_that.tempRequireZipCode,_that.tempFreeShippingAmount,_that.error,_that.successMessage,_that.processingRateId);case _:
  return null;

}
}

}

/// @nodoc


class _ShippingAdminState implements ShippingAdminState {
  const _ShippingAdminState({this.isLoading = false, this.config, final  List<ShippingRate> rates = const <ShippingRate>[], this.tempRadiusKm = 5.0, this.tempRequireZipCode = false, this.tempFreeShippingAmount, this.error, this.successMessage, this.processingRateId}): _rates = rates;
  

@override@JsonKey() final  bool isLoading;
@override final  ShippingConfig? config;
 final  List<ShippingRate> _rates;
@override@JsonKey() List<ShippingRate> get rates {
  if (_rates is EqualUnmodifiableListView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rates);
}

@override@JsonKey() final  double tempRadiusKm;
@override@JsonKey() final  bool tempRequireZipCode;
@override final  int? tempFreeShippingAmount;
@override final  String? error;
@override final  String? successMessage;
@override final  String? processingRateId;

/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingAdminStateCopyWith<_ShippingAdminState> get copyWith => __$ShippingAdminStateCopyWithImpl<_ShippingAdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingAdminState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.config, config) || other.config == config)&&const DeepCollectionEquality().equals(other._rates, _rates)&&(identical(other.tempRadiusKm, tempRadiusKm) || other.tempRadiusKm == tempRadiusKm)&&(identical(other.tempRequireZipCode, tempRequireZipCode) || other.tempRequireZipCode == tempRequireZipCode)&&(identical(other.tempFreeShippingAmount, tempFreeShippingAmount) || other.tempFreeShippingAmount == tempFreeShippingAmount)&&(identical(other.error, error) || other.error == error)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.processingRateId, processingRateId) || other.processingRateId == processingRateId));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,config,const DeepCollectionEquality().hash(_rates),tempRadiusKm,tempRequireZipCode,tempFreeShippingAmount,error,successMessage,processingRateId);

@override
String toString() {
  return 'ShippingAdminState(isLoading: $isLoading, config: $config, rates: $rates, tempRadiusKm: $tempRadiusKm, tempRequireZipCode: $tempRequireZipCode, tempFreeShippingAmount: $tempFreeShippingAmount, error: $error, successMessage: $successMessage, processingRateId: $processingRateId)';
}


}

/// @nodoc
abstract mixin class _$ShippingAdminStateCopyWith<$Res> implements $ShippingAdminStateCopyWith<$Res> {
  factory _$ShippingAdminStateCopyWith(_ShippingAdminState value, $Res Function(_ShippingAdminState) _then) = __$ShippingAdminStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, ShippingConfig? config, List<ShippingRate> rates, double tempRadiusKm, bool tempRequireZipCode, int? tempFreeShippingAmount, String? error, String? successMessage, String? processingRateId
});


@override $ShippingConfigCopyWith<$Res>? get config;

}
/// @nodoc
class __$ShippingAdminStateCopyWithImpl<$Res>
    implements _$ShippingAdminStateCopyWith<$Res> {
  __$ShippingAdminStateCopyWithImpl(this._self, this._then);

  final _ShippingAdminState _self;
  final $Res Function(_ShippingAdminState) _then;

/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? config = freezed,Object? rates = null,Object? tempRadiusKm = null,Object? tempRequireZipCode = null,Object? tempFreeShippingAmount = freezed,Object? error = freezed,Object? successMessage = freezed,Object? processingRateId = freezed,}) {
  return _then(_ShippingAdminState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as ShippingConfig?,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as List<ShippingRate>,tempRadiusKm: null == tempRadiusKm ? _self.tempRadiusKm : tempRadiusKm // ignore: cast_nullable_to_non_nullable
as double,tempRequireZipCode: null == tempRequireZipCode ? _self.tempRequireZipCode : tempRequireZipCode // ignore: cast_nullable_to_non_nullable
as bool,tempFreeShippingAmount: freezed == tempFreeShippingAmount ? _self.tempFreeShippingAmount : tempFreeShippingAmount // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,processingRateId: freezed == processingRateId ? _self.processingRateId : processingRateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShippingAdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShippingConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $ShippingConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
