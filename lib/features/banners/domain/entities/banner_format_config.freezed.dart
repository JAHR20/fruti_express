// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_format_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerFormatConfig {

 BannerTemplate get template; BannerBackgroundConfig get background; BannerLayoutConfig get layout; BannerTypographyConfig get typography; BannerImageConfig? get image; BannerButtonConfig? get button; List<BannerDecorationConfig> get decorations; BannerBorderConfig? get border; BannerShadowConfig? get shadow;
/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerFormatConfigCopyWith<BannerFormatConfig> get copyWith => _$BannerFormatConfigCopyWithImpl<BannerFormatConfig>(this as BannerFormatConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerFormatConfig&&(identical(other.template, template) || other.template == template)&&(identical(other.background, background) || other.background == background)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.typography, typography) || other.typography == typography)&&(identical(other.image, image) || other.image == image)&&(identical(other.button, button) || other.button == button)&&const DeepCollectionEquality().equals(other.decorations, decorations)&&(identical(other.border, border) || other.border == border)&&(identical(other.shadow, shadow) || other.shadow == shadow));
}


@override
int get hashCode => Object.hash(runtimeType,template,background,layout,typography,image,button,const DeepCollectionEquality().hash(decorations),border,shadow);

@override
String toString() {
  return 'BannerFormatConfig(template: $template, background: $background, layout: $layout, typography: $typography, image: $image, button: $button, decorations: $decorations, border: $border, shadow: $shadow)';
}


}

