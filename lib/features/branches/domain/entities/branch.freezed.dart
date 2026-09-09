// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Branch {

 String get id; String get name; String get street; String get exteriorNumber; String get postalCode; String get neighborhood; String get municipality; String get state; double? get latitude; double? get longitude; bool get active; DateTime get creationDate; DateTime? get updateDate;
/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchCopyWith<Branch> get copyWith => _$BranchCopyWithImpl<Branch>(this as Branch, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Branch&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,street,exteriorNumber,postalCode,neighborhood,municipality,state,latitude,longitude,active,creationDate,updateDate);

@override
String toString() {
  return 'Branch(id: $id, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, municipality: $municipality, state: $state, latitude: $latitude, longitude: $longitude, active: $active, creationDate: $creationDate, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $BranchCopyWith<$Res>  {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) _then) = _$BranchCopyWithImpl;
@useResult
$Res call({
 String id, String name, String street, String exteriorNumber, String postalCode, String neighborhood, String municipality, String state, double? latitude, double? longitude, bool active, DateTime creationDate, DateTime? updateDate
});




}
/// @nodoc
class _$BranchCopyWithImpl<$Res>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._self, this._then);

  final Branch _self;
  final $Res Function(Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? street = null,Object? exteriorNumber = null,Object? postalCode = null,Object? neighborhood = null,Object? municipality = null,Object? state = null,Object? latitude = freezed,Object? longitude = freezed,Object? active = null,Object? creationDate = null,Object? updateDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,neighborhood: null == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Branch].
extension BranchPatterns on Branch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Branch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Branch value)  $default,){
final _that = this;
switch (_that) {
case _Branch():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Branch value)?  $default,){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String street,  String exteriorNumber,  String postalCode,  String neighborhood,  String municipality,  String state,  double? latitude,  double? longitude,  bool active,  DateTime creationDate,  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.municipality,_that.state,_that.latitude,_that.longitude,_that.active,_that.creationDate,_that.updateDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String street,  String exteriorNumber,  String postalCode,  String neighborhood,  String municipality,  String state,  double? latitude,  double? longitude,  bool active,  DateTime creationDate,  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _Branch():
return $default(_that.id,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.municipality,_that.state,_that.latitude,_that.longitude,_that.active,_that.creationDate,_that.updateDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String street,  String exteriorNumber,  String postalCode,  String neighborhood,  String municipality,  String state,  double? latitude,  double? longitude,  bool active,  DateTime creationDate,  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.municipality,_that.state,_that.latitude,_that.longitude,_that.active,_that.creationDate,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc


class _Branch implements Branch {
  const _Branch({required this.id, required this.name, required this.street, required this.exteriorNumber, required this.postalCode, required this.neighborhood, required this.municipality, required this.state, this.latitude, this.longitude, required this.active, required this.creationDate, this.updateDate});
  

@override final  String id;
@override final  String name;
@override final  String street;
@override final  String exteriorNumber;
@override final  String postalCode;
@override final  String neighborhood;
@override final  String municipality;
@override final  String state;
@override final  double? latitude;
@override final  double? longitude;
@override final  bool active;
@override final  DateTime creationDate;
@override final  DateTime? updateDate;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchCopyWith<_Branch> get copyWith => __$BranchCopyWithImpl<_Branch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Branch&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,street,exteriorNumber,postalCode,neighborhood,municipality,state,latitude,longitude,active,creationDate,updateDate);

@override
String toString() {
  return 'Branch(id: $id, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, municipality: $municipality, state: $state, latitude: $latitude, longitude: $longitude, active: $active, creationDate: $creationDate, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$BranchCopyWith(_Branch value, $Res Function(_Branch) _then) = __$BranchCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String street, String exteriorNumber, String postalCode, String neighborhood, String municipality, String state, double? latitude, double? longitude, bool active, DateTime creationDate, DateTime? updateDate
});




}
/// @nodoc
class __$BranchCopyWithImpl<$Res>
    implements _$BranchCopyWith<$Res> {
  __$BranchCopyWithImpl(this._self, this._then);

  final _Branch _self;
  final $Res Function(_Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? street = null,Object? exteriorNumber = null,Object? postalCode = null,Object? neighborhood = null,Object? municipality = null,Object? state = null,Object? latitude = freezed,Object? longitude = freezed,Object? active = null,Object? creationDate = null,Object? updateDate = freezed,}) {
  return _then(_Branch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,exteriorNumber: null == exteriorNumber ? _self.exteriorNumber : exteriorNumber // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,neighborhood: null == neighborhood ? _self.neighborhood : neighborhood // ignore: cast_nullable_to_non_nullable
as String,municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,updateDate: freezed == updateDate ? _self.updateDate : updateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
