// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchModel {

 String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'street') String get street;@JsonKey(name: 'exterior_number') String get exteriorNumber;@JsonKey(name: 'zip_code') String get postalCode;@JsonKey(name: 'neighborhood') String get neighborhood;@JsonKey(name: 'municipality') String get municipality;@JsonKey(name: 'state') String get state;@JsonKey(name: 'latitude') double? get latitude;@JsonKey(name: 'longitude') double? get longitude;@JsonKey(name: 'is_active') bool get active;@JsonKey(name: 'created_at') DateTime get creationDate;@JsonKey(name: 'updated_at') DateTime? get updateDate;
/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchModelCopyWith<BranchModel> get copyWith => _$BranchModelCopyWithImpl<BranchModel>(this as BranchModel, _$identity);

  /// Serializes this BranchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,street,exteriorNumber,postalCode,neighborhood,municipality,state,latitude,longitude,active,creationDate,updateDate);

@override
String toString() {
  return 'BranchModel(id: $id, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, municipality: $municipality, state: $state, latitude: $latitude, longitude: $longitude, active: $active, creationDate: $creationDate, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class $BranchModelCopyWith<$Res>  {
  factory $BranchModelCopyWith(BranchModel value, $Res Function(BranchModel) _then) = _$BranchModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'street') String street,@JsonKey(name: 'exterior_number') String exteriorNumber,@JsonKey(name: 'zip_code') String postalCode,@JsonKey(name: 'neighborhood') String neighborhood,@JsonKey(name: 'municipality') String municipality,@JsonKey(name: 'state') String state,@JsonKey(name: 'latitude') double? latitude,@JsonKey(name: 'longitude') double? longitude,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'created_at') DateTime creationDate,@JsonKey(name: 'updated_at') DateTime? updateDate
});




}
/// @nodoc
class _$BranchModelCopyWithImpl<$Res>
    implements $BranchModelCopyWith<$Res> {
  _$BranchModelCopyWithImpl(this._self, this._then);

  final BranchModel _self;
  final $Res Function(BranchModel) _then;

/// Create a copy of BranchModel
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


/// Adds pattern-matching-related methods to [BranchModel].
extension BranchModelPatterns on BranchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchModel value)  $default,){
final _that = this;
switch (_that) {
case _BranchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchModel value)?  $default,){
final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'street')  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'zip_code')  String postalCode, @JsonKey(name: 'neighborhood')  String neighborhood, @JsonKey(name: 'municipality')  String municipality, @JsonKey(name: 'state')  String state, @JsonKey(name: 'latitude')  double? latitude, @JsonKey(name: 'longitude')  double? longitude, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'updated_at')  DateTime? updateDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'street')  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'zip_code')  String postalCode, @JsonKey(name: 'neighborhood')  String neighborhood, @JsonKey(name: 'municipality')  String municipality, @JsonKey(name: 'state')  String state, @JsonKey(name: 'latitude')  double? latitude, @JsonKey(name: 'longitude')  double? longitude, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'updated_at')  DateTime? updateDate)  $default,) {final _that = this;
switch (_that) {
case _BranchModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'street')  String street, @JsonKey(name: 'exterior_number')  String exteriorNumber, @JsonKey(name: 'zip_code')  String postalCode, @JsonKey(name: 'neighborhood')  String neighborhood, @JsonKey(name: 'municipality')  String municipality, @JsonKey(name: 'state')  String state, @JsonKey(name: 'latitude')  double? latitude, @JsonKey(name: 'longitude')  double? longitude, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'updated_at')  DateTime? updateDate)?  $default,) {final _that = this;
switch (_that) {
case _BranchModel() when $default != null:
return $default(_that.id,_that.name,_that.street,_that.exteriorNumber,_that.postalCode,_that.neighborhood,_that.municipality,_that.state,_that.latitude,_that.longitude,_that.active,_that.creationDate,_that.updateDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchModel implements BranchModel {
  const _BranchModel({required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'street') required this.street, @JsonKey(name: 'exterior_number') required this.exteriorNumber, @JsonKey(name: 'zip_code') required this.postalCode, @JsonKey(name: 'neighborhood') required this.neighborhood, @JsonKey(name: 'municipality') required this.municipality, @JsonKey(name: 'state') required this.state, @JsonKey(name: 'latitude') this.latitude, @JsonKey(name: 'longitude') this.longitude, @JsonKey(name: 'is_active') required this.active, @JsonKey(name: 'created_at') required this.creationDate, @JsonKey(name: 'updated_at') this.updateDate});
  factory _BranchModel.fromJson(Map<String, dynamic> json) => _$BranchModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'street') final  String street;
@override@JsonKey(name: 'exterior_number') final  String exteriorNumber;
@override@JsonKey(name: 'zip_code') final  String postalCode;
@override@JsonKey(name: 'neighborhood') final  String neighborhood;
@override@JsonKey(name: 'municipality') final  String municipality;
@override@JsonKey(name: 'state') final  String state;
@override@JsonKey(name: 'latitude') final  double? latitude;
@override@JsonKey(name: 'longitude') final  double? longitude;
@override@JsonKey(name: 'is_active') final  bool active;
@override@JsonKey(name: 'created_at') final  DateTime creationDate;
@override@JsonKey(name: 'updated_at') final  DateTime? updateDate;

/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchModelCopyWith<_BranchModel> get copyWith => __$BranchModelCopyWithImpl<_BranchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.exteriorNumber, exteriorNumber) || other.exteriorNumber == exteriorNumber)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.neighborhood, neighborhood) || other.neighborhood == neighborhood)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.state, state) || other.state == state)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.active, active) || other.active == active)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.updateDate, updateDate) || other.updateDate == updateDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,street,exteriorNumber,postalCode,neighborhood,municipality,state,latitude,longitude,active,creationDate,updateDate);

@override
String toString() {
  return 'BranchModel(id: $id, name: $name, street: $street, exteriorNumber: $exteriorNumber, postalCode: $postalCode, neighborhood: $neighborhood, municipality: $municipality, state: $state, latitude: $latitude, longitude: $longitude, active: $active, creationDate: $creationDate, updateDate: $updateDate)';
}


}

/// @nodoc
abstract mixin class _$BranchModelCopyWith<$Res> implements $BranchModelCopyWith<$Res> {
  factory _$BranchModelCopyWith(_BranchModel value, $Res Function(_BranchModel) _then) = __$BranchModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'street') String street,@JsonKey(name: 'exterior_number') String exteriorNumber,@JsonKey(name: 'zip_code') String postalCode,@JsonKey(name: 'neighborhood') String neighborhood,@JsonKey(name: 'municipality') String municipality,@JsonKey(name: 'state') String state,@JsonKey(name: 'latitude') double? latitude,@JsonKey(name: 'longitude') double? longitude,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'created_at') DateTime creationDate,@JsonKey(name: 'updated_at') DateTime? updateDate
});




}
/// @nodoc
class __$BranchModelCopyWithImpl<$Res>
    implements _$BranchModelCopyWith<$Res> {
  __$BranchModelCopyWithImpl(this._self, this._then);

  final _BranchModel _self;
  final $Res Function(_BranchModel) _then;

/// Create a copy of BranchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? street = null,Object? exteriorNumber = null,Object? postalCode = null,Object? neighborhood = null,Object? municipality = null,Object? state = null,Object? latitude = freezed,Object? longitude = freezed,Object? active = null,Object? creationDate = null,Object? updateDate = freezed,}) {
  return _then(_BranchModel(
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
