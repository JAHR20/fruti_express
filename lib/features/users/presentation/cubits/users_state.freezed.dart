// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersState {

 List<AppUser> get users; bool get isLoading; UsersTab get tab; String? get processingUserId; String? get errorMessage; String get searchQuery;
/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersStateCopyWith<UsersState> get copyWith => _$UsersStateCopyWithImpl<UsersState>(this as UsersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersState&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.processingUserId, processingUserId) || other.processingUserId == processingUserId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),isLoading,tab,processingUserId,errorMessage,searchQuery);

@override
String toString() {
  return 'UsersState(users: $users, isLoading: $isLoading, tab: $tab, processingUserId: $processingUserId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $UsersStateCopyWith<$Res>  {
  factory $UsersStateCopyWith(UsersState value, $Res Function(UsersState) _then) = _$UsersStateCopyWithImpl;
@useResult
$Res call({
 List<AppUser> users, bool isLoading, UsersTab tab, String? processingUserId, String? errorMessage, String searchQuery
});




}
/// @nodoc
class _$UsersStateCopyWithImpl<$Res>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._self, this._then);

  final UsersState _self;
  final $Res Function(UsersState) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? isLoading = null,Object? tab = null,Object? processingUserId = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<AppUser>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as UsersTab,processingUserId: freezed == processingUserId ? _self.processingUserId : processingUserId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersState].
extension UsersStatePatterns on UsersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersState value)  $default,){
final _that = this;
switch (_that) {
case _UsersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersState value)?  $default,){
final _that = this;
switch (_that) {
case _UsersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppUser> users,  bool isLoading,  UsersTab tab,  String? processingUserId,  String? errorMessage,  String searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersState() when $default != null:
return $default(_that.users,_that.isLoading,_that.tab,_that.processingUserId,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppUser> users,  bool isLoading,  UsersTab tab,  String? processingUserId,  String? errorMessage,  String searchQuery)  $default,) {final _that = this;
switch (_that) {
case _UsersState():
return $default(_that.users,_that.isLoading,_that.tab,_that.processingUserId,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppUser> users,  bool isLoading,  UsersTab tab,  String? processingUserId,  String? errorMessage,  String searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _UsersState() when $default != null:
return $default(_that.users,_that.isLoading,_that.tab,_that.processingUserId,_that.errorMessage,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _UsersState implements UsersState {
  const _UsersState({final  List<AppUser> users = const [], this.isLoading = false, this.tab = UsersTab.all, this.processingUserId, this.errorMessage, this.searchQuery = ''}): _users = users;
  

 final  List<AppUser> _users;
@override@JsonKey() List<AppUser> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  UsersTab tab;
@override final  String? processingUserId;
@override final  String? errorMessage;
@override@JsonKey() final  String searchQuery;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersStateCopyWith<_UsersState> get copyWith => __$UsersStateCopyWithImpl<_UsersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersState&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.processingUserId, processingUserId) || other.processingUserId == processingUserId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),isLoading,tab,processingUserId,errorMessage,searchQuery);

@override
String toString() {
  return 'UsersState(users: $users, isLoading: $isLoading, tab: $tab, processingUserId: $processingUserId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$UsersStateCopyWith<$Res> implements $UsersStateCopyWith<$Res> {
  factory _$UsersStateCopyWith(_UsersState value, $Res Function(_UsersState) _then) = __$UsersStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppUser> users, bool isLoading, UsersTab tab, String? processingUserId, String? errorMessage, String searchQuery
});




}
/// @nodoc
class __$UsersStateCopyWithImpl<$Res>
    implements _$UsersStateCopyWith<$Res> {
  __$UsersStateCopyWithImpl(this._self, this._then);

  final _UsersState _self;
  final $Res Function(_UsersState) _then;

/// Create a copy of UsersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? isLoading = null,Object? tab = null,Object? processingUserId = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_UsersState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<AppUser>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as UsersTab,processingUserId: freezed == processingUserId ? _self.processingUserId : processingUserId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
