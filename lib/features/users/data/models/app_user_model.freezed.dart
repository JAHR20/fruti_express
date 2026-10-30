// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUserModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'email') String get email;@JsonKey(name: 'role') UserRole get role;@JsonKey(name: 'is_active') bool get active;@JsonKey(name: 'branch_id') String? get branchId;@JsonKey(name: 'created_at') DateTime get creationDate;@JsonKey(name: 'user_profiles') UserProfileModel get profile;
/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserModelCopyWith<AppUserModel> get copyWith => _$AppUserModelCopyWithImpl<AppUserModel>(this as AppUserModel, _$identity);

  /// Serializes this AppUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.active, active) || other.active == active)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,active,branchId,creationDate,profile);

@override
String toString() {
  return 'AppUserModel(id: $id, email: $email, role: $role, active: $active, branchId: $branchId, creationDate: $creationDate, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $AppUserModelCopyWith<$Res>  {
  factory $AppUserModelCopyWith(AppUserModel value, $Res Function(AppUserModel) _then) = _$AppUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'email') String email,@JsonKey(name: 'role') UserRole role,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'branch_id') String? branchId,@JsonKey(name: 'created_at') DateTime creationDate,@JsonKey(name: 'user_profiles') UserProfileModel profile
});


$UserProfileModelCopyWith<$Res> get profile;

}
/// @nodoc
class _$AppUserModelCopyWithImpl<$Res>
    implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._self, this._then);

  final AppUserModel _self;
  final $Res Function(AppUserModel) _then;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? active = null,Object? branchId = freezed,Object? creationDate = null,Object? profile = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}
/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<$Res> get profile {
  
  return $UserProfileModelCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppUserModel].
extension AppUserModelPatterns on AppUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AppUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'user_profiles')  UserProfileModel profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.active,_that.branchId,_that.creationDate,_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'user_profiles')  UserProfileModel profile)  $default,) {final _that = this;
switch (_that) {
case _AppUserModel():
return $default(_that.id,_that.email,_that.role,_that.active,_that.branchId,_that.creationDate,_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'email')  String email, @JsonKey(name: 'role')  UserRole role, @JsonKey(name: 'is_active')  bool active, @JsonKey(name: 'branch_id')  String? branchId, @JsonKey(name: 'created_at')  DateTime creationDate, @JsonKey(name: 'user_profiles')  UserProfileModel profile)?  $default,) {final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.active,_that.branchId,_that.creationDate,_that.profile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUserModel extends AppUserModel {
  const _AppUserModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'email') required this.email, @JsonKey(name: 'role') required this.role, @JsonKey(name: 'is_active') required this.active, @JsonKey(name: 'branch_id') this.branchId, @JsonKey(name: 'created_at') required this.creationDate, @JsonKey(name: 'user_profiles') required this.profile}): super._();
  factory _AppUserModel.fromJson(Map<String, dynamic> json) => _$AppUserModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'email') final  String email;
@override@JsonKey(name: 'role') final  UserRole role;
@override@JsonKey(name: 'is_active') final  bool active;
@override@JsonKey(name: 'branch_id') final  String? branchId;
@override@JsonKey(name: 'created_at') final  DateTime creationDate;
@override@JsonKey(name: 'user_profiles') final  UserProfileModel profile;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserModelCopyWith<_AppUserModel> get copyWith => __$AppUserModelCopyWithImpl<_AppUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.active, active) || other.active == active)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,active,branchId,creationDate,profile);

@override
String toString() {
  return 'AppUserModel(id: $id, email: $email, role: $role, active: $active, branchId: $branchId, creationDate: $creationDate, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$AppUserModelCopyWith<$Res> implements $AppUserModelCopyWith<$Res> {
  factory _$AppUserModelCopyWith(_AppUserModel value, $Res Function(_AppUserModel) _then) = __$AppUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'email') String email,@JsonKey(name: 'role') UserRole role,@JsonKey(name: 'is_active') bool active,@JsonKey(name: 'branch_id') String? branchId,@JsonKey(name: 'created_at') DateTime creationDate,@JsonKey(name: 'user_profiles') UserProfileModel profile
});


@override $UserProfileModelCopyWith<$Res> get profile;

}
/// @nodoc
class __$AppUserModelCopyWithImpl<$Res>
    implements _$AppUserModelCopyWith<$Res> {
  __$AppUserModelCopyWithImpl(this._self, this._then);

  final _AppUserModel _self;
  final $Res Function(_AppUserModel) _then;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? active = null,Object? branchId = freezed,Object? creationDate = null,Object? profile = null,}) {
  return _then(_AppUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,branchId: freezed == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfileModel,
  ));
}

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<$Res> get profile {
  
  return $UserProfileModelCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
