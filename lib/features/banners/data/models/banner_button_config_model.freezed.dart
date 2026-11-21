// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_button_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerButtonConfigModel {

 bool get enabled; String get text; String get textColor; String get backgroundColor; double get borderRadius; double get horizontalPadding; double get verticalPadding; String? get iconName;@JsonKey(unknownEnumValue: BannerActionType.none) BannerActionType get actionType; String? get actionValue;
/// Create a copy of BannerButtonConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerButtonConfigModelCopyWith<BannerButtonConfigModel> get copyWith => _$BannerButtonConfigModelCopyWithImpl<BannerButtonConfigModel>(this as BannerButtonConfigModel, _$identity);

  /// Serializes this BannerButtonConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerButtonConfigModel&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.text, text) || other.text == text)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.horizontalPadding, horizontalPadding) || other.horizontalPadding == horizontalPadding)&&(identical(other.verticalPadding, verticalPadding) || other.verticalPadding == verticalPadding)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionValue, actionValue) || other.actionValue == actionValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,text,textColor,backgroundColor,borderRadius,horizontalPadding,verticalPadding,iconName,actionType,actionValue);

@override
String toString() {
  return 'BannerButtonConfigModel(enabled: $enabled, text: $text, textColor: $textColor, backgroundColor: $backgroundColor, borderRadius: $borderRadius, horizontalPadding: $horizontalPadding, verticalPadding: $verticalPadding, iconName: $iconName, actionType: $actionType, actionValue: $actionValue)';
}


}

