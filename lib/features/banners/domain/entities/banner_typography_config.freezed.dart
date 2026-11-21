// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_typography_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerTypographyConfig {

 BannerTextStyleConfig? get title; BannerTextStyleConfig? get discount; BannerTextStyleConfig? get subtitle;
/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerTypographyConfigCopyWith<BannerTypographyConfig> get copyWith => _$BannerTypographyConfigCopyWithImpl<BannerTypographyConfig>(this as BannerTypographyConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerTypographyConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}


@override
int get hashCode => Object.hash(runtimeType,title,discount,subtitle);

@override
String toString() {
  return 'BannerTypographyConfig(title: $title, discount: $discount, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $BannerTypographyConfigCopyWith<$Res>  {
  factory $BannerTypographyConfigCopyWith(BannerTypographyConfig value, $Res Function(BannerTypographyConfig) _then) = _$BannerTypographyConfigCopyWithImpl;
@useResult
$Res call({
 BannerTextStyleConfig? title, BannerTextStyleConfig? discount, BannerTextStyleConfig? subtitle
});


$BannerTextStyleConfigCopyWith<$Res>? get title;$BannerTextStyleConfigCopyWith<$Res>? get discount;$BannerTextStyleConfigCopyWith<$Res>? get subtitle;

}
/// @nodoc
class _$BannerTypographyConfigCopyWithImpl<$Res>
    implements $BannerTypographyConfigCopyWith<$Res> {
  _$BannerTypographyConfigCopyWithImpl(this._self, this._then);

  final BannerTypographyConfig _self;
  final $Res Function(BannerTypographyConfig) _then;

/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? discount = freezed,Object? subtitle = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,
  ));
}
/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get discount {
    if (_self.discount == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.discount!, (value) {
    return _then(_self.copyWith(discount: value));
  });
}/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get subtitle {
    if (_self.subtitle == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.subtitle!, (value) {
    return _then(_self.copyWith(subtitle: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerTypographyConfig].
extension BannerTypographyConfigPatterns on BannerTypographyConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerTypographyConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerTypographyConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerTypographyConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerTypographyConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerTypographyConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerTypographyConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerTextStyleConfig? title,  BannerTextStyleConfig? discount,  BannerTextStyleConfig? subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerTypographyConfig() when $default != null:
return $default(_that.title,_that.discount,_that.subtitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerTextStyleConfig? title,  BannerTextStyleConfig? discount,  BannerTextStyleConfig? subtitle)  $default,) {final _that = this;
switch (_that) {
case _BannerTypographyConfig():
return $default(_that.title,_that.discount,_that.subtitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerTextStyleConfig? title,  BannerTextStyleConfig? discount,  BannerTextStyleConfig? subtitle)?  $default,) {final _that = this;
switch (_that) {
case _BannerTypographyConfig() when $default != null:
return $default(_that.title,_that.discount,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc


class _BannerTypographyConfig implements BannerTypographyConfig {
  const _BannerTypographyConfig({this.title, this.discount, this.subtitle});
  

@override final  BannerTextStyleConfig? title;
@override final  BannerTextStyleConfig? discount;
@override final  BannerTextStyleConfig? subtitle;

/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerTypographyConfigCopyWith<_BannerTypographyConfig> get copyWith => __$BannerTypographyConfigCopyWithImpl<_BannerTypographyConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerTypographyConfig&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}


@override
int get hashCode => Object.hash(runtimeType,title,discount,subtitle);

@override
String toString() {
  return 'BannerTypographyConfig(title: $title, discount: $discount, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$BannerTypographyConfigCopyWith<$Res> implements $BannerTypographyConfigCopyWith<$Res> {
  factory _$BannerTypographyConfigCopyWith(_BannerTypographyConfig value, $Res Function(_BannerTypographyConfig) _then) = __$BannerTypographyConfigCopyWithImpl;
@override @useResult
$Res call({
 BannerTextStyleConfig? title, BannerTextStyleConfig? discount, BannerTextStyleConfig? subtitle
});


@override $BannerTextStyleConfigCopyWith<$Res>? get title;@override $BannerTextStyleConfigCopyWith<$Res>? get discount;@override $BannerTextStyleConfigCopyWith<$Res>? get subtitle;

}
/// @nodoc
class __$BannerTypographyConfigCopyWithImpl<$Res>
    implements _$BannerTypographyConfigCopyWith<$Res> {
  __$BannerTypographyConfigCopyWithImpl(this._self, this._then);

  final _BannerTypographyConfig _self;
  final $Res Function(_BannerTypographyConfig) _then;

/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? discount = freezed,Object? subtitle = freezed,}) {
  return _then(_BannerTypographyConfig(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfig?,
  ));
}

/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get discount {
    if (_self.discount == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.discount!, (value) {
    return _then(_self.copyWith(discount: value));
  });
}/// Create a copy of BannerTypographyConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigCopyWith<$Res>? get subtitle {
    if (_self.subtitle == null) {
    return null;
  }

  return $BannerTextStyleConfigCopyWith<$Res>(_self.subtitle!, (value) {
    return _then(_self.copyWith(subtitle: value));
  });
}
}

// dart format on
