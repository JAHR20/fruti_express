// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_typography_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerTypographyConfigModel {

 BannerTextStyleConfigModel? get title; BannerTextStyleConfigModel? get discount; BannerTextStyleConfigModel? get subtitle;
/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerTypographyConfigModelCopyWith<BannerTypographyConfigModel> get copyWith => _$BannerTypographyConfigModelCopyWithImpl<BannerTypographyConfigModel>(this as BannerTypographyConfigModel, _$identity);

  /// Serializes this BannerTypographyConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerTypographyConfigModel&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,discount,subtitle);

@override
String toString() {
  return 'BannerTypographyConfigModel(title: $title, discount: $discount, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $BannerTypographyConfigModelCopyWith<$Res>  {
  factory $BannerTypographyConfigModelCopyWith(BannerTypographyConfigModel value, $Res Function(BannerTypographyConfigModel) _then) = _$BannerTypographyConfigModelCopyWithImpl;
@useResult
$Res call({
 BannerTextStyleConfigModel? title, BannerTextStyleConfigModel? discount, BannerTextStyleConfigModel? subtitle
});


$BannerTextStyleConfigModelCopyWith<$Res>? get title;$BannerTextStyleConfigModelCopyWith<$Res>? get discount;$BannerTextStyleConfigModelCopyWith<$Res>? get subtitle;

}
/// @nodoc
class _$BannerTypographyConfigModelCopyWithImpl<$Res>
    implements $BannerTypographyConfigModelCopyWith<$Res> {
  _$BannerTypographyConfigModelCopyWithImpl(this._self, this._then);

  final BannerTypographyConfigModel _self;
  final $Res Function(BannerTypographyConfigModel) _then;

/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? discount = freezed,Object? subtitle = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,
  ));
}
/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get discount {
    if (_self.discount == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.discount!, (value) {
    return _then(_self.copyWith(discount: value));
  });
}/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get subtitle {
    if (_self.subtitle == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.subtitle!, (value) {
    return _then(_self.copyWith(subtitle: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerTypographyConfigModel].
extension BannerTypographyConfigModelPatterns on BannerTypographyConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerTypographyConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerTypographyConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerTypographyConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerTypographyConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerTypographyConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerTypographyConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BannerTextStyleConfigModel? title,  BannerTextStyleConfigModel? discount,  BannerTextStyleConfigModel? subtitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerTypographyConfigModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BannerTextStyleConfigModel? title,  BannerTextStyleConfigModel? discount,  BannerTextStyleConfigModel? subtitle)  $default,) {final _that = this;
switch (_that) {
case _BannerTypographyConfigModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BannerTextStyleConfigModel? title,  BannerTextStyleConfigModel? discount,  BannerTextStyleConfigModel? subtitle)?  $default,) {final _that = this;
switch (_that) {
case _BannerTypographyConfigModel() when $default != null:
return $default(_that.title,_that.discount,_that.subtitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerTypographyConfigModel extends BannerTypographyConfigModel {
  const _BannerTypographyConfigModel({this.title, this.discount, this.subtitle}): super._();
  factory _BannerTypographyConfigModel.fromJson(Map<String, dynamic> json) => _$BannerTypographyConfigModelFromJson(json);

@override final  BannerTextStyleConfigModel? title;
@override final  BannerTextStyleConfigModel? discount;
@override final  BannerTextStyleConfigModel? subtitle;

/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerTypographyConfigModelCopyWith<_BannerTypographyConfigModel> get copyWith => __$BannerTypographyConfigModelCopyWithImpl<_BannerTypographyConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerTypographyConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerTypographyConfigModel&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,discount,subtitle);

@override
String toString() {
  return 'BannerTypographyConfigModel(title: $title, discount: $discount, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$BannerTypographyConfigModelCopyWith<$Res> implements $BannerTypographyConfigModelCopyWith<$Res> {
  factory _$BannerTypographyConfigModelCopyWith(_BannerTypographyConfigModel value, $Res Function(_BannerTypographyConfigModel) _then) = __$BannerTypographyConfigModelCopyWithImpl;
@override @useResult
$Res call({
 BannerTextStyleConfigModel? title, BannerTextStyleConfigModel? discount, BannerTextStyleConfigModel? subtitle
});


@override $BannerTextStyleConfigModelCopyWith<$Res>? get title;@override $BannerTextStyleConfigModelCopyWith<$Res>? get discount;@override $BannerTextStyleConfigModelCopyWith<$Res>? get subtitle;

}
/// @nodoc
class __$BannerTypographyConfigModelCopyWithImpl<$Res>
    implements _$BannerTypographyConfigModelCopyWith<$Res> {
  __$BannerTypographyConfigModelCopyWithImpl(this._self, this._then);

  final _BannerTypographyConfigModel _self;
  final $Res Function(_BannerTypographyConfigModel) _then;

/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? discount = freezed,Object? subtitle = freezed,}) {
  return _then(_BannerTypographyConfigModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,discount: freezed == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as BannerTextStyleConfigModel?,
  ));
}

/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get discount {
    if (_self.discount == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.discount!, (value) {
    return _then(_self.copyWith(discount: value));
  });
}/// Create a copy of BannerTypographyConfigModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerTextStyleConfigModelCopyWith<$Res>? get subtitle {
    if (_self.subtitle == null) {
    return null;
  }

  return $BannerTextStyleConfigModelCopyWith<$Res>(_self.subtitle!, (value) {
    return _then(_self.copyWith(subtitle: value));
  });
}
}

// dart format on
