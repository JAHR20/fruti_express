// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_text_style_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerTextStyleConfigModel {

 String get color; double get fontSize;@JsonKey(unknownEnumValue: BannerFontWeight.w400) BannerFontWeight get fontWeight; String? get fontFamily;// null = hereda la alineación del layout.
@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) BannerTextAlignment? get alignment; double get lineHeight; double get letterSpacing; int get maxLines; bool get uppercase; bool get underline; double get rotation;
/// Create a copy of BannerTextStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<BannerTextStyleConfigModel> get copyWith => _$BannerTextStyleConfigModelCopyWithImpl<BannerTextStyleConfigModel>(this as BannerTextStyleConfigModel, _$identity);

  /// Serializes this BannerTextStyleConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerTextStyleConfigModel&&(identical(other.color, color) || other.color == color)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.uppercase, uppercase) || other.uppercase == uppercase)&&(identical(other.underline, underline) || other.underline == underline)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,fontSize,fontWeight,fontFamily,alignment,lineHeight,letterSpacing,maxLines,uppercase,underline,rotation);

@override
String toString() {
  return 'BannerTextStyleConfigModel(color: $color, fontSize: $fontSize, fontWeight: $fontWeight, fontFamily: $fontFamily, alignment: $alignment, lineHeight: $lineHeight, letterSpacing: $letterSpacing, maxLines: $maxLines, uppercase: $uppercase, underline: $underline, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class $BannerTextStyleConfigModelCopyWith<$Res>  {
  factory $BannerTextStyleConfigModelCopyWith(BannerTextStyleConfigModel value, $Res Function(BannerTextStyleConfigModel) _then) = _$BannerTextStyleConfigModelCopyWithImpl;
@useResult
$Res call({
 String color, double fontSize,@JsonKey(unknownEnumValue: BannerFontWeight.w400) BannerFontWeight fontWeight, String? fontFamily,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) BannerTextAlignment? alignment, double lineHeight, double letterSpacing, int maxLines, bool uppercase, bool underline, double rotation
});




}
/// @nodoc
class _$BannerTextStyleConfigModelCopyWithImpl<$Res>
    implements $BannerTextStyleConfigModelCopyWith<$Res> {
  _$BannerTextStyleConfigModelCopyWithImpl(this._self, this._then);

  final BannerTextStyleConfigModel _self;
  final $Res Function(BannerTextStyleConfigModel) _then;

/// Create a copy of BannerTextStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? fontSize = null,Object? fontWeight = null,Object? fontFamily = freezed,Object? alignment = freezed,Object? lineHeight = null,Object? letterSpacing = null,Object? maxLines = null,Object? uppercase = null,Object? underline = null,Object? rotation = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,fontWeight: null == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as BannerFontWeight,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as BannerTextAlignment?,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,letterSpacing: null == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double,maxLines: null == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int,uppercase: null == uppercase ? _self.uppercase : uppercase // ignore: cast_nullable_to_non_nullable
as bool,underline: null == underline ? _self.underline : underline // ignore: cast_nullable_to_non_nullable
as bool,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerTextStyleConfigModel].
extension BannerTextStyleConfigModelPatterns on BannerTextStyleConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerTextStyleConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerTextStyleConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerTextStyleConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String color,  double fontSize, @JsonKey(unknownEnumValue: BannerFontWeight.w400)  BannerFontWeight fontWeight,  String? fontFamily, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  BannerTextAlignment? alignment,  double lineHeight,  double letterSpacing,  int maxLines,  bool uppercase,  bool underline,  double rotation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel() when $default != null:
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontFamily,_that.alignment,_that.lineHeight,_that.letterSpacing,_that.maxLines,_that.uppercase,_that.underline,_that.rotation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String color,  double fontSize, @JsonKey(unknownEnumValue: BannerFontWeight.w400)  BannerFontWeight fontWeight,  String? fontFamily, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  BannerTextAlignment? alignment,  double lineHeight,  double letterSpacing,  int maxLines,  bool uppercase,  bool underline,  double rotation)  $default,) {final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel():
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontFamily,_that.alignment,_that.lineHeight,_that.letterSpacing,_that.maxLines,_that.uppercase,_that.underline,_that.rotation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String color,  double fontSize, @JsonKey(unknownEnumValue: BannerFontWeight.w400)  BannerFontWeight fontWeight,  String? fontFamily, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  BannerTextAlignment? alignment,  double lineHeight,  double letterSpacing,  int maxLines,  bool uppercase,  bool underline,  double rotation)?  $default,) {final _that = this;
switch (_that) {
case _BannerTextStyleConfigModel() when $default != null:
return $default(_that.color,_that.fontSize,_that.fontWeight,_that.fontFamily,_that.alignment,_that.lineHeight,_that.letterSpacing,_that.maxLines,_that.uppercase,_that.underline,_that.rotation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerTextStyleConfigModel extends BannerTextStyleConfigModel {
  const _BannerTextStyleConfigModel({this.color = '#FFFFFF', this.fontSize = 16.0, @JsonKey(unknownEnumValue: BannerFontWeight.w400) this.fontWeight = BannerFontWeight.w400, this.fontFamily, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.alignment, this.lineHeight = 1.2, this.letterSpacing = 0.0, this.maxLines = 2, this.uppercase = false, this.underline = false, this.rotation = 0.0}): super._();
  factory _BannerTextStyleConfigModel.fromJson(Map<String, dynamic> json) => _$BannerTextStyleConfigModelFromJson(json);

@override@JsonKey() final  String color;
@override@JsonKey() final  double fontSize;
@override@JsonKey(unknownEnumValue: BannerFontWeight.w400) final  BannerFontWeight fontWeight;
@override final  String? fontFamily;
// null = hereda la alineación del layout.
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  BannerTextAlignment? alignment;
@override@JsonKey() final  double lineHeight;
@override@JsonKey() final  double letterSpacing;
@override@JsonKey() final  int maxLines;
@override@JsonKey() final  bool uppercase;
@override@JsonKey() final  bool underline;
@override@JsonKey() final  double rotation;

/// Create a copy of BannerTextStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerTextStyleConfigModelCopyWith<_BannerTextStyleConfigModel> get copyWith => __$BannerTextStyleConfigModelCopyWithImpl<_BannerTextStyleConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerTextStyleConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerTextStyleConfigModel&&(identical(other.color, color) || other.color == color)&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.fontWeight, fontWeight) || other.fontWeight == fontWeight)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.lineHeight, lineHeight) || other.lineHeight == lineHeight)&&(identical(other.letterSpacing, letterSpacing) || other.letterSpacing == letterSpacing)&&(identical(other.maxLines, maxLines) || other.maxLines == maxLines)&&(identical(other.uppercase, uppercase) || other.uppercase == uppercase)&&(identical(other.underline, underline) || other.underline == underline)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,fontSize,fontWeight,fontFamily,alignment,lineHeight,letterSpacing,maxLines,uppercase,underline,rotation);

@override
String toString() {
  return 'BannerTextStyleConfigModel(color: $color, fontSize: $fontSize, fontWeight: $fontWeight, fontFamily: $fontFamily, alignment: $alignment, lineHeight: $lineHeight, letterSpacing: $letterSpacing, maxLines: $maxLines, uppercase: $uppercase, underline: $underline, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class _$BannerTextStyleConfigModelCopyWith<$Res> implements $BannerTextStyleConfigModelCopyWith<$Res> {
  factory _$BannerTextStyleConfigModelCopyWith(_BannerTextStyleConfigModel value, $Res Function(_BannerTextStyleConfigModel) _then) = __$BannerTextStyleConfigModelCopyWithImpl;
@override @useResult
$Res call({
 String color, double fontSize,@JsonKey(unknownEnumValue: BannerFontWeight.w400) BannerFontWeight fontWeight, String? fontFamily,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) BannerTextAlignment? alignment, double lineHeight, double letterSpacing, int maxLines, bool uppercase, bool underline, double rotation
});




}
/// @nodoc
class __$BannerTextStyleConfigModelCopyWithImpl<$Res>
    implements _$BannerTextStyleConfigModelCopyWith<$Res> {
  __$BannerTextStyleConfigModelCopyWithImpl(this._self, this._then);

  final _BannerTextStyleConfigModel _self;
  final $Res Function(_BannerTextStyleConfigModel) _then;

/// Create a copy of BannerTextStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? fontSize = null,Object? fontWeight = null,Object? fontFamily = freezed,Object? alignment = freezed,Object? lineHeight = null,Object? letterSpacing = null,Object? maxLines = null,Object? uppercase = null,Object? underline = null,Object? rotation = null,}) {
  return _then(_BannerTextStyleConfigModel(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as double,fontWeight: null == fontWeight ? _self.fontWeight : fontWeight // ignore: cast_nullable_to_non_nullable
as BannerFontWeight,fontFamily: freezed == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String?,alignment: freezed == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as BannerTextAlignment?,lineHeight: null == lineHeight ? _self.lineHeight : lineHeight // ignore: cast_nullable_to_non_nullable
as double,letterSpacing: null == letterSpacing ? _self.letterSpacing : letterSpacing // ignore: cast_nullable_to_non_nullable
as double,maxLines: null == maxLines ? _self.maxLines : maxLines // ignore: cast_nullable_to_non_nullable
as int,uppercase: null == uppercase ? _self.uppercase : uppercase // ignore: cast_nullable_to_non_nullable
as bool,underline: null == underline ? _self.underline : underline // ignore: cast_nullable_to_non_nullable
as bool,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
