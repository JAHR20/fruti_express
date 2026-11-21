// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_background_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerBackgroundConfig {

 BannerBackgroundType get type; String get primaryColor; String get secondaryColor; String? get tertiaryColor;// Gradiente.
 double get gradientAngle;// Imagen de fondo.
 String? get imagePath;// Superposición sobre el fondo.
 String? get overlayColor; double get overlayOpacity;
/// Create a copy of BannerBackgroundConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerBackgroundConfigCopyWith<BannerBackgroundConfig> get copyWith => _$BannerBackgroundConfigCopyWithImpl<BannerBackgroundConfig>(this as BannerBackgroundConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerBackgroundConfig&&(identical(other.type, type) || other.type == type)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&(identical(other.gradientAngle, gradientAngle) || other.gradientAngle == gradientAngle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.overlayOpacity, overlayOpacity) || other.overlayOpacity == overlayOpacity));
}


@override
int get hashCode => Object.hash(runtimeType,type,primaryColor,secondaryColor,tertiaryColor,gradientAngle,imagePath,overlayColor,overlayOpacity);

@override
String toString() {
  return 'BannerBackgroundConfig(type: $type, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, gradientAngle: $gradientAngle, imagePath: $imagePath, overlayColor: $overlayColor, overlayOpacity: $overlayOpacity)';
}


}

/// @nodoc
abstract mixin class $BannerBackgroundConfigCopyWith<$Res>  {
  factory $BannerBackgroundConfigCopyWith(BannerBackgroundConfig value, $Res Function(BannerBackgroundConfig) _then) = _$BannerBackgroundConfigCopyWithImpl;
@useResult
$Res call({
 BannerBackgroundType type, String primaryColor, String secondaryColor, String? tertiaryColor, double gradientAngle, String? imagePath, String? overlayColor, double overlayOpacity
});




}
/// @nodoc
class _$BannerBackgroundConfigCopyWithImpl<$Res>
    implements $BannerBackgroundConfigCopyWith<$Res> {
  _$BannerBackgroundConfigCopyWithImpl(this._self, this._then);

  final BannerBackgroundConfig _self;
  final $Res Function(BannerBackgroundConfig) _then;

/// Create a copy of BannerBackgroundConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? primaryColor = null,Object? secondaryColor = null,Object? tertiaryColor = freezed,Object? gradientAngle = null,Object? imagePath = freezed,Object? overlayColor = freezed,Object? overlayOpacity = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BannerBackgroundType,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as String,tertiaryColor: freezed == tertiaryColor ? _self.tertiaryColor : tertiaryColor // ignore: cast_nullable_to_non_nullable
as String?,gradientAngle: null == gradientAngle ? _self.gradientAngle : gradientAngle // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,overlayColor: freezed == overlayColor ? _self.overlayColor : overlayColor // ignore: cast_nullable_to_non_nullable
as String?,overlayOpacity: null == overlayOpacity ? _self.overlayOpacity : overlayOpacity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerBackgroundConfig].
extension BannerBackgroundConfigPatterns on BannerBackgroundConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerBackgroundConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerBackgroundConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerBackgroundConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerBackgroundConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerBackgroundConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerBackgroundConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerBackgroundConfig() when $default != null:
return $default(_that.type,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.gradientAngle,_that.imagePath,_that.overlayColor,_that.overlayOpacity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)  $default,) {final _that = this;
switch (_that) {
case _BannerBackgroundConfig():
return $default(_that.type,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.gradientAngle,_that.imagePath,_that.overlayColor,_that.overlayOpacity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)?  $default,) {final _that = this;
switch (_that) {
case _BannerBackgroundConfig() when $default != null:
return $default(_that.type,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.gradientAngle,_that.imagePath,_that.overlayColor,_that.overlayOpacity);case _:
  return null;

}
}

}

/// @nodoc


class _BannerBackgroundConfig implements BannerBackgroundConfig {
  const _BannerBackgroundConfig({this.type = BannerBackgroundType.linearGradient, this.primaryColor = '#0C700F', this.secondaryColor = '#F9A826', this.tertiaryColor, this.gradientAngle = 0.0, this.imagePath, this.overlayColor, this.overlayOpacity = 0.0});
  

@override@JsonKey() final  BannerBackgroundType type;
@override@JsonKey() final  String primaryColor;
@override@JsonKey() final  String secondaryColor;
@override final  String? tertiaryColor;
// Gradiente.
@override@JsonKey() final  double gradientAngle;
// Imagen de fondo.
@override final  String? imagePath;
// Superposición sobre el fondo.
@override final  String? overlayColor;
@override@JsonKey() final  double overlayOpacity;

/// Create a copy of BannerBackgroundConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerBackgroundConfigCopyWith<_BannerBackgroundConfig> get copyWith => __$BannerBackgroundConfigCopyWithImpl<_BannerBackgroundConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerBackgroundConfig&&(identical(other.type, type) || other.type == type)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&(identical(other.gradientAngle, gradientAngle) || other.gradientAngle == gradientAngle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.overlayOpacity, overlayOpacity) || other.overlayOpacity == overlayOpacity));
}


@override
int get hashCode => Object.hash(runtimeType,type,primaryColor,secondaryColor,tertiaryColor,gradientAngle,imagePath,overlayColor,overlayOpacity);

@override
String toString() {
  return 'BannerBackgroundConfig(type: $type, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, gradientAngle: $gradientAngle, imagePath: $imagePath, overlayColor: $overlayColor, overlayOpacity: $overlayOpacity)';
}


}

/// @nodoc
abstract mixin class _$BannerBackgroundConfigCopyWith<$Res> implements $BannerBackgroundConfigCopyWith<$Res> {
  factory _$BannerBackgroundConfigCopyWith(_BannerBackgroundConfig value, $Res Function(_BannerBackgroundConfig) _then) = __$BannerBackgroundConfigCopyWithImpl;
@override @useResult
$Res call({
 BannerBackgroundType type, String primaryColor, String secondaryColor, String? tertiaryColor, double gradientAngle, String? imagePath, String? overlayColor, double overlayOpacity
});




}
/// @nodoc
class __$BannerBackgroundConfigCopyWithImpl<$Res>
    implements _$BannerBackgroundConfigCopyWith<$Res> {
  __$BannerBackgroundConfigCopyWithImpl(this._self, this._then);

  final _BannerBackgroundConfig _self;
  final $Res Function(_BannerBackgroundConfig) _then;

/// Create a copy of BannerBackgroundConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? primaryColor = null,Object? secondaryColor = null,Object? tertiaryColor = freezed,Object? gradientAngle = null,Object? imagePath = freezed,Object? overlayColor = freezed,Object? overlayOpacity = null,}) {
  return _then(_BannerBackgroundConfig(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BannerBackgroundType,primaryColor: null == primaryColor ? _self.primaryColor : primaryColor // ignore: cast_nullable_to_non_nullable
as String,secondaryColor: null == secondaryColor ? _self.secondaryColor : secondaryColor // ignore: cast_nullable_to_non_nullable
as String,tertiaryColor: freezed == tertiaryColor ? _self.tertiaryColor : tertiaryColor // ignore: cast_nullable_to_non_nullable
as String?,gradientAngle: null == gradientAngle ? _self.gradientAngle : gradientAngle // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,overlayColor: freezed == overlayColor ? _self.overlayColor : overlayColor // ignore: cast_nullable_to_non_nullable
as String?,overlayOpacity: null == overlayOpacity ? _self.overlayOpacity : overlayOpacity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
