// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_layout_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerLayoutConfig {

// Espaciado interior.
 double get paddingTop; double get paddingRight; double get paddingBottom; double get paddingLeft;// Separación entre elementos.
 double get elementSpacing;// Alineación del contenido.
 BannerTextAlignment get horizontalAlignment; BannerVerticalAlignment get verticalAlignment;// Desplazamiento del contenido.
 double get offsetX; double get offsetY;
/// Create a copy of BannerLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerLayoutConfigCopyWith<BannerLayoutConfig> get copyWith => _$BannerLayoutConfigCopyWithImpl<BannerLayoutConfig>(this as BannerLayoutConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerLayoutConfig&&(identical(other.paddingTop, paddingTop) || other.paddingTop == paddingTop)&&(identical(other.paddingRight, paddingRight) || other.paddingRight == paddingRight)&&(identical(other.paddingBottom, paddingBottom) || other.paddingBottom == paddingBottom)&&(identical(other.paddingLeft, paddingLeft) || other.paddingLeft == paddingLeft)&&(identical(other.elementSpacing, elementSpacing) || other.elementSpacing == elementSpacing)&&(identical(other.horizontalAlignment, horizontalAlignment) || other.horizontalAlignment == horizontalAlignment)&&(identical(other.verticalAlignment, verticalAlignment) || other.verticalAlignment == verticalAlignment)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY));
}


@override
int get hashCode => Object.hash(runtimeType,paddingTop,paddingRight,paddingBottom,paddingLeft,elementSpacing,horizontalAlignment,verticalAlignment,offsetX,offsetY);

@override
String toString() {
  return 'BannerLayoutConfig(paddingTop: $paddingTop, paddingRight: $paddingRight, paddingBottom: $paddingBottom, paddingLeft: $paddingLeft, elementSpacing: $elementSpacing, horizontalAlignment: $horizontalAlignment, verticalAlignment: $verticalAlignment, offsetX: $offsetX, offsetY: $offsetY)';
}


}

/// @nodoc
abstract mixin class $BannerLayoutConfigCopyWith<$Res>  {
  factory $BannerLayoutConfigCopyWith(BannerLayoutConfig value, $Res Function(BannerLayoutConfig) _then) = _$BannerLayoutConfigCopyWithImpl;
@useResult
$Res call({
 double paddingTop, double paddingRight, double paddingBottom, double paddingLeft, double elementSpacing, BannerTextAlignment horizontalAlignment, BannerVerticalAlignment verticalAlignment, double offsetX, double offsetY
});




}
/// @nodoc
class _$BannerLayoutConfigCopyWithImpl<$Res>
    implements $BannerLayoutConfigCopyWith<$Res> {
  _$BannerLayoutConfigCopyWithImpl(this._self, this._then);

  final BannerLayoutConfig _self;
  final $Res Function(BannerLayoutConfig) _then;

/// Create a copy of BannerLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paddingTop = null,Object? paddingRight = null,Object? paddingBottom = null,Object? paddingLeft = null,Object? elementSpacing = null,Object? horizontalAlignment = null,Object? verticalAlignment = null,Object? offsetX = null,Object? offsetY = null,}) {
  return _then(_self.copyWith(
paddingTop: null == paddingTop ? _self.paddingTop : paddingTop // ignore: cast_nullable_to_non_nullable
as double,paddingRight: null == paddingRight ? _self.paddingRight : paddingRight // ignore: cast_nullable_to_non_nullable
as double,paddingBottom: null == paddingBottom ? _self.paddingBottom : paddingBottom // ignore: cast_nullable_to_non_nullable
as double,paddingLeft: null == paddingLeft ? _self.paddingLeft : paddingLeft // ignore: cast_nullable_to_non_nullable
as double,elementSpacing: null == elementSpacing ? _self.elementSpacing : elementSpacing // ignore: cast_nullable_to_non_nullable
as double,horizontalAlignment: null == horizontalAlignment ? _self.horizontalAlignment : horizontalAlignment // ignore: cast_nullable_to_non_nullable
as BannerTextAlignment,verticalAlignment: null == verticalAlignment ? _self.verticalAlignment : verticalAlignment // ignore: cast_nullable_to_non_nullable
as BannerVerticalAlignment,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerLayoutConfig].
extension BannerLayoutConfigPatterns on BannerLayoutConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerLayoutConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerLayoutConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerLayoutConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerLayoutConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerLayoutConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double paddingTop,  double paddingRight,  double paddingBottom,  double paddingLeft,  double elementSpacing,  BannerTextAlignment horizontalAlignment,  BannerVerticalAlignment verticalAlignment,  double offsetX,  double offsetY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerLayoutConfig() when $default != null:
return $default(_that.paddingTop,_that.paddingRight,_that.paddingBottom,_that.paddingLeft,_that.elementSpacing,_that.horizontalAlignment,_that.verticalAlignment,_that.offsetX,_that.offsetY);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double paddingTop,  double paddingRight,  double paddingBottom,  double paddingLeft,  double elementSpacing,  BannerTextAlignment horizontalAlignment,  BannerVerticalAlignment verticalAlignment,  double offsetX,  double offsetY)  $default,) {final _that = this;
switch (_that) {
case _BannerLayoutConfig():
return $default(_that.paddingTop,_that.paddingRight,_that.paddingBottom,_that.paddingLeft,_that.elementSpacing,_that.horizontalAlignment,_that.verticalAlignment,_that.offsetX,_that.offsetY);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double paddingTop,  double paddingRight,  double paddingBottom,  double paddingLeft,  double elementSpacing,  BannerTextAlignment horizontalAlignment,  BannerVerticalAlignment verticalAlignment,  double offsetX,  double offsetY)?  $default,) {final _that = this;
switch (_that) {
case _BannerLayoutConfig() when $default != null:
return $default(_that.paddingTop,_that.paddingRight,_that.paddingBottom,_that.paddingLeft,_that.elementSpacing,_that.horizontalAlignment,_that.verticalAlignment,_that.offsetX,_that.offsetY);case _:
  return null;

}
}

}

