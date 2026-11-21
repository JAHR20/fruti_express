// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_format_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerFormatConfigModel {

@JsonKey(unknownEnumValue: BannerTemplate.centered) BannerTemplate get template; BannerBackgroundConfigModel get background; BannerLayoutConfigModel get layout; BannerTypographyConfigModel get typography; BannerImageConfigModel? get image; BannerButtonConfigModel? get button;
/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerFormatConfigModelCopyWith<BannerFormatConfigModel> get copyWith => _$BannerFormatConfigModelCopyWithImpl<BannerFormatConfigModel>(this as BannerFormatConfigModel, _$identity);

  /// Serializes this BannerFormatConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerFormatConfigModel&&(identical(other.template, template) || other.template == template)&&(identical(other.background, background) || other.background == background)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.typography, typography) || other.typography == typography)&&(identical(other.image, image) || other.image == image)&&(identical(other.button, button) || other.button == button));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,template,background,layout,typography,image,button);

@override
String toString() {
  return 'BannerFormatConfigModel(template: $template, background: $background, layout: $layout, typography: $typography, image: $image, button: $button)';
}


}

/// @nodoc
abstract mixin class $BannerFormatConfigModelCopyWith<$Res>  {
  factory $BannerFormatConfigModelCopyWith(BannerFormatConfigModel value, $Res Function(BannerFormatConfigModel) _then) = _$BannerFormatConfigModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: BannerTemplate.centered) BannerTemplate template, BannerBackgroundConfigModel background, BannerLayoutConfigModel layout, BannerTypographyConfigModel typography, BannerImageConfigModel? image, BannerButtonConfigModel? button
});


$BannerBackgroundConfigModelCopyWith<$Res> get background;$BannerLayoutConfigModelCopyWith<$Res> get layout;$BannerTypographyConfigModelCopyWith<$Res> get typography;$BannerImageConfigModelCopyWith<$Res>? get image;$BannerButtonConfigModelCopyWith<$Res>? get button;

}
/// @nodoc
class _$BannerFormatConfigModelCopyWithImpl<$Res>
    implements $BannerFormatConfigModelCopyWith<$Res> {
  _$BannerFormatConfigModelCopyWithImpl(this._self, this._then);

  final BannerFormatConfigModel _self;
  final $Res Function(BannerFormatConfigModel) _then;

/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? template = null,Object? background = null,Object? layout = null,Object? typography = null,Object? image = freezed,Object? button = freezed,}) {
  return _then(_self.copyWith(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BannerBackgroundConfigModel,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BannerLayoutConfigModel,typography: null == typography ? _self.typography : typography // ignore: cast_nullable_to_non_nullable
as BannerTypographyConfigModel,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BannerImageConfigModel?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as BannerButtonConfigModel?,
  ));
}
/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundConfigModelCopyWith<$Res> get background {
  
  return $BannerBackgroundConfigModelCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerLayoutConfigModelCopyWith<$Res> get layout {
  
  return $BannerLayoutConfigModelCopyWith<$Res>(_self.layout, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTypographyConfigModelCopyWith<$Res> get typography {
  
  return $BannerTypographyConfigModelCopyWith<$Res>(_self.typography, (value) {
    return _then(_self.copyWith(typography: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerImageConfigModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BannerImageConfigModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerButtonConfigModelCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $BannerButtonConfigModelCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerFormatConfigModel].
extension BannerFormatConfigModelPatterns on BannerFormatConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerFormatConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerFormatConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerFormatConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerFormatConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerFormatConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerFormatConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: BannerTemplate.centered)  BannerTemplate template,  BannerBackgroundConfigModel background,  BannerLayoutConfigModel layout,  BannerTypographyConfigModel typography,  BannerImageConfigModel? image,  BannerButtonConfigModel? button)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerFormatConfigModel() when $default != null:
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: BannerTemplate.centered)  BannerTemplate template,  BannerBackgroundConfigModel background,  BannerLayoutConfigModel layout,  BannerTypographyConfigModel typography,  BannerImageConfigModel? image,  BannerButtonConfigModel? button)  $default,) {final _that = this;
switch (_that) {
case _BannerFormatConfigModel():
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: BannerTemplate.centered)  BannerTemplate template,  BannerBackgroundConfigModel background,  BannerLayoutConfigModel layout,  BannerTypographyConfigModel typography,  BannerImageConfigModel? image,  BannerButtonConfigModel? button)?  $default,) {final _that = this;
switch (_that) {
case _BannerFormatConfigModel() when $default != null:
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerFormatConfigModel extends BannerFormatConfigModel {
  const _BannerFormatConfigModel({@JsonKey(unknownEnumValue: BannerTemplate.centered) this.template = BannerTemplate.centered, this.background = const BannerBackgroundConfigModel(), this.layout = const BannerLayoutConfigModel(), this.typography = const BannerTypographyConfigModel(), this.image, this.button}): super._();
  factory _BannerFormatConfigModel.fromJson(Map<String, dynamic> json) => _$BannerFormatConfigModelFromJson(json);

@override@JsonKey(unknownEnumValue: BannerTemplate.centered) final  BannerTemplate template;
@override@JsonKey() final  BannerBackgroundConfigModel background;
@override@JsonKey() final  BannerLayoutConfigModel layout;
@override@JsonKey() final  BannerTypographyConfigModel typography;
@override final  BannerImageConfigModel? image;
@override final  BannerButtonConfigModel? button;

/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerFormatConfigModelCopyWith<_BannerFormatConfigModel> get copyWith => __$BannerFormatConfigModelCopyWithImpl<_BannerFormatConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerFormatConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerFormatConfigModel&&(identical(other.template, template) || other.template == template)&&(identical(other.background, background) || other.background == background)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.typography, typography) || other.typography == typography)&&(identical(other.image, image) || other.image == image)&&(identical(other.button, button) || other.button == button));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,template,background,layout,typography,image,button);

