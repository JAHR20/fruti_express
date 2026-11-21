// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_background_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerBackgroundConfigModel {

@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient) BannerBackgroundType get type; String get primaryColor; String get secondaryColor; String? get tertiaryColor; double get gradientAngle; String? get imagePath; String? get overlayColor; double get overlayOpacity;
/// Create a copy of BannerBackgroundConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerBackgroundConfigModelCopyWith<BannerBackgroundConfigModel> get copyWith => _$BannerBackgroundConfigModelCopyWithImpl<BannerBackgroundConfigModel>(this as BannerBackgroundConfigModel, _$identity);

  /// Serializes this BannerBackgroundConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerBackgroundConfigModel&&(identical(other.type, type) || other.type == type)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&(identical(other.gradientAngle, gradientAngle) || other.gradientAngle == gradientAngle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.overlayOpacity, overlayOpacity) || other.overlayOpacity == overlayOpacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,primaryColor,secondaryColor,tertiaryColor,gradientAngle,imagePath,overlayColor,overlayOpacity);

@override
String toString() {
  return 'BannerBackgroundConfigModel(type: $type, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, gradientAngle: $gradientAngle, imagePath: $imagePath, overlayColor: $overlayColor, overlayOpacity: $overlayOpacity)';
}


}

/// @nodoc
abstract mixin class $BannerBackgroundConfigModelCopyWith<$Res>  {
  factory $BannerBackgroundConfigModelCopyWith(BannerBackgroundConfigModel value, $Res Function(BannerBackgroundConfigModel) _then) = _$BannerBackgroundConfigModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient) BannerBackgroundType type, String primaryColor, String secondaryColor, String? tertiaryColor, double gradientAngle, String? imagePath, String? overlayColor, double overlayOpacity
});




}
/// @nodoc
class _$BannerBackgroundConfigModelCopyWithImpl<$Res>
    implements $BannerBackgroundConfigModelCopyWith<$Res> {
  _$BannerBackgroundConfigModelCopyWithImpl(this._self, this._then);

  final BannerBackgroundConfigModel _self;
  final $Res Function(BannerBackgroundConfigModel) _then;

/// Create a copy of BannerBackgroundConfigModel
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


/// Adds pattern-matching-related methods to [BannerBackgroundConfigModel].
extension BannerBackgroundConfigModelPatterns on BannerBackgroundConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerBackgroundConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerBackgroundConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerBackgroundConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient)  BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient)  BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)  $default,) {final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient)  BannerBackgroundType type,  String primaryColor,  String secondaryColor,  String? tertiaryColor,  double gradientAngle,  String? imagePath,  String? overlayColor,  double overlayOpacity)?  $default,) {final _that = this;
switch (_that) {
case _BannerBackgroundConfigModel() when $default != null:
return $default(_that.type,_that.primaryColor,_that.secondaryColor,_that.tertiaryColor,_that.gradientAngle,_that.imagePath,_that.overlayColor,_that.overlayOpacity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerBackgroundConfigModel extends BannerBackgroundConfigModel {
  const _BannerBackgroundConfigModel({@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient) this.type = BannerBackgroundType.linearGradient, this.primaryColor = '#0C700F', this.secondaryColor = '#F9A826', this.tertiaryColor, this.gradientAngle = 0.0, this.imagePath, this.overlayColor, this.overlayOpacity = 0.0}): super._();
  factory _BannerBackgroundConfigModel.fromJson(Map<String, dynamic> json) => _$BannerBackgroundConfigModelFromJson(json);

@override@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient) final  BannerBackgroundType type;
@override@JsonKey() final  String primaryColor;
@override@JsonKey() final  String secondaryColor;
@override final  String? tertiaryColor;
@override@JsonKey() final  double gradientAngle;
@override final  String? imagePath;
@override final  String? overlayColor;
@override@JsonKey() final  double overlayOpacity;

/// Create a copy of BannerBackgroundConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerBackgroundConfigModelCopyWith<_BannerBackgroundConfigModel> get copyWith => __$BannerBackgroundConfigModelCopyWithImpl<_BannerBackgroundConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerBackgroundConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerBackgroundConfigModel&&(identical(other.type, type) || other.type == type)&&(identical(other.primaryColor, primaryColor) || other.primaryColor == primaryColor)&&(identical(other.secondaryColor, secondaryColor) || other.secondaryColor == secondaryColor)&&(identical(other.tertiaryColor, tertiaryColor) || other.tertiaryColor == tertiaryColor)&&(identical(other.gradientAngle, gradientAngle) || other.gradientAngle == gradientAngle)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.overlayColor, overlayColor) || other.overlayColor == overlayColor)&&(identical(other.overlayOpacity, overlayOpacity) || other.overlayOpacity == overlayOpacity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,primaryColor,secondaryColor,tertiaryColor,gradientAngle,imagePath,overlayColor,overlayOpacity);

@override
String toString() {
  return 'BannerBackgroundConfigModel(type: $type, primaryColor: $primaryColor, secondaryColor: $secondaryColor, tertiaryColor: $tertiaryColor, gradientAngle: $gradientAngle, imagePath: $imagePath, overlayColor: $overlayColor, overlayOpacity: $overlayOpacity)';
}


}

/// @nodoc
abstract mixin class _$BannerBackgroundConfigModelCopyWith<$Res> implements $BannerBackgroundConfigModelCopyWith<$Res> {
  factory _$BannerBackgroundConfigModelCopyWith(_BannerBackgroundConfigModel value, $Res Function(_BannerBackgroundConfigModel) _then) = __$BannerBackgroundConfigModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient) BannerBackgroundType type, String primaryColor, String secondaryColor, String? tertiaryColor, double gradientAngle, String? imagePath, String? overlayColor, double overlayOpacity
});




}
/// @nodoc
class __$BannerBackgroundConfigModelCopyWithImpl<$Res>
    implements _$BannerBackgroundConfigModelCopyWith<$Res> {
  __$BannerBackgroundConfigModelCopyWithImpl(this._self, this._then);

  final _BannerBackgroundConfigModel _self;
  final $Res Function(_BannerBackgroundConfigModel) _then;

/// Create a copy of BannerBackgroundConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? primaryColor = null,Object? secondaryColor = null,Object? tertiaryColor = freezed,Object? gradientAngle = null,Object? imagePath = freezed,Object? overlayColor = freezed,Object? overlayOpacity = null,}) {
  return _then(_BannerBackgroundConfigModel(
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
