// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sucursal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SucursalState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SucursalState()';
}


}

/// @nodoc
class $SucursalStateCopyWith<$Res>  {
$SucursalStateCopyWith(SucursalState _, $Res Function(SucursalState) __);
}


/// Adds pattern-matching-related methods to [SucursalState].
extension SucursalStatePatterns on SucursalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SucursalInitial value)?  initial,TResult Function( SucursalLoading value)?  loading,TResult Function( SucursalLoaded value)?  loaded,TResult Function( SucursalError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SucursalInitial() when initial != null:
return initial(_that);case SucursalLoading() when loading != null:
return loading(_that);case SucursalLoaded() when loaded != null:
return loaded(_that);case SucursalError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SucursalInitial value)  initial,required TResult Function( SucursalLoading value)  loading,required TResult Function( SucursalLoaded value)  loaded,required TResult Function( SucursalError value)  error,}){
final _that = this;
switch (_that) {
case SucursalInitial():
return initial(_that);case SucursalLoading():
return loading(_that);case SucursalLoaded():
return loaded(_that);case SucursalError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SucursalInitial value)?  initial,TResult? Function( SucursalLoading value)?  loading,TResult? Function( SucursalLoaded value)?  loaded,TResult? Function( SucursalError value)?  error,}){
final _that = this;
switch (_that) {
case SucursalInitial() when initial != null:
return initial(_that);case SucursalLoading() when loading != null:
return loading(_that);case SucursalLoaded() when loaded != null:
return loaded(_that);case SucursalError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Sucursal> sucursales)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SucursalInitial() when initial != null:
return initial();case SucursalLoading() when loading != null:
return loading();case SucursalLoaded() when loaded != null:
return loaded(_that.sucursales);case SucursalError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Sucursal> sucursales)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SucursalInitial():
return initial();case SucursalLoading():
return loading();case SucursalLoaded():
return loaded(_that.sucursales);case SucursalError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Sucursal> sucursales)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SucursalInitial() when initial != null:
return initial();case SucursalLoading() when loading != null:
return loading();case SucursalLoaded() when loaded != null:
return loaded(_that.sucursales);case SucursalError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SucursalInitial implements SucursalState {
  const SucursalInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SucursalState.initial()';
}


}




/// @nodoc


class SucursalLoading implements SucursalState {
  const SucursalLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SucursalState.loading()';
}


}




/// @nodoc


class SucursalLoaded implements SucursalState {
  const SucursalLoaded(final  List<Sucursal> sucursales): _sucursales = sucursales;
  

 final  List<Sucursal> _sucursales;
 List<Sucursal> get sucursales {
  if (_sucursales is EqualUnmodifiableListView) return _sucursales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sucursales);
}


/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalLoadedCopyWith<SucursalLoaded> get copyWith => _$SucursalLoadedCopyWithImpl<SucursalLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalLoaded&&const DeepCollectionEquality().equals(other._sucursales, _sucursales));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sucursales));

@override
String toString() {
  return 'SucursalState.loaded(sucursales: $sucursales)';
}


}

/// @nodoc
abstract mixin class $SucursalLoadedCopyWith<$Res> implements $SucursalStateCopyWith<$Res> {
  factory $SucursalLoadedCopyWith(SucursalLoaded value, $Res Function(SucursalLoaded) _then) = _$SucursalLoadedCopyWithImpl;
@useResult
$Res call({
 List<Sucursal> sucursales
});




}
/// @nodoc
class _$SucursalLoadedCopyWithImpl<$Res>
    implements $SucursalLoadedCopyWith<$Res> {
  _$SucursalLoadedCopyWithImpl(this._self, this._then);

  final SucursalLoaded _self;
  final $Res Function(SucursalLoaded) _then;

/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sucursales = null,}) {
  return _then(SucursalLoaded(
null == sucursales ? _self._sucursales : sucursales // ignore: cast_nullable_to_non_nullable
as List<Sucursal>,
  ));
}


}

/// @nodoc


class SucursalError implements SucursalState {
  const SucursalError(this.message);
  

 final  String message;

/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SucursalErrorCopyWith<SucursalError> get copyWith => _$SucursalErrorCopyWithImpl<SucursalError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SucursalError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SucursalState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SucursalErrorCopyWith<$Res> implements $SucursalStateCopyWith<$Res> {
  factory $SucursalErrorCopyWith(SucursalError value, $Res Function(SucursalError) _then) = _$SucursalErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SucursalErrorCopyWithImpl<$Res>
    implements $SucursalErrorCopyWith<$Res> {
  _$SucursalErrorCopyWithImpl(this._self, this._then);

  final SucursalError _self;
  final $Res Function(SucursalError) _then;

/// Create a copy of SucursalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SucursalError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
