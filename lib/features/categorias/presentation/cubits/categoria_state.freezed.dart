// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoriaState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriaState()';
}


}

/// @nodoc
class $CategoriaStateCopyWith<$Res>  {
$CategoriaStateCopyWith(CategoriaState _, $Res Function(CategoriaState) __);
}


/// Adds pattern-matching-related methods to [CategoriaState].
extension CategoriaStatePatterns on CategoriaState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CategoriaInitial value)?  initial,TResult Function( CategoriaLoading value)?  loading,TResult Function( CategoriaLoaded value)?  loaded,TResult Function( CategoriaError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CategoriaInitial() when initial != null:
return initial(_that);case CategoriaLoading() when loading != null:
return loading(_that);case CategoriaLoaded() when loaded != null:
return loaded(_that);case CategoriaError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CategoriaInitial value)  initial,required TResult Function( CategoriaLoading value)  loading,required TResult Function( CategoriaLoaded value)  loaded,required TResult Function( CategoriaError value)  error,}){
final _that = this;
switch (_that) {
case CategoriaInitial():
return initial(_that);case CategoriaLoading():
return loading(_that);case CategoriaLoaded():
return loaded(_that);case CategoriaError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CategoriaInitial value)?  initial,TResult? Function( CategoriaLoading value)?  loading,TResult? Function( CategoriaLoaded value)?  loaded,TResult? Function( CategoriaError value)?  error,}){
final _that = this;
switch (_that) {
case CategoriaInitial() when initial != null:
return initial(_that);case CategoriaLoading() when loading != null:
return loading(_that);case CategoriaLoaded() when loaded != null:
return loaded(_that);case CategoriaError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Categoria> categorias)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CategoriaInitial() when initial != null:
return initial();case CategoriaLoading() when loading != null:
return loading();case CategoriaLoaded() when loaded != null:
return loaded(_that.categorias);case CategoriaError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Categoria> categorias)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CategoriaInitial():
return initial();case CategoriaLoading():
return loading();case CategoriaLoaded():
return loaded(_that.categorias);case CategoriaError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Categoria> categorias)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CategoriaInitial() when initial != null:
return initial();case CategoriaLoading() when loading != null:
return loading();case CategoriaLoaded() when loaded != null:
return loaded(_that.categorias);case CategoriaError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CategoriaInitial implements CategoriaState {
  const CategoriaInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriaState.initial()';
}


}




/// @nodoc


class CategoriaLoading implements CategoriaState {
  const CategoriaLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoriaState.loading()';
}


}




/// @nodoc


class CategoriaLoaded implements CategoriaState {
  const CategoriaLoaded(final  List<Categoria> categorias): _categorias = categorias;
  

 final  List<Categoria> _categorias;
 List<Categoria> get categorias {
  if (_categorias is EqualUnmodifiableListView) return _categorias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categorias);
}


/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaLoadedCopyWith<CategoriaLoaded> get copyWith => _$CategoriaLoadedCopyWithImpl<CategoriaLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaLoaded&&const DeepCollectionEquality().equals(other._categorias, _categorias));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categorias));

@override
String toString() {
  return 'CategoriaState.loaded(categorias: $categorias)';
}


}

/// @nodoc
abstract mixin class $CategoriaLoadedCopyWith<$Res> implements $CategoriaStateCopyWith<$Res> {
  factory $CategoriaLoadedCopyWith(CategoriaLoaded value, $Res Function(CategoriaLoaded) _then) = _$CategoriaLoadedCopyWithImpl;
@useResult
$Res call({
 List<Categoria> categorias
});




}
/// @nodoc
class _$CategoriaLoadedCopyWithImpl<$Res>
    implements $CategoriaLoadedCopyWith<$Res> {
  _$CategoriaLoadedCopyWithImpl(this._self, this._then);

  final CategoriaLoaded _self;
  final $Res Function(CategoriaLoaded) _then;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categorias = null,}) {
  return _then(CategoriaLoaded(
null == categorias ? _self._categorias : categorias // ignore: cast_nullable_to_non_nullable
as List<Categoria>,
  ));
}


}

/// @nodoc


class CategoriaError implements CategoriaState {
  const CategoriaError(this.message);
  

 final  String message;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaErrorCopyWith<CategoriaError> get copyWith => _$CategoriaErrorCopyWithImpl<CategoriaError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CategoriaState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CategoriaErrorCopyWith<$Res> implements $CategoriaStateCopyWith<$Res> {
  factory $CategoriaErrorCopyWith(CategoriaError value, $Res Function(CategoriaError) _then) = _$CategoriaErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CategoriaErrorCopyWithImpl<$Res>
    implements $CategoriaErrorCopyWith<$Res> {
  _$CategoriaErrorCopyWithImpl(this._self, this._then);

  final CategoriaError _self;
  final $Res Function(CategoriaError) _then;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CategoriaError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
