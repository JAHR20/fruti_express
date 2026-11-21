// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_style_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerStyleConfig {

 int get version; BannerFormat get defaultFormat; Map<BannerFormat, BannerFormatConfig> get formats;
/// Create a copy of BannerStyleConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerStyleConfigCopyWith<BannerStyleConfig> get copyWith => _$BannerStyleConfigCopyWithImpl<BannerStyleConfig>(this as BannerStyleConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerStyleConfig&&(identical(other.version, version) || other.version == version)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other.formats, formats));
}


@override
int get hashCode => Object.hash(runtimeType,version,defaultFormat,const DeepCollectionEquality().hash(formats));

@override
String toString() {
  return 'BannerStyleConfig(version: $version, defaultFormat: $defaultFormat, formats: $formats)';
}


}

/// @nodoc
abstract mixin class $BannerStyleConfigCopyWith<$Res>  {
  factory $BannerStyleConfigCopyWith(BannerStyleConfig value, $Res Function(BannerStyleConfig) _then) = _$BannerStyleConfigCopyWithImpl;
@useResult
$Res call({
 int version, BannerFormat defaultFormat, Map<BannerFormat, BannerFormatConfig> formats
});




}
/// @nodoc
class _$BannerStyleConfigCopyWithImpl<$Res>
    implements $BannerStyleConfigCopyWith<$Res> {
  _$BannerStyleConfigCopyWithImpl(this._self, this._then);

  final BannerStyleConfig _self;
  final $Res Function(BannerStyleConfig) _then;

/// Create a copy of BannerStyleConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? defaultFormat = null,Object? formats = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as BannerFormat,formats: null == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as Map<BannerFormat, BannerFormatConfig>,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerStyleConfig].
extension BannerStyleConfigPatterns on BannerStyleConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerStyleConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerStyleConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerStyleConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerStyleConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerStyleConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerStyleConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  BannerFormat defaultFormat,  Map<BannerFormat, BannerFormatConfig> formats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerStyleConfig() when $default != null:
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  BannerFormat defaultFormat,  Map<BannerFormat, BannerFormatConfig> formats)  $default,) {final _that = this;
switch (_that) {
case _BannerStyleConfig():
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  BannerFormat defaultFormat,  Map<BannerFormat, BannerFormatConfig> formats)?  $default,) {final _that = this;
switch (_that) {
case _BannerStyleConfig() when $default != null:
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
  return null;

}
}

}

/// @nodoc


class _BannerStyleConfig implements BannerStyleConfig {
  const _BannerStyleConfig({required this.version, required this.defaultFormat, required final  Map<BannerFormat, BannerFormatConfig> formats}): _formats = formats;
  

@override final  int version;
@override final  BannerFormat defaultFormat;
 final  Map<BannerFormat, BannerFormatConfig> _formats;
@override Map<BannerFormat, BannerFormatConfig> get formats {
  if (_formats is EqualUnmodifiableMapView) return _formats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_formats);
}


/// Create a copy of BannerStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerStyleConfigCopyWith<_BannerStyleConfig> get copyWith => __$BannerStyleConfigCopyWithImpl<_BannerStyleConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerStyleConfig&&(identical(other.version, version) || other.version == version)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other._formats, _formats));
}


@override
int get hashCode => Object.hash(runtimeType,version,defaultFormat,const DeepCollectionEquality().hash(_formats));

@override
String toString() {
  return 'BannerStyleConfig(version: $version, defaultFormat: $defaultFormat, formats: $formats)';
}


}

/// @nodoc
abstract mixin class _$BannerStyleConfigCopyWith<$Res> implements $BannerStyleConfigCopyWith<$Res> {
  factory _$BannerStyleConfigCopyWith(_BannerStyleConfig value, $Res Function(_BannerStyleConfig) _then) = __$BannerStyleConfigCopyWithImpl;
@override @useResult
$Res call({
 int version, BannerFormat defaultFormat, Map<BannerFormat, BannerFormatConfig> formats
});




}
/// @nodoc
class __$BannerStyleConfigCopyWithImpl<$Res>
    implements _$BannerStyleConfigCopyWith<$Res> {
  __$BannerStyleConfigCopyWithImpl(this._self, this._then);

  final _BannerStyleConfig _self;
  final $Res Function(_BannerStyleConfig) _then;

/// Create a copy of BannerStyleConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? defaultFormat = null,Object? formats = null,}) {
  return _then(_BannerStyleConfig(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as BannerFormat,formats: null == formats ? _self._formats : formats // ignore: cast_nullable_to_non_nullable
as Map<BannerFormat, BannerFormatConfig>,
  ));
}


}

// dart format on