/// @nodoc
abstract mixin class $BannerButtonConfigModelCopyWith<$Res>  {
  factory $BannerButtonConfigModelCopyWith(BannerButtonConfigModel value, $Res Function(BannerButtonConfigModel) _then) = _$BannerButtonConfigModelCopyWithImpl;
@useResult
$Res call({
 bool enabled, String text, String textColor, String backgroundColor, double borderRadius, double horizontalPadding, double verticalPadding, String? iconName,@JsonKey(unknownEnumValue: BannerActionType.none) BannerActionType actionType, String? actionValue
});




}
/// @nodoc
class _$BannerButtonConfigModelCopyWithImpl<$Res>
    implements $BannerButtonConfigModelCopyWith<$Res> {
  _$BannerButtonConfigModelCopyWithImpl(this._self, this._then);

  final BannerButtonConfigModel _self;
  final $Res Function(BannerButtonConfigModel) _then;

/// Create a copy of BannerButtonConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? text = null,Object? textColor = null,Object? backgroundColor = null,Object? borderRadius = null,Object? horizontalPadding = null,Object? verticalPadding = null,Object? iconName = freezed,Object? actionType = null,Object? actionValue = freezed,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,horizontalPadding: null == horizontalPadding ? _self.horizontalPadding : horizontalPadding // ignore: cast_nullable_to_non_nullable
as double,verticalPadding: null == verticalPadding ? _self.verticalPadding : verticalPadding // ignore: cast_nullable_to_non_nullable
as double,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as BannerActionType,actionValue: freezed == actionValue ? _self.actionValue : actionValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerButtonConfigModel].
extension BannerButtonConfigModelPatterns on BannerButtonConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerButtonConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerButtonConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerButtonConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerButtonConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerButtonConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerButtonConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  String text,  String textColor,  String backgroundColor,  double borderRadius,  double horizontalPadding,  double verticalPadding,  String? iconName, @JsonKey(unknownEnumValue: BannerActionType.none)  BannerActionType actionType,  String? actionValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerButtonConfigModel() when $default != null:
return $default(_that.enabled,_that.text,_that.textColor,_that.backgroundColor,_that.borderRadius,_that.horizontalPadding,_that.verticalPadding,_that.iconName,_that.actionType,_that.actionValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  String text,  String textColor,  String backgroundColor,  double borderRadius,  double horizontalPadding,  double verticalPadding,  String? iconName, @JsonKey(unknownEnumValue: BannerActionType.none)  BannerActionType actionType,  String? actionValue)  $default,) {final _that = this;
switch (_that) {
case _BannerButtonConfigModel():
return $default(_that.enabled,_that.text,_that.textColor,_that.backgroundColor,_that.borderRadius,_that.horizontalPadding,_that.verticalPadding,_that.iconName,_that.actionType,_that.actionValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  String text,  String textColor,  String backgroundColor,  double borderRadius,  double horizontalPadding,  double verticalPadding,  String? iconName, @JsonKey(unknownEnumValue: BannerActionType.none)  BannerActionType actionType,  String? actionValue)?  $default,) {final _that = this;
switch (_that) {
case _BannerButtonConfigModel() when $default != null:
return $default(_that.enabled,_that.text,_that.textColor,_that.backgroundColor,_that.borderRadius,_that.horizontalPadding,_that.verticalPadding,_that.iconName,_that.actionType,_that.actionValue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerButtonConfigModel extends BannerButtonConfigModel {
  const _BannerButtonConfigModel({this.enabled = false, this.text = 'Ver más', this.textColor = '#FFFFFF', this.backgroundColor = '#0C700F', this.borderRadius = 8.0, this.horizontalPadding = 12.0, this.verticalPadding = 8.0, this.iconName, @JsonKey(unknownEnumValue: BannerActionType.none) this.actionType = BannerActionType.none, this.actionValue}): super._();
  factory _BannerButtonConfigModel.fromJson(Map<String, dynamic> json) => _$BannerButtonConfigModelFromJson(json);

@override@JsonKey() final  bool enabled;
@override@JsonKey() final  String text;
@override@JsonKey() final  String textColor;
@override@JsonKey() final  String backgroundColor;
@override@JsonKey() final  double borderRadius;
@override@JsonKey() final  double horizontalPadding;
@override@JsonKey() final  double verticalPadding;
@override final  String? iconName;
@override@JsonKey(unknownEnumValue: BannerActionType.none) final  BannerActionType actionType;
@override final  String? actionValue;

/// Create a copy of BannerButtonConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerButtonConfigModelCopyWith<_BannerButtonConfigModel> get copyWith => __$BannerButtonConfigModelCopyWithImpl<_BannerButtonConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerButtonConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerButtonConfigModel&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.text, text) || other.text == text)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.horizontalPadding, horizontalPadding) || other.horizontalPadding == horizontalPadding)&&(identical(other.verticalPadding, verticalPadding) || other.verticalPadding == verticalPadding)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.actionType, actionType) || other.actionType == actionType)&&(identical(other.actionValue, actionValue) || other.actionValue == actionValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,text,textColor,backgroundColor,borderRadius,horizontalPadding,verticalPadding,iconName,actionType,actionValue);

@override
String toString() {
  return 'BannerButtonConfigModel(enabled: $enabled, text: $text, textColor: $textColor, backgroundColor: $backgroundColor, borderRadius: $borderRadius, horizontalPadding: $horizontalPadding, verticalPadding: $verticalPadding, iconName: $iconName, actionType: $actionType, actionValue: $actionValue)';
}


}

/// @nodoc
abstract mixin class _$BannerButtonConfigModelCopyWith<$Res> implements $BannerButtonConfigModelCopyWith<$Res> {
  factory _$BannerButtonConfigModelCopyWith(_BannerButtonConfigModel value, $Res Function(_BannerButtonConfigModel) _then) = __$BannerButtonConfigModelCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, String text, String textColor, String backgroundColor, double borderRadius, double horizontalPadding, double verticalPadding, String? iconName,@JsonKey(unknownEnumValue: BannerActionType.none) BannerActionType actionType, String? actionValue
});




}
/// @nodoc
class __$BannerButtonConfigModelCopyWithImpl<$Res>
    implements _$BannerButtonConfigModelCopyWith<$Res> {
  __$BannerButtonConfigModelCopyWithImpl(this._self, this._then);

  final _BannerButtonConfigModel _self;
  final $Res Function(_BannerButtonConfigModel) _then;

/// Create a copy of BannerButtonConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? text = null,Object? textColor = null,Object? backgroundColor = null,Object? borderRadius = null,Object? horizontalPadding = null,Object? verticalPadding = null,Object? iconName = freezed,Object? actionType = null,Object? actionValue = freezed,}) {
  return _then(_BannerButtonConfigModel(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,horizontalPadding: null == horizontalPadding ? _self.horizontalPadding : horizontalPadding // ignore: cast_nullable_to_non_nullable
as double,verticalPadding: null == verticalPadding ? _self.verticalPadding : verticalPadding // ignore: cast_nullable_to_non_nullable
as double,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,actionType: null == actionType ? _self.actionType : actionType // ignore: cast_nullable_to_non_nullable
as BannerActionType,actionValue: freezed == actionValue ? _self.actionValue : actionValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
