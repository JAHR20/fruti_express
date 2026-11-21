// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_style_config_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerStyleConfigModel {

 int get version;@JsonKey(unknownEnumValue: BannerFormat.carouselCard) BannerFormat get defaultFormat;@BannerFormatsConverter() Map<BannerFormat, BannerFormatConfigModel> get formats;
/// Create a copy of BannerStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerStyleConfigModelCopyWith<BannerStyleConfigModel> get copyWith => _$BannerStyleConfigModelCopyWithImpl<BannerStyleConfigModel>(this as BannerStyleConfigModel, _$identity);

  /// Serializes this BannerStyleConfigModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerStyleConfigModel&&(identical(other.version, version) || other.version == version)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other.formats, formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,defaultFormat,const DeepCollectionEquality().hash(formats));

@override
String toString() {
  return 'BannerStyleConfigModel(version: $version, defaultFormat: $defaultFormat, formats: $formats)';
}


}

/// @nodoc
abstract mixin class $BannerStyleConfigModelCopyWith<$Res>  {
  factory $BannerStyleConfigModelCopyWith(BannerStyleConfigModel value, $Res Function(BannerStyleConfigModel) _then) = _$BannerStyleConfigModelCopyWithImpl;
@useResult
$Res call({
 int version,@JsonKey(unknownEnumValue: BannerFormat.carouselCard) BannerFormat defaultFormat,@BannerFormatsConverter() Map<BannerFormat, BannerFormatConfigModel> formats
});




}
/// @nodoc
class _$BannerStyleConfigModelCopyWithImpl<$Res>
    implements $BannerStyleConfigModelCopyWith<$Res> {
  _$BannerStyleConfigModelCopyWithImpl(this._self, this._then);

  final BannerStyleConfigModel _self;
  final $Res Function(BannerStyleConfigModel) _then;

/// Create a copy of BannerStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? defaultFormat = null,Object? formats = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as BannerFormat,formats: null == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as Map<BannerFormat, BannerFormatConfigModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerStyleConfigModel].
extension BannerStyleConfigModelPatterns on BannerStyleConfigModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerStyleConfigModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerStyleConfigModel value)  $default,){
final _that = this;
switch (_that) {
case _BannerStyleConfigModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerStyleConfigModel value)?  $default,){
final _that = this;
switch (_that) {
case _BannerStyleConfigModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version, @JsonKey(unknownEnumValue: BannerFormat.carouselCard)  BannerFormat defaultFormat, @BannerFormatsConverter()  Map<BannerFormat, BannerFormatConfigModel> formats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerStyleConfigModel() when $default != null:
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version, @JsonKey(unknownEnumValue: BannerFormat.carouselCard)  BannerFormat defaultFormat, @BannerFormatsConverter()  Map<BannerFormat, BannerFormatConfigModel> formats)  $default,) {final _that = this;
switch (_that) {
case _BannerStyleConfigModel():
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version, @JsonKey(unknownEnumValue: BannerFormat.carouselCard)  BannerFormat defaultFormat, @BannerFormatsConverter()  Map<BannerFormat, BannerFormatConfigModel> formats)?  $default,) {final _that = this;
switch (_that) {
case _BannerStyleConfigModel() when $default != null:
return $default(_that.version,_that.defaultFormat,_that.formats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerStyleConfigModel extends BannerStyleConfigModel {
  const _BannerStyleConfigModel({this.version = 1, @JsonKey(unknownEnumValue: BannerFormat.carouselCard) this.defaultFormat = BannerFormat.carouselCard, @BannerFormatsConverter() final  Map<BannerFormat, BannerFormatConfigModel> formats = const {}}): _formats = formats,super._();
  factory _BannerStyleConfigModel.fromJson(Map<String, dynamic> json) => _$BannerStyleConfigModelFromJson(json);

@override@JsonKey() final  int version;
@override@JsonKey(unknownEnumValue: BannerFormat.carouselCard) final  BannerFormat defaultFormat;
 final  Map<BannerFormat, BannerFormatConfigModel> _formats;
@override@JsonKey()@BannerFormatsConverter() Map<BannerFormat, BannerFormatConfigModel> get formats {
  if (_formats is EqualUnmodifiableMapView) return _formats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_formats);
}


/// Create a copy of BannerStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerStyleConfigModelCopyWith<_BannerStyleConfigModel> get copyWith => __$BannerStyleConfigModelCopyWithImpl<_BannerStyleConfigModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerStyleConfigModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerStyleConfigModel&&(identical(other.version, version) || other.version == version)&&(identical(other.defaultFormat, defaultFormat) || other.defaultFormat == defaultFormat)&&const DeepCollectionEquality().equals(other._formats, _formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,defaultFormat,const DeepCollectionEquality().hash(_formats));

@override
String toString() {
  return 'BannerStyleConfigModel(version: $version, defaultFormat: $defaultFormat, formats: $formats)';
}


}

/// @nodoc
abstract mixin class _$BannerStyleConfigModelCopyWith<$Res> implements $BannerStyleConfigModelCopyWith<$Res> {
  factory _$BannerStyleConfigModelCopyWith(_BannerStyleConfigModel value, $Res Function(_BannerStyleConfigModel) _then) = __$BannerStyleConfigModelCopyWithImpl;
@override @useResult
$Res call({
 int version,@JsonKey(unknownEnumValue: BannerFormat.carouselCard) BannerFormat defaultFormat,@BannerFormatsConverter() Map<BannerFormat, BannerFormatConfigModel> formats
});




}
/// @nodoc
class __$BannerStyleConfigModelCopyWithImpl<$Res>
    implements _$BannerStyleConfigModelCopyWith<$Res> {
  __$BannerStyleConfigModelCopyWithImpl(this._self, this._then);

  final _BannerStyleConfigModel _self;
  final $Res Function(_BannerStyleConfigModel) _then;

/// Create a copy of BannerStyleConfigModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? defaultFormat = null,Object? formats = null,}) {
  return _then(_BannerStyleConfigModel(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,defaultFormat: null == defaultFormat ? _self.defaultFormat : defaultFormat // ignore: cast_nullable_to_non_nullable
as BannerFormat,formats: null == formats ? _self._formats : formats // ignore: cast_nullable_to_non_nullable
as Map<BannerFormat, BannerFormatConfigModel>,
  ));
}


}

// dart format on
