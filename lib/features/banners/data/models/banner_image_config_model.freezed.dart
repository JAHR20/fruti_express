// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_image_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerImageConfigModel {

 String get imagePath;@JsonKey(unknownEnumValue: BannerImagePosition.right) BannerImagePosition get position;@JsonKey(unknownEnumValue: BannerImageFit.cover) BannerImageFit get fit; double get widthPercent; double get heightPercent; double get opacity; double get offsetX; double get offsetY; double get rotation; double get borderRadius; bool get visible;
/// Create a copy of BannerImageConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerImageConfigModelCopyWith<BannerImageConfigModel> get copyWith => _$BannerImageConfigModelCopyWithImpl<BannerImageConfigModel>(this as BannerImageConfigModel, _$identity);

  /// Serializes this BannerImageConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerImageConfigModel&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.position, position) || other.position == position)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.widthPercent, widthPercent) || other.widthPercent == widthPercent)&&(identical(other.heightPercent, heightPercent) || other.heightPercent == heightPercent)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,position,fit,widthPercent,heightPercent,opacity,offsetX,offsetY,rotation,borderRadius,visible);

@override
String toString() {
  return 'BannerImageConfigModel(imagePath: $imagePath, position: $position, fit: $fit, widthPercent: $widthPercent, heightPercent: $heightPercent, opacity: $opacity, offsetX: $offsetX, offsetY: $offsetY, rotation: $rotation, borderRadius: $borderRadius, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $BannerImageConfigModelCopyWith<$Res>  {
  factory $BannerImageConfigModelCopyWith(BannerImageConfigModel value, $Res Function(BannerImageConfigModel) _then) = _$BannerImageConfigModelCopyWithImpl;
@useResult
$Res call({
 String imagePath,@JsonKey(unknownEnumValue: BannerImagePosition.right) BannerImagePosition position,@JsonKey(unknownEnumValue: BannerImageFit.cover) BannerImageFit fit, double widthPercent, double heightPercent, double opacity, double offsetX, double offsetY, double rotation, double borderRadius, bool visible
});




}
/// @nodoc
class _$BannerImageConfigModelCopyWithImpl<$Res>
    implements $BannerImageConfigModelCopyWith<$Res> {
  _$BannerImageConfigModelCopyWithImpl(this._self, this._then);

  final BannerImageConfigModel _self;
  final $Res Function(BannerImageConfigModel) _then;

/// Create a copy of BannerImageConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? position = null,Object? fit = null,Object? widthPercent = null,Object? heightPercent = null,Object? opacity = null,Object? offsetX = null,Object? offsetY = null,Object? rotation = null,Object? borderRadius = null,Object? visible = null,}) {
  return _then(_self.copyWith(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as BannerImagePosition,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BannerImageFit,widthPercent: null == widthPercent ? _self.widthPercent : widthPercent // ignore: cast_nullable_to_non_nullable
as double,heightPercent: null == heightPercent ? _self.heightPercent : heightPercent // ignore: cast_nullable_to_non_nullable
as double,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerImageConfigModel].
extension BannerImageConfigModelPatterns on BannerImageConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerImageConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerImageConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerImageConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerImageConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerImageConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerImageConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath, @JsonKey(unknownEnumValue: BannerImagePosition.right)  BannerImagePosition position, @JsonKey(unknownEnumValue: BannerImageFit.cover)  BannerImageFit fit,  double widthPercent,  double heightPercent,  double opacity,  double offsetX,  double offsetY,  double rotation,  double borderRadius,  bool visible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerImageConfigModel() when $default != null:
return $default(_that.imagePath,_that.position,_that.fit,_that.widthPercent,_that.heightPercent,_that.opacity,_that.offsetX,_that.offsetY,_that.rotation,_that.borderRadius,_that.visible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath, @JsonKey(unknownEnumValue: BannerImagePosition.right)  BannerImagePosition position, @JsonKey(unknownEnumValue: BannerImageFit.cover)  BannerImageFit fit,  double widthPercent,  double heightPercent,  double opacity,  double offsetX,  double offsetY,  double rotation,  double borderRadius,  bool visible)  $default,) {final _that = this;
switch (_that) {
case _BannerImageConfigModel():
return $default(_that.imagePath,_that.position,_that.fit,_that.widthPercent,_that.heightPercent,_that.opacity,_that.offsetX,_that.offsetY,_that.rotation,_that.borderRadius,_that.visible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath, @JsonKey(unknownEnumValue: BannerImagePosition.right)  BannerImagePosition position, @JsonKey(unknownEnumValue: BannerImageFit.cover)  BannerImageFit fit,  double widthPercent,  double heightPercent,  double opacity,  double offsetX,  double offsetY,  double rotation,  double borderRadius,  bool visible)?  $default,) {final _that = this;
switch (_that) {
case _BannerImageConfigModel() when $default != null:
return $default(_that.imagePath,_that.position,_that.fit,_that.widthPercent,_that.heightPercent,_that.opacity,_that.offsetX,_that.offsetY,_that.rotation,_that.borderRadius,_that.visible);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerImageConfigModel extends BannerImageConfigModel {
  const _BannerImageConfigModel({this.imagePath = '', @JsonKey(unknownEnumValue: BannerImagePosition.right) this.position = BannerImagePosition.right, @JsonKey(unknownEnumValue: BannerImageFit.cover) this.fit = BannerImageFit.cover, this.widthPercent = 40.0, this.heightPercent = 100.0, this.opacity = 1.0, this.offsetX = 0.0, this.offsetY = 0.0, this.rotation = 0.0, this.borderRadius = 12.0, this.visible = true}): super._();
  factory _BannerImageConfigModel.fromJson(Map<String, dynamic> json) => _$BannerImageConfigModelFromJson(json);

@override@JsonKey() final  String imagePath;
@override@JsonKey(unknownEnumValue: BannerImagePosition.right) final  BannerImagePosition position;
@override@JsonKey(unknownEnumValue: BannerImageFit.cover) final  BannerImageFit fit;
@override@JsonKey() final  double widthPercent;
@override@JsonKey() final  double heightPercent;
@override@JsonKey() final  double opacity;
@override@JsonKey() final  double offsetX;
@override@JsonKey() final  double offsetY;
@override@JsonKey() final  double rotation;
@override@JsonKey() final  double borderRadius;
@override@JsonKey() final  bool visible;

/// Create a copy of BannerImageConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerImageConfigModelCopyWith<_BannerImageConfigModel> get copyWith => __$BannerImageConfigModelCopyWithImpl<_BannerImageConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerImageConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerImageConfigModel&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.position, position) || other.position == position)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.widthPercent, widthPercent) || other.widthPercent == widthPercent)&&(identical(other.heightPercent, heightPercent) || other.heightPercent == heightPercent)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.offsetX, offsetX) || other.offsetX == offsetX)&&(identical(other.offsetY, offsetY) || other.offsetY == offsetY)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.visible, visible) || other.visible == visible));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,position,fit,widthPercent,heightPercent,opacity,offsetX,offsetY,rotation,borderRadius,visible);

@override
String toString() {
  return 'BannerImageConfigModel(imagePath: $imagePath, position: $position, fit: $fit, widthPercent: $widthPercent, heightPercent: $heightPercent, opacity: $opacity, offsetX: $offsetX, offsetY: $offsetY, rotation: $rotation, borderRadius: $borderRadius, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$BannerImageConfigModelCopyWith<$Res> implements $BannerImageConfigModelCopyWith<$Res> {
  factory _$BannerImageConfigModelCopyWith(_BannerImageConfigModel value, $Res Function(_BannerImageConfigModel) _then) = __$BannerImageConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String imagePath,@JsonKey(unknownEnumValue: BannerImagePosition.right) BannerImagePosition position,@JsonKey(unknownEnumValue: BannerImageFit.cover) BannerImageFit fit, double widthPercent, double heightPercent, double opacity, double offsetX, double offsetY, double rotation, double borderRadius, bool visible
});




}
/// @nodoc
class __$BannerImageConfigModelCopyWithImpl<$Res>
    implements _$BannerImageConfigModelCopyWith<$Res> {
  __$BannerImageConfigModelCopyWithImpl(this._self, this._then);

  final _BannerImageConfigModel _self;
  final $Res Function(_BannerImageConfigModel) _then;

/// Create a copy of BannerImageConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? position = null,Object? fit = null,Object? widthPercent = null,Object? heightPercent = null,Object? opacity = null,Object? offsetX = null,Object? offsetY = null,Object? rotation = null,Object? borderRadius = null,Object? visible = null,}) {
  return _then(_BannerImageConfigModel(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as BannerImagePosition,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as BannerImageFit,widthPercent: null == widthPercent ? _self.widthPercent : widthPercent // ignore: cast_nullable_to_non_nullable
as double,heightPercent: null == heightPercent ? _self.heightPercent : heightPercent // ignore: cast_nullable_to_non_nullable
as double,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,offsetX: null == offsetX ? _self.offsetX : offsetX // ignore: cast_nullable_to_non_nullable
as double,offsetY: null == offsetY ? _self.offsetY : offsetY // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
