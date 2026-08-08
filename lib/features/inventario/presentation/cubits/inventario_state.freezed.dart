// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventario_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventarioState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventarioState()';
}


}

/// @nodoc
class $InventarioStateCopyWith<$Res>  {
$InventarioStateCopyWith(InventarioState _, $Res Function(InventarioState) __);
}


/// Adds pattern-matching-related methods to [InventarioState].
extension InventarioStatePatterns on InventarioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InventarioInitial value)?  initial,TResult Function( InventarioLoading value)?  loading,TResult Function( InventarioLoaded value)?  loaded,TResult Function( InventarioError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InventarioInitial() when initial != null:
return initial(_that);case InventarioLoading() when loading != null:
return loading(_that);case InventarioLoaded() when loaded != null:
return loaded(_that);case InventarioError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InventarioInitial value)  initial,required TResult Function( InventarioLoading value)  loading,required TResult Function( InventarioLoaded value)  loaded,required TResult Function( InventarioError value)  error,}){
final _that = this;
switch (_that) {
case InventarioInitial():
return initial(_that);case InventarioLoading():
return loading(_that);case InventarioLoaded():
return loaded(_that);case InventarioError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InventarioInitial value)?  initial,TResult? Function( InventarioLoading value)?  loading,TResult? Function( InventarioLoaded value)?  loaded,TResult? Function( InventarioError value)?  error,}){
final _that = this;
switch (_that) {
case InventarioInitial() when initial != null:
return initial(_that);case InventarioLoading() when loading != null:
return loading(_that);case InventarioLoaded() when loaded != null:
return loaded(_that);case InventarioError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Inventario> inventario,  String? actualizandoProductoId)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InventarioInitial() when initial != null:
return initial();case InventarioLoading() when loading != null:
return loading();case InventarioLoaded() when loaded != null:
return loaded(_that.inventario,_that.actualizandoProductoId);case InventarioError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Inventario> inventario,  String? actualizandoProductoId)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case InventarioInitial():
return initial();case InventarioLoading():
return loading();case InventarioLoaded():
return loaded(_that.inventario,_that.actualizandoProductoId);case InventarioError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Inventario> inventario,  String? actualizandoProductoId)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case InventarioInitial() when initial != null:
return initial();case InventarioLoading() when loading != null:
return loading();case InventarioLoaded() when loaded != null:
return loaded(_that.inventario,_that.actualizandoProductoId);case InventarioError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InventarioInitial implements InventarioState {
  const InventarioInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventarioState.initial()';
}


}




/// @nodoc


class InventarioLoading implements InventarioState {
  const InventarioLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventarioState.loading()';
}


}




/// @nodoc


class InventarioLoaded implements InventarioState {
  const InventarioLoaded(final  List<Inventario> inventario, {this.actualizandoProductoId}): _inventario = inventario;
  

 final  List<Inventario> _inventario;
 List<Inventario> get inventario {
  if (_inventario is EqualUnmodifiableListView) return _inventario;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inventario);
}

 final  String? actualizandoProductoId;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioLoadedCopyWith<InventarioLoaded> get copyWith => _$InventarioLoadedCopyWithImpl<InventarioLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioLoaded&&const DeepCollectionEquality().equals(other._inventario, _inventario)&&(identical(other.actualizandoProductoId, actualizandoProductoId) || other.actualizandoProductoId == actualizandoProductoId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inventario),actualizandoProductoId);

@override
String toString() {
  return 'InventarioState.loaded(inventario: $inventario, actualizandoProductoId: $actualizandoProductoId)';
}


}

/// @nodoc
abstract mixin class $InventarioLoadedCopyWith<$Res> implements $InventarioStateCopyWith<$Res> {
  factory $InventarioLoadedCopyWith(InventarioLoaded value, $Res Function(InventarioLoaded) _then) = _$InventarioLoadedCopyWithImpl;
@useResult
$Res call({
 List<Inventario> inventario, String? actualizandoProductoId
});




}
/// @nodoc
class _$InventarioLoadedCopyWithImpl<$Res>
    implements $InventarioLoadedCopyWith<$Res> {
  _$InventarioLoadedCopyWithImpl(this._self, this._then);

  final InventarioLoaded _self;
  final $Res Function(InventarioLoaded) _then;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inventario = null,Object? actualizandoProductoId = freezed,}) {
  return _then(InventarioLoaded(
null == inventario ? _self._inventario : inventario // ignore: cast_nullable_to_non_nullable
as List<Inventario>,actualizandoProductoId: freezed == actualizandoProductoId ? _self.actualizandoProductoId : actualizandoProductoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class InventarioError implements InventarioState {
  const InventarioError(this.message);
  

 final  String message;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventarioErrorCopyWith<InventarioError> get copyWith => _$InventarioErrorCopyWithImpl<InventarioError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventarioError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'InventarioState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $InventarioErrorCopyWith<$Res> implements $InventarioStateCopyWith<$Res> {
  factory $InventarioErrorCopyWith(InventarioError value, $Res Function(InventarioError) _then) = _$InventarioErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InventarioErrorCopyWithImpl<$Res>
    implements $InventarioErrorCopyWith<$Res> {
  _$InventarioErrorCopyWithImpl(this._self, this._then);

  final InventarioError _self;
  final $Res Function(InventarioError) _then;

/// Create a copy of InventarioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InventarioError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
