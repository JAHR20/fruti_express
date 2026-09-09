// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get paternalLastName;@JsonKey(name: 'maternal_last_name') String? get maternalLastName; String? get alias; String get email;@JsonKey(name: 'is_active') bool get active;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'role') UserRole get role;@JsonKey(name: 'branch_id') String? get branchId;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'created_at') DateTime get creationDate;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.paternalLastName, paternalLastName) || other.paternalLastName == paternalLastName)&&(identical(other.maternalLastName, maternalLastName) || other.maternalLastName == maternalLastName)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.active, active) || other.active == active)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,paternalLastName,maternalLastName,alias,email,active,phone,role,branchId,avatarUrl,creationDate);

@override
String toString() {
  return 'ProfileModel(id: $id, firstName: $firstName, paternalLastName: $paternalLastName, maternalLastName: $maternalLastName, alias: $alias, email: $email, active: $active, phone: $phone, role: $role, branchId: $branchId, avatarUrl: $avatarUrl, creationDate: $creationDate)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String paternalLastName,@JsonKey(name: 'maternal_last_name') String? maternalLastName, String? alias, String email,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'role') UserRole role,@JsonKey(name: 'branch_id') String? branchId,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'created_at') DateTime creationDate
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? paternalLastName = null,Object? maternalLastName = freezed,Object? alias = freezed,Object? email = null,Object? active = null,Object? phone = freezed,Object? role = null,Object? branchId = freezed,Object? avatarUrl = freezed,Object? creationDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,paternalLastName: null == paternalLastName ? _self.paternalLastName : paternalLastName // ignore: cast_nullable_to_non_nullable
as String,maternalLastName: freezed == maternalLastName ? _self.maternalLastName : maternalLastName // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String paternalLastName, @JsonKey(name: 'maternal_last_name')  String? maternalLastName,  String? alias,  String email, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'created_at')  DateTime creationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.firstName,_that.paternalLastName,_that.maternalLastName,_that.alias,_that.email,_that.active,_that.phone,_that.role,_that.branchId,_that.avatarUrl,_that.creationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String paternalLastName, @JsonKey(name: 'maternal_last_name')  String? maternalLastName,  String? alias,  String email, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'created_at')  DateTime creationDate)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.firstName,_that.paternalLastName,_that.maternalLastName,_that.alias,_that.email,_that.active,_that.phone,_that.role,_that.branchId,_that.avatarUrl,_that.creationDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String paternalLastName, @JsonKey(name: 'maternal_last_name')  String? maternalLastName,  String? alias,  String email, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'phone')  String? phone, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'created_at')  DateTime creationDate)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.firstName,_that.paternalLastName,_that.maternalLastName,_that.alias,_that.email,_that.active,_that.phone,_that.role,_that.branchId,_that.avatarUrl,_that.creationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({required this.id, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.paternalLastName, @JsonKey(name: 'maternal_last_name') this.maternalLastName, this.alias, required this.email, @JsonKey(name: 'is_active') required this.active, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'role') required this.role, @JsonKey(name: 'branch_id') this.branchId, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'created_at') required this.creationDate});
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String paternalLastName;
@override@JsonKey(name: 'maternal_last_name') final  String? maternalLastName;
@override final  String? alias;
@override final  String email;
@override@JsonKey(name: 'is_active') final  bool active;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'role') final  UserRole role;
@override@JsonKey(name: 'branch_id') final  String? branchId;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'created_at') final  DateTime creationDate;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.paternalLastName, paternalLastName) || other.paternalLastName == paternalLastName)&&(identical(other.maternalLastName, maternalLastName) || other.maternalLastName == maternalLastName)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.active, active) || other.active == active)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,paternalLastName,maternalLastName,alias,email,active,phone,role,branchId,avatarUrl,creationDate);

@override
String toString() {
  return 'ProfileModel(id: $id, firstName: $firstName, paternalLastName: $paternalLastName, maternalLastName: $maternalLastName, alias: $alias, email: $email, active: $active, phone: $phone, role: $role, branchId: $branchId, avatarUrl: $avatarUrl, creationDate: $creationDate)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String paternalLastName,@JsonKey(name: 'maternal_last_name') String? maternalLastName, String? alias, String email,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'role') UserRole role,@JsonKey(name: 'branch_id') String? branchId,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'created_at') DateTime creationDate
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? paternalLastName = null,Object? maternalLastName = freezed,Object? alias = freezed,Object? email = null,Object? active = null,Object? phone = freezed,Object? role = null,Object? branchId = freezed,Object? avatarUrl = freezed,Object? creationDate = null,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,paternalLastName: null == paternalLastName ? _self.paternalLastName : paternalLastName // ignore: cast_nullable_to_non_nullable
as String,maternalLastName: freezed == maternalLastName ? _self.maternalLastName : maternalLastName // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