/// @nodoc
abstract mixin class $BannerFormatConfigCopyWith<$Res>  {
  factory $BannerFormatConfigCopyWith(BannerFormatConfig value, $Res Function(BannerFormatConfig) _then) = _$BannerFormatConfigCopyWithImpl;
@useResult
$Res call({
 BannerTemplate template, BannerBackgroundConfig background, BannerLayoutConfig layout, BannerTypographyConfig typography, BannerImageConfig? image, BannerButtonConfig? button, List<BannerDecorationConfig> decorations, BannerBorderConfig? border, BannerShadowConfig? shadow
});


$BannerBackgroundConfigCopyWith<$Res> get background;$BannerLayoutConfigCopyWith<$Res> get layout;$BannerTypographyConfigCopyWith<$Res> get typography;$BannerImageConfigCopyWith<$Res>? get image;$BannerButtonConfigCopyWith<$Res>? get button;$BannerBorderConfigCopyWith<$Res>? get border;$BannerShadowConfigCopyWith<$Res>? get shadow;

}
/// @nodoc
class _$BannerFormatConfigCopyWithImpl<$Res>
    implements $BannerFormatConfigCopyWith<$Res> {
  _$BannerFormatConfigCopyWithImpl(this._self, this._then);

  final BannerFormatConfig _self;
  final $Res Function(BannerFormatConfig) _then;

/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? template = null,Object? background = null,Object? layout = null,Object? typography = null,Object? image = freezed,Object? button = freezed,Object? decorations = null,Object? border = freezed,Object? shadow = freezed,}) {
  return _then(_self.copyWith(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BannerBackgroundConfig,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BannerLayoutConfig,typography: null == typography ? _self.typography : typography // ignore: cast_nullable_to_non_nullable
as BannerTypographyConfig,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BannerImageConfig?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as BannerButtonConfig?,decorations: null == decorations ? _self.decorations : decorations // ignore: cast_nullable_to_non_nullable
as List<BannerDecorationConfig>,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as BannerBorderConfig?,shadow: freezed == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as BannerShadowConfig?,
  ));
}
/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundConfigCopyWith<$Res> get background {
  
  return $BannerBackgroundConfigCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerLayoutConfigCopyWith<$Res> get layout {
  
  return $BannerLayoutConfigCopyWith<$Res>(_self.layout, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTypographyConfigCopyWith<$Res> get typography {
  
  return $BannerTypographyConfigCopyWith<$Res>(_self.typography, (value) {
    return _then(_self.copyWith(typography: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerImageConfigCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BannerImageConfigCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerButtonConfigCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $BannerButtonConfigCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBorderConfigCopyWith<$Res>? get border {
    if (_self.border == null) {
    return null;
  }

  return $BannerBorderConfigCopyWith<$Res>(_self.border!, (value) {
    return _then(_self.copyWith(border: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerShadowConfigCopyWith<$Res>? get shadow {
    if (_self.shadow == null) {
    return null;
  }

  return $BannerShadowConfigCopyWith<$Res>(_self.shadow!, (value) {
    return _then(_self.copyWith(shadow: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerFormatConfig].
extension BannerFormatConfigPatterns on BannerFormatConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerFormatConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerFormatConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerFormatConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerFormatConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerFormatConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerFormatConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerTemplate template,  BannerBackgroundConfig background,  BannerLayoutConfig layout,  BannerTypographyConfig typography,  BannerImageConfig? image,  BannerButtonConfig? button,  List<BannerDecorationConfig> decorations,  BannerBorderConfig? border,  BannerShadowConfig? shadow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerFormatConfig() when $default != null:
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button,_that.decorations,_that.border,_that.shadow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerTemplate template,  BannerBackgroundConfig background,  BannerLayoutConfig layout,  BannerTypographyConfig typography,  BannerImageConfig? image,  BannerButtonConfig? button,  List<BannerDecorationConfig> decorations,  BannerBorderConfig? border,  BannerShadowConfig? shadow)  $default,) {final _that = this;
switch (_that) {
case _BannerFormatConfig():
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button,_that.decorations,_that.border,_that.shadow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerTemplate template,  BannerBackgroundConfig background,  BannerLayoutConfig layout,  BannerTypographyConfig typography,  BannerImageConfig? image,  BannerButtonConfig? button,  List<BannerDecorationConfig> decorations,  BannerBorderConfig? border,  BannerShadowConfig? shadow)?  $default,) {final _that = this;
switch (_that) {
case _BannerFormatConfig() when $default != null:
return $default(_that.template,_that.background,_that.layout,_that.typography,_that.image,_that.button,_that.decorations,_that.border,_that.shadow);case _:
  return null;

}
}

}

/// @nodoc


class _BannerFormatConfig implements BannerFormatConfig {
  const _BannerFormatConfig({required this.template, required this.background, required this.layout, required this.typography, this.image, this.button, final  List<BannerDecorationConfig> decorations = const [], this.border, this.shadow}): _decorations = decorations;
  

@override final  BannerTemplate template;
@override final  BannerBackgroundConfig background;
@override final  BannerLayoutConfig layout;
@override final  BannerTypographyConfig typography;
@override final  BannerImageConfig? image;
@override final  BannerButtonConfig? button;
 final  List<BannerDecorationConfig> _decorations;
@override@JsonKey() List<BannerDecorationConfig> get decorations {
  if (_decorations is EqualUnmodifiableListView) return _decorations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_decorations);
}

@override final  BannerBorderConfig? border;
@override final  BannerShadowConfig? shadow;

/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerFormatConfigCopyWith<_BannerFormatConfig> get copyWith => __$BannerFormatConfigCopyWithImpl<_BannerFormatConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerFormatConfig&&(identical(other.template, template) || other.template == template)&&(identical(other.background, background) || other.background == background)&&(identical(other.layout, layout) || other.layout == layout)&&(identical(other.typography, typography) || other.typography == typography)&&(identical(other.image, image) || other.image == image)&&(identical(other.button, button) || other.button == button)&&const DeepCollectionEquality().equals(other._decorations, _decorations)&&(identical(other.border, border) || other.border == border)&&(identical(other.shadow, shadow) || other.shadow == shadow));
}


@override
int get hashCode => Object.hash(runtimeType,template,background,layout,typography,image,button,const DeepCollectionEquality().hash(_decorations),border,shadow);

@override
String toString() {
  return 'BannerFormatConfig(template: $template, background: $background, layout: $layout, typography: $typography, image: $image, button: $button, decorations: $decorations, border: $border, shadow: $shadow)';
}


}

/// @nodoc
abstract mixin class _$BannerFormatConfigCopyWith<$Res> implements $BannerFormatConfigCopyWith<$Res> {
  factory _$BannerFormatConfigCopyWith(_BannerFormatConfig value, $Res Function(_BannerFormatConfig) _then) = __$BannerFormatConfigCopyWithImpl;
@override @useResult
$Res call({
 BannerTemplate template, BannerBackgroundConfig background, BannerLayoutConfig layout, BannerTypographyConfig typography, BannerImageConfig? image, BannerButtonConfig? button, List<BannerDecorationConfig> decorations, BannerBorderConfig? border, BannerShadowConfig? shadow
});


@override $BannerBackgroundConfigCopyWith<$Res> get background;@override $BannerLayoutConfigCopyWith<$Res> get layout;@override $BannerTypographyConfigCopyWith<$Res> get typography;@override $BannerImageConfigCopyWith<$Res>? get image;@override $BannerButtonConfigCopyWith<$Res>? get button;@override $BannerBorderConfigCopyWith<$Res>? get border;@override $BannerShadowConfigCopyWith<$Res>? get shadow;

}
/// @nodoc
class __$BannerFormatConfigCopyWithImpl<$Res>
    implements _$BannerFormatConfigCopyWith<$Res> {
  __$BannerFormatConfigCopyWithImpl(this._self, this._then);

  final _BannerFormatConfig _self;
  final $Res Function(_BannerFormatConfig) _then;

/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? template = null,Object? background = null,Object? layout = null,Object? typography = null,Object? image = freezed,Object? button = freezed,Object? decorations = null,Object? border = freezed,Object? shadow = freezed,}) {
  return _then(_BannerFormatConfig(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as BannerTemplate,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BannerBackgroundConfig,layout: null == layout ? _self.layout : layout // ignore: cast_nullable_to_non_nullable
as BannerLayoutConfig,typography: null == typography ? _self.typography : typography // ignore: cast_nullable_to_non_nullable
as BannerTypographyConfig,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as BannerImageConfig?,button: freezed == button ? _self.button : button // ignore: cast_nullable_to_non_nullable
as BannerButtonConfig?,decorations: null == decorations ? _self._decorations : decorations // ignore: cast_nullable_to_non_nullable
as List<BannerDecorationConfig>,border: freezed == border ? _self.border : border // ignore: cast_nullable_to_non_nullable
as BannerBorderConfig?,shadow: freezed == shadow ? _self.shadow : shadow // ignore: cast_nullable_to_non_nullable
as BannerShadowConfig?,
  ));
}

/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundConfigCopyWith<$Res> get background {
  
  return $BannerBackgroundConfigCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerLayoutConfigCopyWith<$Res> get layout {
  
  return $BannerLayoutConfigCopyWith<$Res>(_self.layout, (value) {
    return _then(_self.copyWith(layout: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTypographyConfigCopyWith<$Res> get typography {
  
  return $BannerTypographyConfigCopyWith<$Res>(_self.typography, (value) {
    return _then(_self.copyWith(typography: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerImageConfigCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $BannerImageConfigCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerButtonConfigCopyWith<$Res>? get button {
    if (_self.button == null) {
    return null;
  }

  return $BannerButtonConfigCopyWith<$Res>(_self.button!, (value) {
    return _then(_self.copyWith(button: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBorderConfigCopyWith<$Res>? get border {
    if (_self.border == null) {
    return null;
  }

  return $BannerBorderConfigCopyWith<$Res>(_self.border!, (value) {
    return _then(_self.copyWith(border: value));
  });
}/// Create a copy of BannerFormatConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerShadowConfigCopyWith<$Res>? get shadow {
    if (_self.shadow == null) {
    return null;
  }

  return $BannerShadowConfigCopyWith<$Res>(_self.shadow!, (value) {
    return _then(_self.copyWith(shadow: value));
  });
}
}

// dart format on
