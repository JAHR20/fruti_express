// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_border_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerBorderConfig {

 bool get enabled; String get color; double get width; double get radius;
/// Create a copy of BannerBorderConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerBorderConfigCopyWith<BannerBorderConfig> get copyWith => _$BannerBorderConfigCopyWithImpl<BannerBorderConfig>(this as BannerBorderConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerBorderConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width)&&(identical(other.radius, radius) || other.radius == radius));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,color,width,radius);

@override
String toString() {
  return 'BannerBorderConfig(enabled: $enabled, color: $color, width: $width, radius: $radius)';
}


}

/// @nodoc
abstract mixin class $BannerBorderConfigCopyWith<$Res>  {
  factory $BannerBorderConfigCopyWith(BannerBorderConfig value, $Res Function(BannerBorderConfig) _then) = _$BannerBorderConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, String color, double width, double radius
});




}
/// @nodoc
class _$BannerBorderConfigCopyWithImpl<$Res>
    implements $BannerBorderConfigCopyWith<$Res> {
  _$BannerBorderConfigCopyWithImpl(this._self, this._then);

  final BannerBorderConfig _self;
  final $Res Function(BannerBorderConfig) _then;

/// Create a copy of BannerBorderConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? color = null,Object? width = null,Object? radius = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerBorderConfig].
extension BannerBorderConfigPatterns on BannerBorderConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerBorderConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerBorderConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerBorderConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerBorderConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerBorderConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerBorderConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  String color,  double width,  double radius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerBorderConfig() when $default != null:
return $default(_that.enabled,_that.color,_that.width,_that.radius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  String color,  double width,  double radius)  $default,) {final _that = this;
switch (_that) {
case _BannerBorderConfig():
return $default(_that.enabled,_that.color,_that.width,_that.radius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  String color,  double width,  double radius)?  $default,) {final _that = this;
switch (_that) {
case _BannerBorderConfig() when $default != null:
return $default(_that.enabled,_that.color,_that.width,_that.radius);case _:
  return null;

}
}

}

/// @nodoc


class _BannerBorderConfig implements BannerBorderConfig {
  const _BannerBorderConfig({this.enabled = false, this.color = '#FFFFFF', this.width = 1.0, this.radius = 16.0});
  

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  String color;
@override@JsonKey() final  double width;
@override@JsonKey() final  double radius;

/// Create a copy of BannerBorderConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerBorderConfigCopyWith<_BannerBorderConfig> get copyWith => __$BannerBorderConfigCopyWithImpl<_BannerBorderConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerBorderConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.color, color) || other.color == color)&&(identical(other.width, width) || other.width == width)&&(identical(other.radius, radius) || other.radius == radius));
}


@override
int get hashCode => Object.hash(runtimeType,enabled,color,width,radius);

@override
String toString() {
  return 'BannerBorderConfig(enabled: $enabled, color: $color, width: $width, radius: $radius)';
}


}

/// @nodoc
abstract mixin class _$BannerBorderConfigCopyWith<$Res> implements $BannerBorderConfigCopyWith<$Res> {
  factory _$BannerBorderConfigCopyWith(_BannerBorderConfig value, $Res Function(_BannerBorderConfig) _then) = __$BannerBorderConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, String color, double width, double radius
});




}
/// @nodoc
class __$BannerBorderConfigCopyWithImpl<$Res>
    implements _$BannerBorderConfigCopyWith<$Res> {
  __$BannerBorderConfigCopyWithImpl(this._self, this._then);

  final _BannerBorderConfig _self;
  final $Res Function(_BannerBorderConfig) _then;

/// Create a copy of BannerBorderConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? color = null,Object? width = null,Object? radius = null,}) {
  return _then(_BannerBorderConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
