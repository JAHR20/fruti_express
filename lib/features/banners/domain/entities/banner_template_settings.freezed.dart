// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_template_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerTemplateSettings {

 BannerTemplate get template; String get textColor; double get imageWidthPercent; bool get buttonEnabled; String get buttonText; BannerActionType get buttonAction;
/// Create a copy of BannerTemplateSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerTemplateSettingsCopyWith<BannerTemplateSettings> get copyWith => _$BannerTemplateSettingsCopyWithImpl<BannerTemplateSettings>(this as BannerTemplateSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerTemplateSettings&&(identical(other.template, template) || other.template == template)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.imageWidthPercent, imageWidthPercent) || other.imageWidthPercent == imageWidthPercent)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText)&&(identical(other.buttonAction, buttonAction) || other.buttonAction == buttonAction));
}


@override
int get hashCode => Object.hash(runtimeType,template,textColor,imageWidthPercent,buttonEnabled,buttonText,buttonAction);

@override
String toString() {
  return 'BannerTemplateSettings(template: $template, textColor: $textColor, imageWidthPercent: $imageWidthPercent, buttonEnabled: $buttonEnabled, buttonText: $buttonText, buttonAction: $buttonAction)';
}


}

/// @nodoc
abstract mixin class $BannerTemplateSettingsCopyWith<$Res>  {
  factory $BannerTemplateSettingsCopyWith(BannerTemplateSettings value, $Res Function(BannerTemplateSettings) _then) = _$BannerTemplateSettingsCopyWithImpl;
@useResult
$Res call({
 BannerTemplate template, String textColor, double imageWidthPercent, bool buttonEnabled, String buttonText, BannerActionType buttonAction
});




}
/// @nodoc
class _$BannerTemplateSettingsCopyWithImpl<$Res>
    implements $BannerTemplateSettingsCopyWith<$Res> {
  _$BannerTemplateSettingsCopyWithImpl(this._self, this._then);

  final BannerTemplateSettings _self;
  final $Res Function(BannerTemplateSettings) _then;

/// Create a copy of BannerTemplateSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? template = null,Object? textColor = null,Object? imageWidthPercent = null,Object? buttonEnabled = null,Object? buttonText = null,Object? buttonAction = null,}) {
  return _then(_self.copyWith(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,imageWidthPercent: null == imageWidthPercent ? _self.imageWidthPercent : imageWidthPercent // ignore: cast_nullable_to_non_nullable
as double,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,buttonAction: null == buttonAction ? _self.buttonAction : buttonAction // ignore: cast_nullable_to_non_nullable
as BannerActionType,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerTemplateSettings].
extension BannerTemplateSettingsPatterns on BannerTemplateSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerTemplateSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerTemplateSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerTemplateSettings value)  $default,){
final _that = this;
switch (_that) {
case _BannerTemplateSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerTemplateSettings value)?  $default,){
final _that = this;
switch (_that) {
case _BannerTemplateSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerTemplate template,  String textColor,  double imageWidthPercent,  bool buttonEnabled,  String buttonText,  BannerActionType buttonAction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerTemplateSettings() when $default != null:
return $default(_that.template,_that.textColor,_that.imageWidthPercent,_that.buttonEnabled,_that.buttonText,_that.buttonAction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerTemplate template,  String textColor,  double imageWidthPercent,  bool buttonEnabled,  String buttonText,  BannerActionType buttonAction)  $default,) {final _that = this;
switch (_that) {
case _BannerTemplateSettings():
return $default(_that.template,_that.textColor,_that.imageWidthPercent,_that.buttonEnabled,_that.buttonText,_that.buttonAction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerTemplate template,  String textColor,  double imageWidthPercent,  bool buttonEnabled,  String buttonText,  BannerActionType buttonAction)?  $default,) {final _that = this;
switch (_that) {
case _BannerTemplateSettings() when $default != null:
return $default(_that.template,_that.textColor,_that.imageWidthPercent,_that.buttonEnabled,_that.buttonText,_that.buttonAction);case _:
  return null;

}
}

}

/// @nodoc


class _BannerTemplateSettings extends BannerTemplateSettings {
  const _BannerTemplateSettings({this.template = BannerTemplate.imageRight, this.textColor = '#FFFFFF', this.imageWidthPercent = 40.0, this.buttonEnabled = false, this.buttonText = 'Ver ofertas', this.buttonAction = BannerActionType.promotions}): super._();
  

@override@JsonKey() final  BannerTemplate template;
@override@JsonKey() final  String textColor;
@override@JsonKey() final  double imageWidthPercent;
@override@JsonKey() final  bool buttonEnabled;
@override@JsonKey() final  String buttonText;
@override@JsonKey() final  BannerActionType buttonAction;

/// Create a copy of BannerTemplateSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerTemplateSettingsCopyWith<_BannerTemplateSettings> get copyWith => __$BannerTemplateSettingsCopyWithImpl<_BannerTemplateSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerTemplateSettings&&(identical(other.template, template) || other.template == template)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.imageWidthPercent, imageWidthPercent) || other.imageWidthPercent == imageWidthPercent)&&(identical(other.buttonEnabled, buttonEnabled) || other.buttonEnabled == buttonEnabled)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText)&&(identical(other.buttonAction, buttonAction) || other.buttonAction == buttonAction));
}


@override
int get hashCode => Object.hash(runtimeType,template,textColor,imageWidthPercent,buttonEnabled,buttonText,buttonAction);

@override
String toString() {
  return 'BannerTemplateSettings(template: $template, textColor: $textColor, imageWidthPercent: $imageWidthPercent, buttonEnabled: $buttonEnabled, buttonText: $buttonText, buttonAction: $buttonAction)';
}


}

/// @nodoc
abstract mixin class _$BannerTemplateSettingsCopyWith<$Res> implements $BannerTemplateSettingsCopyWith<$Res> {
  factory _$BannerTemplateSettingsCopyWith(_BannerTemplateSettings value, $Res Function(_BannerTemplateSettings) _then) = __$BannerTemplateSettingsCopyWithImpl;
@override @useResult
$Res call({
 BannerTemplate template, String textColor, double imageWidthPercent, bool buttonEnabled, String buttonText, BannerActionType buttonAction
});




}
/// @nodoc
class __$BannerTemplateSettingsCopyWithImpl<$Res>
    implements _$BannerTemplateSettingsCopyWith<$Res> {
  __$BannerTemplateSettingsCopyWithImpl(this._self, this._then);

  final _BannerTemplateSettings _self;
  final $Res Function(_BannerTemplateSettings) _then;

/// Create a copy of BannerTemplateSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? template = null,Object? textColor = null,Object? imageWidthPercent = null,Object? buttonEnabled = null,Object? buttonText = null,Object? buttonAction = null,}) {
  return _then(_BannerTemplateSettings(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,imageWidthPercent: null == imageWidthPercent ? _self.imageWidthPercent : imageWidthPercent // ignore: cast_nullable_to_non_nullable
as double,buttonEnabled: null == buttonEnabled ? _self.buttonEnabled : buttonEnabled // ignore: cast_nullable_to_non_nullable
as bool,buttonText: null == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String,buttonAction: null == buttonAction ? _self.buttonAction : buttonAction // ignore: cast_nullable_to_non_nullable
as BannerActionType,
  ));
}


}

// dart format on
