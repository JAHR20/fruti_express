// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_shipping_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerShippingState {

 bool get isLoading; List<ShippingConfig> get configs; String? get error;
/// Create a copy of CustomerShippingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerShippingStateCopyWith<CustomerShippingState> get copyWith => _$CustomerShippingStateCopyWithImpl<CustomerShippingState>(this as CustomerShippingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerShippingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.configs, configs)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(configs),error);

@override
String toString() {
  return 'CustomerShippingState(isLoading: $isLoading, configs: $configs, error: $error)';
}


}

/// @nodoc
abstract mixin class $CustomerShippingStateCopyWith<$Res>  {
  factory $CustomerShippingStateCopyWith(CustomerShippingState value, $Res Function(CustomerShippingState) _then) = _$CustomerShippingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<ShippingConfig> configs, String? error
});




}
/// @nodoc
class _$CustomerShippingStateCopyWithImpl<$Res>
    implements $CustomerShippingStateCopyWith<$Res> {
  _$CustomerShippingStateCopyWithImpl(this._self, this._then);

  final CustomerShippingState _self;
  final $Res Function(CustomerShippingState) _then;

/// Create a copy of CustomerShippingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? configs = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configs: null == configs ? _self.configs : configs // ignore: cast_nullable_to_non_nullable
as List<ShippingConfig>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerShippingState].
extension CustomerShippingStatePatterns on CustomerShippingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerShippingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerShippingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerShippingState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerShippingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerShippingState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerShippingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<ShippingConfig> configs,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerShippingState() when $default != null:
return $default(_that.isLoading,_that.configs,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<ShippingConfig> configs,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CustomerShippingState():
return $default(_that.isLoading,_that.configs,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<ShippingConfig> configs,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CustomerShippingState() when $default != null:
return $default(_that.isLoading,_that.configs,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerShippingState implements CustomerShippingState {
  const _CustomerShippingState({this.isLoading = false, final  List<ShippingConfig> configs = const [], this.error}): _configs = configs;
  

@override@JsonKey() final  bool isLoading;
 final  List<ShippingConfig> _configs;
@override@JsonKey() List<ShippingConfig> get configs {
  if (_configs is EqualUnmodifiableListView) return _configs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_configs);
}

@override final  String? error;

/// Create a copy of CustomerShippingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerShippingStateCopyWith<_CustomerShippingState> get copyWith => __$CustomerShippingStateCopyWithImpl<_CustomerShippingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerShippingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._configs, _configs)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_configs),error);

@override
String toString() {
  return 'CustomerShippingState(isLoading: $isLoading, configs: $configs, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CustomerShippingStateCopyWith<$Res> implements $CustomerShippingStateCopyWith<$Res> {
  factory _$CustomerShippingStateCopyWith(_CustomerShippingState value, $Res Function(_CustomerShippingState) _then) = __$CustomerShippingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<ShippingConfig> configs, String? error
});




}
/// @nodoc
class __$CustomerShippingStateCopyWithImpl<$Res>
    implements _$CustomerShippingStateCopyWith<$Res> {
  __$CustomerShippingStateCopyWithImpl(this._self, this._then);

  final _CustomerShippingState _self;
  final $Res Function(_CustomerShippingState) _then;

/// Create a copy of CustomerShippingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? configs = null,Object? error = freezed,}) {
  return _then(_CustomerShippingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,configs: null == configs ? _self._configs : configs // ignore: cast_nullable_to_non_nullable
as List<ShippingConfig>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
