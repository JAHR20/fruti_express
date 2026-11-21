// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_decoration_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerDecorationConfig {

 String get id; BannerDecorationType get type; String get color; double get opacity; double get widthPercent; double get heightPercent;// Posición relativa al contenedor: 0 a 100.
 double get positionX; double get positionY; double get rotation; int get zIndex; bool get visible;
/// Create a copy of BannerDecorationConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerDecorationConfigCopyWith<BannerDecorationConfig> get copyWith => _$BannerDecorationConfigCopyWithImpl<BannerDecorationConfig>(this as BannerDecorationConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerDecorationConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.widthPercent, widthPercent) || other.widthPercent == widthPercent)&&(identical(other.heightPercent, heightPercent) || other.heightPercent == heightPercent)&&(identical(other.positionX, positionX) || other.positionX == positionX)&&(identical(other.positionY, positionY) || other.positionY == positionY)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.zIndex, zIndex) || other.zIndex == zIndex)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,color,opacity,widthPercent,heightPercent,positionX,positionY,rotation,zIndex,visible);

@override
String toString() {
  return 'BannerDecorationConfig(id: $id, type: $type, color: $color, opacity: $opacity, widthPercent: $widthPercent, heightPercent: $heightPercent, positionX: $positionX, positionY: $positionY, rotation: $rotation, zIndex: $zIndex, visible: $visible)';
}


}

