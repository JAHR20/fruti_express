// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuarios_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsuariosState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsuariosState()';
}


}

/// @nodoc
class $UsuariosStateCopyWith<$Res>  {
$UsuariosStateCopyWith(UsuariosState _, $Res Function(UsuariosState) __);
}


/// Adds pattern-matching-related methods to [UsuariosState].
extension UsuariosStatePatterns on UsuariosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UsuariosInitial value)?  initial,TResult Function( UsuariosLoading value)?  loading,TResult Function( UsuariosLoaded value)?  loaded,TResult Function( UsuariosError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UsuariosInitial() when initial != null:
return initial(_that);case UsuariosLoading() when loading != null:
return loading(_that);case UsuariosLoaded() when loaded != null:
return loaded(_that);case UsuariosError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UsuariosInitial value)  initial,required TResult Function( UsuariosLoading value)  loading,required TResult Function( UsuariosLoaded value)  loaded,required TResult Function( UsuariosError value)  error,}){
final _that = this;
switch (_that) {
case UsuariosInitial():
return initial(_that);case UsuariosLoading():
return loading(_that);case UsuariosLoaded():
return loaded(_that);case UsuariosError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UsuariosInitial value)?  initial,TResult? Function( UsuariosLoading value)?  loading,TResult? Function( UsuariosLoaded value)?  loaded,TResult? Function( UsuariosError value)?  error,}){
final _that = this;
switch (_that) {
case UsuariosInitial() when initial != null:
return initial(_that);case UsuariosLoading() when loading != null:
return loading(_that);case UsuariosLoaded() when loaded != null:
return loaded(_that);case UsuariosError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Perfil> usuarios)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UsuariosInitial() when initial != null:
return initial();case UsuariosLoading() when loading != null:
return loading();case UsuariosLoaded() when loaded != null:
return loaded(_that.usuarios);case UsuariosError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Perfil> usuarios)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case UsuariosInitial():
return initial();case UsuariosLoading():
return loading();case UsuariosLoaded():
return loaded(_that.usuarios);case UsuariosError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Perfil> usuarios)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case UsuariosInitial() when initial != null:
return initial();case UsuariosLoading() when loading != null:
return loading();case UsuariosLoaded() when loaded != null:
return loaded(_that.usuarios);case UsuariosError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class UsuariosInitial implements UsuariosState {
  const UsuariosInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsuariosState.initial()';
}


}




/// @nodoc


class UsuariosLoading implements UsuariosState {
  const UsuariosLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UsuariosState.loading()';
}


}




/// @nodoc


class UsuariosLoaded implements UsuariosState {
  const UsuariosLoaded(final  List<Perfil> usuarios): _usuarios = usuarios;
  

 final  List<Perfil> _usuarios;
 List<Perfil> get usuarios {
  if (_usuarios is EqualUnmodifiableListView) return _usuarios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usuarios);
}


/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsuariosLoadedCopyWith<UsuariosLoaded> get copyWith => _$UsuariosLoadedCopyWithImpl<UsuariosLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosLoaded&&const DeepCollectionEquality().equals(other._usuarios, _usuarios));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_usuarios));

@override
String toString() {
  return 'UsuariosState.loaded(usuarios: $usuarios)';
}


}

/// @nodoc
abstract mixin class $UsuariosLoadedCopyWith<$Res> implements $UsuariosStateCopyWith<$Res> {
  factory $UsuariosLoadedCopyWith(UsuariosLoaded value, $Res Function(UsuariosLoaded) _then) = _$UsuariosLoadedCopyWithImpl;
@useResult
$Res call({
 List<Perfil> usuarios
});




}
/// @nodoc
class _$UsuariosLoadedCopyWithImpl<$Res>
    implements $UsuariosLoadedCopyWith<$Res> {
  _$UsuariosLoadedCopyWithImpl(this._self, this._then);

  final UsuariosLoaded _self;
  final $Res Function(UsuariosLoaded) _then;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usuarios = null,}) {
  return _then(UsuariosLoaded(
null == usuarios ? _self._usuarios : usuarios // ignore: cast_nullable_to_non_nullable
as List<Perfil>,
  ));
}


}

/// @nodoc


class UsuariosError implements UsuariosState {
  const UsuariosError(this.message);
  

 final  String message;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsuariosErrorCopyWith<UsuariosError> get copyWith => _$UsuariosErrorCopyWithImpl<UsuariosError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'UsuariosState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $UsuariosErrorCopyWith<$Res> implements $UsuariosStateCopyWith<$Res> {
  factory $UsuariosErrorCopyWith(UsuariosError value, $Res Function(UsuariosError) _then) = _$UsuariosErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UsuariosErrorCopyWithImpl<$Res>
    implements $UsuariosErrorCopyWith<$Res> {
  _$UsuariosErrorCopyWithImpl(this._self, this._then);

  final UsuariosError _self;
  final $Res Function(UsuariosError) _then;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UsuariosError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
