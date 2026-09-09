// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {

 String get id;@JsonKey(name: 'user_id') String get userId; String get alias; String get street;@JsonKey(name: 'exterior_number') String get exteriorNumber;@JsonKey(name: 'interior_number') String? get interiorNumber; String get neighborhood;@JsonKey(name: 'zip_code') String get zipCode; String get municipality; String get state;@JsonKey(name: 'references_text') String? get references;@JsonKey(name: 'is_primary') bool get isMain;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; double get latitude; double get longitude;
/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressModelCopyWith<AddressModel> get copyWith => _$AddressModelCopyWithImpl<AddressModel>(this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.interiorNumber, interiorNumber) || other.interiorNumber == interiorNumber)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.references, references) || other.references == references)&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,alias,street,exteriorNumber,interiorNumber,neighborhood,zipCode,municipality,state,references,isMain,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'AddressModel(id: $id, userId: $userId, alias: $alias, street: $street, exteriorNumber: $exteriorNumber, interiorNumber: $interiorNumber, neighborhood: $neighborhood, zipCode: $zipCode, municipality: $municipality, state: $state, references: $references, isMain: $isMain, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res>  {
  factory $AddressModelCopyWith(AddressModel value, $Res Function(AddressModel) _then) = _$AddressModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String alias, String street,@JsonKey(name: 'exterior_number') String exteriorNumber,@JsonKey(name: 'interior_number') String? interiorNumber, String neighborhood,@JsonKey(name: 'zip_code') String zipCode, String municipality, String state,@JsonKey(name: 'references_text') String? references,@JsonKey(name: 'is_primary') bool isMain,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, double latitude, double longitude
});




}
/// @nodoc
class _$AddressModelCopyWithImpl<$Res>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? alias = null,Object? street = null,Object? exteriorNumber = null,Object? interiorNumber = freezed,Object? neighborhood = null,Object? zipCode = null,Object? municipality = null,Object? state = null,Object? references = freezed,Object? isMain = null,Object? createdAt = null,Object? updatedAt = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,interiorNumber: freezed == interiorNumber ? _self.interiorNumber : interiorNumber // ignore: cast_nullable_to_non_nullable
as String?,neighborhood: null == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,references: freezed == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as String?,isMain: null == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressModel].
extension AddressModelPatterns on AddressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressModel value)  $default,){
final _that = this;
switch (_that) {
case _AddressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String alias,  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'interior_number')  String? interiorNumber,  String neighborhood, @JsonKey(name: 'zip_code')  String zipCode,  String municipality,  String state, @JsonKey(name: 'references_text')  String? references, @JsonKey(name: 'is_primary')  bool isMain, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
return $default(_that.id,_that.userId,_that.alias,_that.street,_that.exteriorNumber,_that.interiorNumber,_that.neighborhood,_that.zipCode,_that.municipality,_that.state,_that.references,_that.isMain,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId,  String alias,  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'interior_number')  String? interiorNumber,  String neighborhood, @JsonKey(name: 'zip_code')  String zipCode,  String municipality,  String state, @JsonKey(name: 'references_text')  String? references, @JsonKey(name: 'is_primary')  bool isMain, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _AddressModel():
return $default(_that.id,_that.userId,_that.alias,_that.street,_that.exteriorNumber,_that.interiorNumber,_that.neighborhood,_that.zipCode,_that.municipality,_that.state,_that.references,_that.isMain,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId,  String alias,  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'interior_number')  String? interiorNumber,  String neighborhood, @JsonKey(name: 'zip_code')  String zipCode,  String municipality,  String state, @JsonKey(name: 'references_text')  String? references, @JsonKey(name: 'is_primary')  bool isMain, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _AddressModel() when $default != null:
return $default(_that.id,_that.userId,_that.alias,_that.street,_that.exteriorNumber,_that.interiorNumber,_that.neighborhood,_that.zipCode,_that.municipality,_that.state,_that.references,_that.isMain,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressModel implements AddressModel {
  const _AddressModel({required this.id, @JsonKey(name: 'user_id') required this.userId, required this.alias, required this.street, @JsonKey(name: 'exterior_number') required this.exteriorNumber, @JsonKey(name: 'interior_number') this.interiorNumber, required this.neighborhood, @JsonKey(name: 'zip_code') required this.zipCode, required this.municipality, required this.state, @JsonKey(name: 'references_text') this.references, @JsonKey(name: 'is_primary') this.isMain = false, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, required this.latitude, required this.longitude});
  factory _AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String alias;
@override final  String street;
@override@JsonKey(name: 'exterior_number') final  String exteriorNumber;
@override@JsonKey(name: 'interior_number') final  String? interiorNumber;
@override final  String neighborhood;
@override@JsonKey(name: 'zip_code') final  String zipCode;
@override final  String municipality;
@override final  String state;
@override@JsonKey(name: 'references_text') final  String? references;
@override@JsonKey(name: 'is_primary') final  bool isMain;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressModelCopyWith<_AddressModel> get copyWith => __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.interiorNumber, interiorNumber) || other.interiorNumber == interiorNumber)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.references, references) || other.references == references)&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,alias,street,exteriorNumber,interiorNumber,neighborhood,zipCode,municipality,state,references,isMain,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'AddressModel(id: $id, userId: $userId, alias: $alias, street: $street, exteriorNumber: $exteriorNumber, interiorNumber: $interiorNumber, neighborhood: $neighborhood, zipCode: $zipCode, municipality: $municipality, state: $state, references: $references, isMain: $isMain, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res> implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(_AddressModel value, $Res Function(_AddressModel) _then) = __$AddressModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId, String alias, String street,@JsonKey(name: 'exterior_number') String exteriorNumber,@JsonKey(name: 'interior_number') String? interiorNumber, String neighborhood,@JsonKey(name: 'zip_code') String zipCode, String municipality, String state,@JsonKey(name: 'references_text') String? references,@JsonKey(name: 'is_primary') bool isMain,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, double latitude, double longitude
});




}
/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? alias = null,Object? street = null,Object? exteriorNumber = null,Object? interiorNumber = freezed,Object? neighborhood = null,Object? zipCode = null,Object? municipality = null,Object? state = null,Object? references = freezed,Object? isMain = null,Object? createdAt = null,Object? updatedAt = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_AddressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,interiorNumber: freezed == interiorNumber ? _self.interiorNumber : interiorNumber // ignore: cast_nullable_to_non_nullable
as String?,neighborhood: null == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,references: freezed == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as String?,isMain: null == isMain ? _self.isMain : isMain // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
