// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Address {

 String get id; String get userId; String get alias; String get street; String get exteriorNumber; String? get interiorNumber; String get neighborhood; String get zipCode; String get municipality; String get state; String? get references; bool get isMain; DateTime get createdAt; DateTime? get updatedAt; double get latitude; double get longitude;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.interiorNumber, interiorNumber) || other.interiorNumber == interiorNumber)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.references, references) || other.references == references)&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,alias,street,exteriorNumber,interiorNumber,neighborhood,zipCode,municipality,state,references,isMain,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'Address(id: $id, userId: $userId, alias: $alias, street: $street, exteriorNumber: $exteriorNumber, interiorNumber: $interiorNumber, neighborhood: $neighborhood, zipCode: $zipCode, municipality: $municipality, state: $state, references: $references, isMain: $isMain, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String alias, String street, String exteriorNumber, String? interiorNumber, String neighborhood, String zipCode, String municipality, String state, String? references, bool isMain, DateTime createdAt, DateTime? updatedAt, double latitude, double longitude
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
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


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String alias,  String street,  String exteriorNumber,  String? interiorNumber,  String neighborhood,  String zipCode,  String municipality,  String state,  String? references,  bool isMain,  DateTime createdAt,  DateTime? updatedAt,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String alias,  String street,  String exteriorNumber,  String? interiorNumber,  String neighborhood,  String zipCode,  String municipality,  String state,  String? references,  bool isMain,  DateTime createdAt,  DateTime? updatedAt,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String alias,  String street,  String exteriorNumber,  String? interiorNumber,  String neighborhood,  String zipCode,  String municipality,  String state,  String? references,  bool isMain,  DateTime createdAt,  DateTime? updatedAt,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.userId,_that.alias,_that.street,_that.exteriorNumber,_that.interiorNumber,_that.neighborhood,_that.zipCode,_that.municipality,_that.state,_that.references,_that.isMain,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc


class _Address implements Address {
  const _Address({required this.id, required this.userId, required this.alias, required this.street, required this.exteriorNumber, this.interiorNumber, required this.neighborhood, required this.zipCode, required this.municipality, required this.state, this.references, this.isMain = false, required this.createdAt, this.updatedAt, required this.latitude, required this.longitude});
  

@override final  String id;
@override final  String userId;
@override final  String alias;
@override final  String street;
@override final  String exteriorNumber;
@override final  String? interiorNumber;
@override final  String neighborhood;
@override final  String zipCode;
@override final  String municipality;
@override final  String state;
@override final  String? references;
@override@JsonKey() final  bool isMain;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.interiorNumber, interiorNumber) || other.interiorNumber == interiorNumber)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.references, references) || other.references == references)&&(identical(other.isMain, isMain) || other.isMain == isMain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,alias,street,exteriorNumber,interiorNumber,neighborhood,zipCode,municipality,state,references,isMain,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'Address(id: $id, userId: $userId, alias: $alias, street: $street, exteriorNumber: $exteriorNumber, interiorNumber: $interiorNumber, neighborhood: $neighborhood, zipCode: $zipCode, municipality: $municipality, state: $state, references: $references, isMain: $isMain, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String alias, String street, String exteriorNumber, String? interiorNumber, String neighborhood, String zipCode, String municipality, String state, String? references, bool isMain, DateTime createdAt, DateTime? updatedAt, double latitude, double longitude
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? alias = null,Object? street = null,Object? exteriorNumber = null,Object? interiorNumber = freezed,Object? neighborhood = null,Object? zipCode = null,Object? municipality = null,Object? state = null,Object? references = freezed,Object? isMain = null,Object? createdAt = null,Object? updatedAt = freezed,Object? latitude = null,Object? longitude = null,}) {
  return _then(_Address(
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