/// @nodoc
abstract mixin class $BannerDecorationConfigCopyWith<$Res>  {
  factory $BannerDecorationConfigCopyWith(BannerDecorationConfig value, $Res Function(BannerDecorationConfig) _then) = _$BannerDecorationConfigCopyWithImpl;
@useResult
$Res call({
 String id, BannerDecorationType type, String color, double opacity, double widthPercent, double heightPercent, double positionX, double positionY, double rotation, int zIndex, bool visible
});




}
/// @nodoc
class _$BannerDecorationConfigCopyWithImpl<$Res>
    implements $BannerDecorationConfigCopyWith<$Res> {
  _$BannerDecorationConfigCopyWithImpl(this._self, this._then);

  final BannerDecorationConfig _self;
  final $Res Function(BannerDecorationConfig) _then;

/// Create a copy of BannerDecorationConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? color = null,Object? opacity = null,Object? widthPercent = null,Object? heightPercent = null,Object? positionX = null,Object? positionY = null,Object? rotation = null,Object? zIndex = null,Object? visible = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BannerDecorationType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,widthPercent: null == widthPercent ? _self.widthPercent : widthPercent // ignore: cast_nullable_to_non_nullable
as double,heightPercent: null == heightPercent ? _self.heightPercent : heightPercent // ignore: cast_nullable_to_non_nullable
as double,positionX: null == positionX ? _self.positionX : positionX // ignore: cast_nullable_to_non_nullable
as double,positionY: null == positionY ? _self.positionY : positionY // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,zIndex: null == zIndex ? _self.zIndex : zIndex // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerDecorationConfig].
extension BannerDecorationConfigPatterns on BannerDecorationConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerDecorationConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerDecorationConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerDecorationConfig value)  $default,){
final _that = this;
switch (_that) {
case _BannerDecorationConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerDecorationConfig value)?  $default,){
final _that = this;
switch (_that) {
case _BannerDecorationConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  BannerDecorationType type,  String color,  double opacity,  double widthPercent,  double heightPercent,  double positionX,  double positionY,  double rotation,  int zIndex,  bool visible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerDecorationConfig() when $default != null:
return $default(_that.id,_that.type,_that.color,_that.opacity,_that.widthPercent,_that.heightPercent,_that.positionX,_that.positionY,_that.rotation,_that.zIndex,_that.visible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  BannerDecorationType type,  String color,  double opacity,  double widthPercent,  double heightPercent,  double positionX,  double positionY,  double rotation,  int zIndex,  bool visible)  $default,) {final _that = this;
switch (_that) {
case _BannerDecorationConfig():
return $default(_that.id,_that.type,_that.color,_that.opacity,_that.widthPercent,_that.heightPercent,_that.positionX,_that.positionY,_that.rotation,_that.zIndex,_that.visible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  BannerDecorationType type,  String color,  double opacity,  double widthPercent,  double heightPercent,  double positionX,  double positionY,  double rotation,  int zIndex,  bool visible)?  $default,) {final _that = this;
switch (_that) {
case _BannerDecorationConfig() when $default != null:
return $default(_that.id,_that.type,_that.color,_that.opacity,_that.widthPercent,_that.heightPercent,_that.positionX,_that.positionY,_that.rotation,_that.zIndex,_that.visible);case _:
  return null;

}
}

}

/// @nodoc


class _BannerDecorationConfig implements BannerDecorationConfig {
  const _BannerDecorationConfig({required this.id, required this.type, this.color = '#FFFFFF', this.opacity = 0.2, this.widthPercent = 20.0, this.heightPercent = 20.0, this.positionX = 50.0, this.positionY = 50.0, this.rotation = 0.0, this.zIndex = 0, this.visible = true});
  

@override final  String id;
@override final  BannerDecorationType type;
@override@JsonKey() final  String color;
@override@JsonKey() final  double opacity;
@override@JsonKey() final  double widthPercent;
@override@JsonKey() final  double heightPercent;
// Posición relativa al contenedor: 0 a 100.
@override@JsonKey() final  double positionX;
@override@JsonKey() final  double positionY;
@override@JsonKey() final  double rotation;
@override@JsonKey() final  int zIndex;
@override@JsonKey() final  bool visible;

/// Create a copy of BannerDecorationConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerDecorationConfigCopyWith<_BannerDecorationConfig> get copyWith => __$BannerDecorationConfigCopyWithImpl<_BannerDecorationConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerDecorationConfig&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.color, color) || other.color == color)&&(identical(other.opacity, opacity) || other.opacity == opacity)&&(identical(other.widthPercent, widthPercent) || other.widthPercent == widthPercent)&&(identical(other.heightPercent, heightPercent) || other.heightPercent == heightPercent)&&(identical(other.positionX, positionX) || other.positionX == positionX)&&(identical(other.positionY, positionY) || other.positionY == positionY)&&(identical(other.rotation, rotation) || other.rotation == rotation)&&(identical(other.zIndex, zIndex) || other.zIndex == zIndex)&&(identical(other.visible, visible) || other.visible == visible));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,color,opacity,widthPercent,heightPercent,positionX,positionY,rotation,zIndex,visible);

@override
String toString() {
  return 'BannerDecorationConfig(id: $id, type: $type, color: $color, opacity: $opacity, widthPercent: $widthPercent, heightPercent: $heightPercent, positionX: $positionX, positionY: $positionY, rotation: $rotation, zIndex: $zIndex, visible: $visible)';
}


}

/// @nodoc
abstract mixin class _$BannerDecorationConfigCopyWith<$Res> implements $BannerDecorationConfigCopyWith<$Res> {
  factory _$BannerDecorationConfigCopyWith(_BannerDecorationConfig value, $Res Function(_BannerDecorationConfig) _then) = __$BannerDecorationConfigCopyWithImpl;
@override @useResult
$Res call({
 String id, BannerDecorationType type, String color, double opacity, double widthPercent, double heightPercent, double positionX, double positionY, double rotation, int zIndex, bool visible
});




}
/// @nodoc
class __$BannerDecorationConfigCopyWithImpl<$Res>
    implements _$BannerDecorationConfigCopyWith<$Res> {
  __$BannerDecorationConfigCopyWithImpl(this._self, this._then);

  final _BannerDecorationConfig _self;
  final $Res Function(_BannerDecorationConfig) _then;

/// Create a copy of BannerDecorationConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? color = null,Object? opacity = null,Object? widthPercent = null,Object? heightPercent = null,Object? positionX = null,Object? positionY = null,Object? rotation = null,Object? zIndex = null,Object? visible = null,}) {
  return _then(_BannerDecorationConfig(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BannerDecorationType,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,opacity: null == opacity ? _self.opacity : opacity // ignore: cast_nullable_to_non_nullable
as double,widthPercent: null == widthPercent ? _self.widthPercent : widthPercent // ignore: cast_nullable_to_non_nullable
as double,heightPercent: null == heightPercent ? _self.heightPercent : heightPercent // ignore: cast_nullable_to_non_nullable
as double,positionX: null == positionX ? _self.positionX : positionX // ignore: cast_nullable_to_non_nullable
as double,positionY: null == positionY ? _self.positionY : positionY // ignore: cast_nullable_to_non_nullable
as double,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,zIndex: null == zIndex ? _self.zIndex : zIndex // ignore: cast_nullable_to_non_nullable
as int,visible: null == visible ? _self.visible : visible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