@override
String toString() {
  return 'BannerFormatConfigModel(template: $template, background: $background, layout: $layout, typography: $typography, image: $image, button: $button)';
}


}

/// @nodoc
abstract mixin class _$BannerFormatConfigModelCopyWith<$Res> implements $BannerFormatConfigModelCopyWith<$Res> {
  factory _$BannerFormatConfigModelCopyWith(_BannerFormatConfigModel value, $Res Function(_BannerFormatConfigModel) _then) = __$BannerFormatConfigModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: BannerTemplate.centered) BannerTemplate template, BannerBackgroundConfigModel background, BannerLayoutConfigModel layout, BannerTypographyConfigModel typography, BannerImageConfigModel? image, BannerButtonConfigModel? button
});


@override $BannerBackgroundConfigModelCopyWith<$Res> get background;@override $BannerLayoutConfigModelCopyWith<$Res> get layout;@override $BannerTypographyConfigModelCopyWith<$Res> get typography;@override $BannerImageConfigModelCopyWith<$Res>? get image;@override $BannerButtonConfigModelCopyWith<$Res>? get button;

}
/// @nodoc
class __$BannerFormatConfigModelCopyWithImpl<$Res>
    implements _$BannerFormatConfigModelCopyWith<$Res> {
  __$BannerFormatConfigModelCopyWithImpl(this._self, this._then);

  final _BannerFormatConfigModel _self;
  final $Res Function(_BannerFormatConfigModel) _then;

/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? template = null,Object? background = null,Object? layout = null,Object? typography = null,Object? image = freezed,Object? button = freezed,}) {
  return _then(_BannerFormatConfigModel(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BannerBackgroundConfigModel,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BannerLayoutConfigModel,typography: null == typography ? _self.typography : typography // ignore: cast_nullable_to_non_nullable
as BannerTypographyConfigModel,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BannerImageConfigModel?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as BannerButtonConfigModel?,
  ));
}

/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundConfigModelCopyWith<$Res> get background {
  
  return $BannerBackgroundConfigModelCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerLayoutConfigModelCopyWith<$Res> get layout {
  
  return $BannerLayoutConfigModelCopyWith<$Res>(_self.layout, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTypographyConfigModelCopyWith<$Res> get typography {
  
  return $BannerTypographyConfigModelCopyWith<$Res>(_self.typography, (value) {
    return _then(_self.copyWith(typography: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerImageConfigModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BannerImageConfigModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BannerFormatConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerButtonConfigModelCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $BannerButtonConfigModelCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}
}

// dart format on
