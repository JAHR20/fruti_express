// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_shadow_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerShadowConfig {

 bool get enabled; String get color; double get opacity; double get blurRadius; double get spreadRadius; double get offsetX; double get offsetY;
/// Create a copy of BannerShadowConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerShadowConfigCopyWith<BannerShadowConfig> get copyWith => _$BannerShadowConfigCopyWithImpl<BannerShadowConfig>(this as BannerShadowConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerShadowConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.color, color) || other.color == color)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.blurRadius, blurRadius) || other.blurRadius == blurRadius)&&(identical(other.spreadRadius, spreadRadius) || other.spreadRadius == spreadRadius)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,color,opacity,blurRadius,spreadRadius,offsetX,offsetY);

@override
String toString() {
  return 'BannerShadowConfig(enabled: $enabled, color: $color, opacity: $opacity, blurRadius: $blurRadius, spreadRadius: $spreadRadius, offsetX: $offsetX, offsetY: $offsetY)';
}


}

/// @nodoc
abstract mixin class $BannerShadowConfigCopyWith<$Res>  {
  factory $BannerShadowConfigCopyWith(BannerShadowConfig value, $Res Function(BannerShadowConfig) _then) = _$BannerShadowConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, String color, double opacity, double blurRadius, double spreadRadius, double offsetX, double offsetY
});




}
/// @nodoc
class _$BannerShadowConfigCopyWithImpl<$Res>
    implements $BannerShadowConfigCopyWith<$Res> {
  _$BannerShadowConfigCopyWithImpl(this._self, this._then);

  final BannerShadowConfig _self;
  final $Res Function(BannerShadowConfig) _then;

/// Create a copy of BannerShadowConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? color = null,Object? opacity = null,Object? blurRadius = null,Object? spreadRadius = null,Object? offsetX = null,Object? offsetY = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,blurRadius: null == blurRadius ? _self.blurRadius : blurRadius // ignore: cast_nullable_to_non_nullable
as double,spreadRadius: null == spreadRadius ? _self.spreadRadius : spreadRadius // ignore: cast_nullable_to_non_nullable
as double,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerShadowConfig].
extension BannerShadowConfigPatterns on BannerShadowConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerShadowConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerShadowConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerShadowConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerShadowConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerShadowConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerShadowConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  String color,  double opacity,  double blurRadius,  double spreadRadius,  double offsetX,  double offsetY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerShadowConfig() when $default != null:
return $default(_that.enabled,_that.color,_that.opacity,_that.blurRadius,_that.spreadRadius,_that.offsetX,_that.offsetY);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  String color,  double opacity,  double blurRadius,  double spreadRadius,  double offsetX,  double offsetY)  $default,) {final _that = this;
switch (_that) {
case _BannerShadowConfig():
return $default(_that.enabled,_that.color,_that.opacity,_that.blurRadius,_that.spreadRadius,_that.offsetX,_that.offsetY);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  String color,  double opacity,  double blurRadius,  double spreadRadius,  double offsetX,  double offsetY)?  $default,) {final _that = this;
switch (_that) {
case _BannerShadowConfig() when $default != null:
return $default(_that.enabled,_that.color,_that.opacity,_that.blurRadius,_that.spreadRadius,_that.offsetX,_that.offsetY);case _:
  return null;

}
}

}

/// @nodoc


class _BannerShadowConfig implements BannerShadowConfig {
  const _BannerShadowConfig({this.enabled = false, this.color = '#000000', this.opacity = 0.15, this.blurRadius = 8.0, this.spreadRadius = 2.0, this.offsetX = 0.0, this.offsetY = 4.0});
  

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  String color;
@override@JsonKey() final  double opacity;
@override@JsonKey() final  double blurRadius;
@override@JsonKey() final  double spreadRadius;
@override@JsonKey() final  double offsetX;
@override@JsonKey() final  double offsetY;

/// Create a copy of BannerShadowConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerShadowConfigCopyWith<_BannerShadowConfig> get copyWith => __$BannerShadowConfigCopyWithImpl<_BannerShadowConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerShadowConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.color, color) || other.color == color)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.blurRadius, blurRadius) || other.blurRadius == blurRadius)&&(identical(other.spreadRadius, spreadRadius) || other.spreadRadius == spreadRadius)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,color,opacity,blurRadius,spreadRadius,offsetX,offsetY);

@override
String toString() {
  return 'BannerShadowConfig(enabled: $enabled, color: $color, opacity: $opacity, blurRadius: $blurRadius, spreadRadius: $spreadRadius, offsetX: $offsetX, offsetY: $offsetY)';
}


}

/// @nodoc
abstract mixin class _$BannerShadowConfigCopyWith<$Res> implements $BannerShadowConfigCopyWith<$Res> {
  factory _$BannerShadowConfigCopyWith(_BannerShadowConfig value, $Res Function(_BannerShadowConfig) _then) = __$BannerShadowConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, String color, double opacity, double blurRadius, double spreadRadius, double offsetX, double offsetY
});




}
/// @nodoc
class __$BannerShadowConfigCopyWithImpl<$Res>
    implements _$BannerShadowConfigCopyWith<$Res> {
  __$BannerShadowConfigCopyWithImpl(this._self, this._then);

  final _BannerShadowConfig _self;
  final $Res Function(_BannerShadowConfig) _then;

/// Create a copy of BannerShadowConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? color = null,Object? opacity = null,Object? blurRadius = null,Object? spreadRadius = null,Object? offsetX = null,Object? offsetY = null,}) {
  return _then(_BannerShadowConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,blurRadius: null == blurRadius ? _self.blurRadius : blurRadius // ignore: cast_nullable_to_non_nullable
as double,spreadRadius: null == spreadRadius ? _self.spreadRadius : spreadRadius // ignore: cast_nullable_to_non_nullable
as double,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