/// @nodoc


class _BannerLayoutConfig implements BannerLayoutConfig {
  const _BannerLayoutConfig({this.paddingTop = 16.0, this.paddingRight = 16.0, this.paddingBottom = 16.0, this.paddingLeft = 16.0, this.elementSpacing = 8.0, this.horizontalAlignment = BannerTextAlignment.left, this.verticalAlignment = BannerVerticalAlignment.center, this.offsetX = 0.0, this.offsetY = 0.0});
  

// Espaciado interior.
@override@JsonKey() final  double paddingTop;
@override@JsonKey() final  double paddingRight;
@override@JsonKey() final  double paddingBottom;
@override@JsonKey() final  double paddingLeft;
// Separación entre elementos.
@override@JsonKey() final  double elementSpacing;
// Alineación del contenido.
@override@JsonKey() final  BannerTextAlignment horizontalAlignment;
@override@JsonKey() final  BannerVerticalAlignment verticalAlignment;
// Desplazamiento del contenido.
@override@JsonKey() final  double offsetX;
@override@JsonKey() final  double offsetY;

/// Create a copy of BannerLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerLayoutConfigCopyWith<_BannerLayoutConfig> get copyWith => __$BannerLayoutConfigCopyWithImpl<_BannerLayoutConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerLayoutConfig&&(identical(other.paddingTop, paddingTop) || other.paddingTop == paddingTop)&&(identical(other.paddingRight, paddingRight) || other.paddingRight == paddingRight)&&(identical(other.paddingBottom, paddingBottom) || other.paddingBottom == paddingBottom)&&(identical(other.paddingLeft, paddingLeft) || other.paddingLeft == paddingLeft)&&(identical(other.elementSpacing, elementSpacing) || other.elementSpacing == elementSpacing)&&(identical(other.horizontalAlignment, horizontalAlignment) || other.horizontalAlignment == horizontalAlignment)&&(identical(other.verticalAlignment, verticalAlignment) || other.verticalAlignment == verticalAlignment)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY));
}


@override
int get hashCode => Object.hash(runtimeType,paddingTop,paddingRight,paddingBottom,paddingLeft,elementSpacing,horizontalAlignment,verticalAlignment,offsetX,offsetY);

@override
String toString() {
  return 'BannerLayoutConfig(paddingTop: $paddingTop, paddingRight: $paddingRight, paddingBottom: $paddingBottom, paddingLeft: $paddingLeft, elementSpacing: $elementSpacing, horizontalAlignment: $horizontalAlignment, verticalAlignment: $verticalAlignment, offsetX: $offsetX, offsetY: $offsetY)';
}


}

/// @nodoc
abstract mixin class _$BannerLayoutConfigCopyWith<$Res> implements $BannerLayoutConfigCopyWith<$Res> {
  factory _$BannerLayoutConfigCopyWith(_BannerLayoutConfig value, $Res Function(_BannerLayoutConfig) _then) = __$BannerLayoutConfigCopyWithImpl;
@override @useResult
$Res call({
 double paddingTop, double paddingRight, double paddingBottom, double paddingLeft, double elementSpacing, BannerTextAlignment horizontalAlignment, BannerVerticalAlignment verticalAlignment, double offsetX, double offsetY
});




}
/// @nodoc
class __$BannerLayoutConfigCopyWithImpl<$Res>
    implements _$BannerLayoutConfigCopyWith<$Res> {
  __$BannerLayoutConfigCopyWithImpl(this._self, this._then);

  final _BannerLayoutConfig _self;
  final $Res Function(_BannerLayoutConfig) _then;

/// Create a copy of BannerLayoutConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paddingTop = null,Object? paddingRight = null,Object? paddingBottom = null,Object? paddingLeft = null,Object? elementSpacing = null,Object? horizontalAlignment = null,Object? verticalAlignment = null,Object? offsetX = null,Object? offsetY = null,}) {
  return _then(_BannerLayoutConfig(
paddingTop: null == paddingTop ? _self.paddingTop : paddingTop // ignore: cast_nullable_to_non_nullable
as double,paddingRight: null == paddingRight ? _self.paddingRight : paddingRight // ignore: cast_nullable_to_non_nullable
as double,paddingBottom: null == paddingBottom ? _self.paddingBottom : paddingBottom // ignore: cast_nullable_to_non_nullable
as double,paddingLeft: null == paddingLeft ? _self.paddingLeft : paddingLeft // ignore: cast_nullable_to_non_nullable
as double,elementSpacing: null == elementSpacing ? _self.elementSpacing : elementSpacing // ignore: cast_nullable_to_non_nullable
as double,horizontalAlignment: null == horizontalAlignment ? _self.horizontalAlignment : horizontalAlignment // ignore: cast_nullable_to_non_nullable
as BannerTextAlignment,verticalAlignment: null == verticalAlignment ? _self.verticalAlignment : verticalAlignment // ignore: cast_nullable_to_non_nullable
as BannerVerticalAlignment,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
