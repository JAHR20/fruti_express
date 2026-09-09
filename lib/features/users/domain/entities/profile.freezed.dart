// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile {

 String get id; String get firstName; String get paternalLastName; String? get maternalLastName; String? get alias; String get email; bool get active; String? get phone; UserRole get role; String? get branchId; String? get avatarUrl; DateTime get creationDate;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.paternalLastName, paternalLastName) || other.paternalLastName == paternalLastName)&&(identical(other.maternalLastName, maternalLastName) || other.maternalLastName == maternalLastName)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.active, active) || other.active == active)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,paternalLastName,maternalLastName,alias,email,active,phone,role,branchId,avatarUrl,creationDate);

@override
String toString() {
  return 'Profile(id: $id, firstName: $firstName, paternalLastName: $paternalLastName, maternalLastName: $maternalLastName, alias: $alias, email: $email, active: $active, phone: $phone, role: $role, branchId: $branchId, avatarUrl: $avatarUrl, creationDate: $creationDate)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String paternalLastName, String? maternalLastName, String? alias, String email, bool active, String? phone, UserRole role, String? branchId, String? avatarUrl, DateTime creationDate
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
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


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String paternalLastName,  String? maternalLastName,  String? alias,  String email,  bool active,  String? phone,  UserRole role,  String? branchId,  String? avatarUrl,  DateTime creationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String paternalLastName,  String? maternalLastName,  String? alias,  String email,  bool active,  String? phone,  UserRole role,  String? branchId,  String? avatarUrl,  DateTime creationDate)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.firstName,_that.paternalLastName,_that.maternalLastName,_that.alias,_that.email,_that.active,_that.phone,_that.role,_that.branchId,_that.avatarUrl,_that.creationDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String paternalLastName,  String? maternalLastName,  String? alias,  String email,  bool active,  String? phone,  UserRole role,  String? branchId,  String? avatarUrl,  DateTime creationDate)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.firstName,_that.paternalLastName,_that.maternalLastName,_that.alias,_that.email,_that.active,_that.phone,_that.role,_that.branchId,_that.avatarUrl,_that.creationDate);case _:
  return null;

}
}

}

/// @nodoc


class _Profile implements Profile {
  const _Profile({required this.id, required this.firstName, required this.paternalLastName, this.maternalLastName, this.alias, required this.email, required this.active, this.phone, required this.role, this.branchId, this.avatarUrl, required this.creationDate});
  

@override final  String id;
@override final  String firstName;
@override final  String paternalLastName;
@override final  String? maternalLastName;
@override final  String? alias;
@override final  String email;
@override final  bool active;
@override final  String? phone;
@override final  UserRole role;
@override final  String? branchId;
@override final  String? avatarUrl;
@override final  DateTime creationDate;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.paternalLastName, paternalLastName) || other.paternalLastName == paternalLastName)&&(identical(other.maternalLastName, maternalLastName) || other.maternalLastName == maternalLastName)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.active, active) || other.active == active)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.role, role) || other.role == role)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,firstName,paternalLastName,maternalLastName,alias,email,active,phone,role,branchId,avatarUrl,creationDate);

@override
String toString() {
  return 'Profile(id: $id, firstName: $firstName, paternalLastName: $paternalLastName, maternalLastName: $maternalLastName, alias: $alias, email: $email, active: $active, phone: $phone, role: $role, branchId: $branchId, avatarUrl: $avatarUrl, creationDate: $creationDate)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String paternalLastName, String? maternalLastName, String? alias, String email, bool active, String? phone, UserRole role, String? branchId, String? avatarUrl, DateTime creationDate
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? paternalLastName = null,Object? maternalLastName = freezed,Object? alias = freezed,Object? email = null,Object? active = null,Object? phone = freezed,Object? role = null,Object? branchId = freezed,Object? avatarUrl = freezed,Object? creationDate = null,}) {
  return _then(_Profile(
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
