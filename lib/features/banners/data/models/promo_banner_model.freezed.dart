// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoBannerModel {

 String get id;@JsonKey(name: 'title') String get title;@JsonKey(name: 'discount') String get discount;@JsonKey(name: 'subtitle') String get subtitle;@JsonKey(name: 'start_color') String get startColor;@JsonKey(name: 'end_color') String get endColor;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'display_order') int get sortOrder;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of PromoBannerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoBannerModelCopyWith<PromoBannerModel> get copyWith => _$PromoBannerModelCopyWithImpl<PromoBannerModel>(this as PromoBannerModel, _$identity);

  /// Serializes this PromoBannerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoBannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.startColor, startColor) || other.startColor == startColor)&&(identical(other.endColor, endColor) || other.endColor == endColor)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,discount,subtitle,startColor,endColor,imageUrl,isActive,sortOrder,createdAt);

@override
String toString() {
  return 'PromoBannerModel(id: $id, title: $title, discount: $discount, subtitle: $subtitle, startColor: $startColor, endColor: $endColor, imageUrl: $imageUrl, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PromoBannerModelCopyWith<$Res>  {
  factory $PromoBannerModelCopyWith(PromoBannerModel value, $Res Function(PromoBannerModel) _then) = _$PromoBannerModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'title') String title,@JsonKey(name: 'discount') String discount,@JsonKey(name: 'subtitle') String subtitle,@JsonKey(name: 'start_color') String startColor,@JsonKey(name: 'end_color') String endColor,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'display_order') int sortOrder,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$PromoBannerModelCopyWithImpl<$Res>
    implements $PromoBannerModelCopyWith<$Res> {
  _$PromoBannerModelCopyWithImpl(this._self, this._then);

  final PromoBannerModel _self;
  final $Res Function(PromoBannerModel) _then;

/// Create a copy of PromoBannerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? discount = null,Object? subtitle = null,Object? startColor = null,Object? endColor = null,Object? imageUrl = freezed,Object? isActive = null,Object? sortOrder = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,startColor: null == startColor ? _self.startColor : startColor // ignore: cast_nullable_to_non_nullable
as String,endColor: null == endColor ? _self.endColor : endColor // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoBannerModel].
extension PromoBannerModelPatterns on PromoBannerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoBannerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoBannerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoBannerModel value)  $default,){
final _that = this;
switch (_that) {
case _PromoBannerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoBannerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PromoBannerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'discount')  String discount, @JsonKey(name: 'subtitle')  String subtitle, @JsonKey(name: 'start_color')  String startColor, @JsonKey(name: 'end_color')  String endColor, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'display_order')  int sortOrder, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoBannerModel() when $default != null:
return $default(_that.id,_that.title,_that.discount,_that.subtitle,_that.startColor,_that.endColor,_that.imageUrl,_that.isActive,_that.sortOrder,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'discount')  String discount, @JsonKey(name: 'subtitle')  String subtitle, @JsonKey(name: 'start_color')  String startColor, @JsonKey(name: 'end_color')  String endColor, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'display_order')  int sortOrder, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PromoBannerModel():
return $default(_that.id,_that.title,_that.discount,_that.subtitle,_that.startColor,_that.endColor,_that.imageUrl,_that.isActive,_that.sortOrder,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'discount')  String discount, @JsonKey(name: 'subtitle')  String subtitle, @JsonKey(name: 'start_color')  String startColor, @JsonKey(name: 'end_color')  String endColor, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'display_order')  int sortOrder, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PromoBannerModel() when $default != null:
return $default(_that.id,_that.title,_that.discount,_that.subtitle,_that.startColor,_that.endColor,_that.imageUrl,_that.isActive,_that.sortOrder,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoBannerModel implements PromoBannerModel {
  const _PromoBannerModel({required this.id, @JsonKey(name: 'title') required this.title, @JsonKey(name: 'discount') required this.discount, @JsonKey(name: 'subtitle') required this.subtitle, @JsonKey(name: 'start_color') required this.startColor, @JsonKey(name: 'end_color') required this.endColor, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'display_order') required this.sortOrder, @JsonKey(name: 'created_at') required this.createdAt});
  factory _PromoBannerModel.fromJson(Map<String, dynamic> json) => _$PromoBannerModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'discount') final  String discount;
@override@JsonKey(name: 'subtitle') final  String subtitle;
@override@JsonKey(name: 'start_color') final  String startColor;
@override@JsonKey(name: 'end_color') final  String endColor;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'display_order') final  int sortOrder;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of PromoBannerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoBannerModelCopyWith<_PromoBannerModel> get copyWith => __$PromoBannerModelCopyWithImpl<_PromoBannerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoBannerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoBannerModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.startColor, startColor) || other.startColor == startColor)&&(identical(other.endColor, endColor) || other.endColor == endColor)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,discount,subtitle,startColor,endColor,imageUrl,isActive,sortOrder,createdAt);

@override
String toString() {
  return 'PromoBannerModel(id: $id, title: $title, discount: $discount, subtitle: $subtitle, startColor: $startColor, endColor: $endColor, imageUrl: $imageUrl, isActive: $isActive, sortOrder: $sortOrder, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PromoBannerModelCopyWith<$Res> implements $PromoBannerModelCopyWith<$Res> {
  factory _$PromoBannerModelCopyWith(_PromoBannerModel value, $Res Function(_PromoBannerModel) _then) = __$PromoBannerModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'title') String title,@JsonKey(name: 'discount') String discount,@JsonKey(name: 'subtitle') String subtitle,@JsonKey(name: 'start_color') String startColor,@JsonKey(name: 'end_color') String endColor,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'display_order') int sortOrder,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$PromoBannerModelCopyWithImpl<$Res>
    implements _$PromoBannerModelCopyWith<$Res> {
  __$PromoBannerModelCopyWithImpl(this._self, this._then);

  final _PromoBannerModel _self;
  final $Res Function(_PromoBannerModel) _then;

/// Create a copy of PromoBannerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? discount = null,Object? subtitle = null,Object? startColor = null,Object? endColor = null,Object? imageUrl = freezed,Object? isActive = null,Object? sortOrder = null,Object? createdAt = null,}) {
  return _then(_PromoBannerModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,startColor: null == startColor ? _self.startColor : startColor // ignore: cast_nullable_to_non_nullable
as String,endColor: null == endColor ? _self.endColor : endColor // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
