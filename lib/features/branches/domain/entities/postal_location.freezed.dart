// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postal_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostalLocation {

 String get postalCode; String get state; String get municipality; List<String> get availablePostalCodes; Map<String, List<String>> get neighborhoodsByPostalCode;
/// Create a copy of PostalLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostalLocationCopyWith<PostalLocation> get copyWith => _$PostalLocationCopyWithImpl<PostalLocation>(this as PostalLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostalLocation&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.state, state) || other.state == state)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&const DeepCollectionEquality().equals(other.availablePostalCodes, availablePostalCodes)&&const DeepCollectionEquality().equals(other.neighborhoodsByPostalCode, neighborhoodsByPostalCode));
}


@override
int get hashCode => Object.hash(runtimeType,postalCode,state,municipality,const DeepCollectionEquality().hash(availablePostalCodes),const DeepCollectionEquality().hash(neighborhoodsByPostalCode));

@override
String toString() {
  return 'PostalLocation(postalCode: $postalCode, state: $state, municipality: $municipality, availablePostalCodes: $availablePostalCodes, neighborhoodsByPostalCode: $neighborhoodsByPostalCode)';
}


}

/// @nodoc
abstract mixin class $PostalLocationCopyWith<$Res>  {
  factory $PostalLocationCopyWith(PostalLocation value, $Res Function(PostalLocation) _then) = _$PostalLocationCopyWithImpl;
@useResult
$Res call({
 String postalCode, String state, String municipality, List<String> availablePostalCodes, Map<String, List<String>> neighborhoodsByPostalCode
});




}
/// @nodoc
class _$PostalLocationCopyWithImpl<$Res>
    implements $PostalLocationCopyWith<$Res> {
  _$PostalLocationCopyWithImpl(this._self, this._then);

  final PostalLocation _self;
  final $Res Function(PostalLocation) _then;

/// Create a copy of PostalLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postalCode = null,Object? state = null,Object? municipality = null,Object? availablePostalCodes = null,Object? neighborhoodsByPostalCode = null,}) {
  return _then(_self.copyWith(
postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,availablePostalCodes: null == availablePostalCodes ? _self.availablePostalCodes : availablePostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,neighborhoodsByPostalCode: null == neighborhoodsByPostalCode ? _self.neighborhoodsByPostalCode : neighborhoodsByPostalCode // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [PostalLocation].
extension PostalLocationPatterns on PostalLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostalLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostalLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostalLocation value)  $default,){
final _that = this;
switch (_that) {
case _PostalLocation():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostalLocation value)?  $default,){
final _that = this;
switch (_that) {
case _PostalLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String postalCode,  String state,  String municipality,  List<String> availablePostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostalLocation() when $default != null:
return $default(_that.postalCode,_that.state,_that.municipality,_that.availablePostalCodes,_that.neighborhoodsByPostalCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String postalCode,  String state,  String municipality,  List<String> availablePostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode)  $default,) {final _that = this;
switch (_that) {
case _PostalLocation():
return $default(_that.postalCode,_that.state,_that.municipality,_that.availablePostalCodes,_that.neighborhoodsByPostalCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String postalCode,  String state,  String municipality,  List<String> availablePostalCodes,  Map<String, List<String>> neighborhoodsByPostalCode)?  $default,) {final _that = this;
switch (_that) {
case _PostalLocation() when $default != null:
return $default(_that.postalCode,_that.state,_that.municipality,_that.availablePostalCodes,_that.neighborhoodsByPostalCode);case _:
  return null;

}
}

}

/// @nodoc


class _PostalLocation implements PostalLocation {
  const _PostalLocation({required this.postalCode, required this.state, required this.municipality, final  List<String> availablePostalCodes = const [], final  Map<String, List<String>> neighborhoodsByPostalCode = const {}}): _availablePostalCodes = availablePostalCodes,_neighborhoodsByPostalCode = neighborhoodsByPostalCode;
  

@override final  String postalCode;
@override final  String state;
@override final  String municipality;
 final  List<String> _availablePostalCodes;
@override@JsonKey() List<String> get availablePostalCodes {
  if (_availablePostalCodes is EqualUnmodifiableListView) return _availablePostalCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availablePostalCodes);
}

 final  Map<String, List<String>> _neighborhoodsByPostalCode;
@override@JsonKey() Map<String, List<String>> get neighborhoodsByPostalCode {
  if (_neighborhoodsByPostalCode is EqualUnmodifiableMapView) return _neighborhoodsByPostalCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_neighborhoodsByPostalCode);
}


/// Create a copy of PostalLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostalLocationCopyWith<_PostalLocation> get copyWith => __$PostalLocationCopyWithImpl<_PostalLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostalLocation&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.state, state) || other.state == state)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&const DeepCollectionEquality().equals(other._availablePostalCodes, _availablePostalCodes)&&const DeepCollectionEquality().equals(other._neighborhoodsByPostalCode, _neighborhoodsByPostalCode));
}


@override
int get hashCode => Object.hash(runtimeType,postalCode,state,municipality,const DeepCollectionEquality().hash(_availablePostalCodes),const DeepCollectionEquality().hash(_neighborhoodsByPostalCode));

@override
String toString() {
  return 'PostalLocation(postalCode: $postalCode, state: $state, municipality: $municipality, availablePostalCodes: $availablePostalCodes, neighborhoodsByPostalCode: $neighborhoodsByPostalCode)';
}


}

/// @nodoc
abstract mixin class _$PostalLocationCopyWith<$Res> implements $PostalLocationCopyWith<$Res> {
  factory _$PostalLocationCopyWith(_PostalLocation value, $Res Function(_PostalLocation) _then) = __$PostalLocationCopyWithImpl;
@override @useResult
$Res call({
 String postalCode, String state, String municipality, List<String> availablePostalCodes, Map<String, List<String>> neighborhoodsByPostalCode
});




}
/// @nodoc
class __$PostalLocationCopyWithImpl<$Res>
    implements _$PostalLocationCopyWith<$Res> {
  __$PostalLocationCopyWithImpl(this._self, this._then);

  final _PostalLocation _self;
  final $Res Function(_PostalLocation) _then;

/// Create a copy of PostalLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postalCode = null,Object? state = null,Object? municipality = null,Object? availablePostalCodes = null,Object? neighborhoodsByPostalCode = null,}) {
  return _then(_PostalLocation(
postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,availablePostalCodes: null == availablePostalCodes ? _self._availablePostalCodes : availablePostalCodes // ignore: cast_nullable_to_non_nullable
as List<String>,neighborhoodsByPostalCode: null == neighborhoodsByPostalCode ? _self._neighborhoodsByPostalCode : neighborhoodsByPostalCode // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
