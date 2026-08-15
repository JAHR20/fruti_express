// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editar_perfil_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditarPerfilState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarPerfilState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditarPerfilState()';
}


}

/// @nodoc
class $EditarPerfilStateCopyWith<$Res>  {
$EditarPerfilStateCopyWith(EditarPerfilState _, $Res Function(EditarPerfilState) __);
}


/// Adds pattern-matching-related methods to [EditarPerfilState].
extension EditarPerfilStatePatterns on EditarPerfilState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditarPerfilInitial value)?  initial,TResult Function( EditarPerfilSaving value)?  saving,TResult Function( EditarPerfilSuccess value)?  success,TResult Function( EditarPerfilError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditarPerfilInitial() when initial != null:
return initial(_that);case EditarPerfilSaving() when saving != null:
return saving(_that);case EditarPerfilSuccess() when success != null:
return success(_that);case EditarPerfilError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditarPerfilInitial value)  initial,required TResult Function( EditarPerfilSaving value)  saving,required TResult Function( EditarPerfilSuccess value)  success,required TResult Function( EditarPerfilError value)  error,}){
final _that = this;
switch (_that) {
case EditarPerfilInitial():
return initial(_that);case EditarPerfilSaving():
return saving(_that);case EditarPerfilSuccess():
return success(_that);case EditarPerfilError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditarPerfilInitial value)?  initial,TResult? Function( EditarPerfilSaving value)?  saving,TResult? Function( EditarPerfilSuccess value)?  success,TResult? Function( EditarPerfilError value)?  error,}){
final _that = this;
switch (_that) {
case EditarPerfilInitial() when initial != null:
return initial(_that);case EditarPerfilSaving() when saving != null:
return saving(_that);case EditarPerfilSuccess() when success != null:
return success(_that);case EditarPerfilError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  saving,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditarPerfilInitial() when initial != null:
return initial();case EditarPerfilSaving() when saving != null:
return saving();case EditarPerfilSuccess() when success != null:
return success();case EditarPerfilError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  saving,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case EditarPerfilInitial():
return initial();case EditarPerfilSaving():
return saving();case EditarPerfilSuccess():
return success();case EditarPerfilError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  saving,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case EditarPerfilInitial() when initial != null:
return initial();case EditarPerfilSaving() when saving != null:
return saving();case EditarPerfilSuccess() when success != null:
return success();case EditarPerfilError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class EditarPerfilInitial implements EditarPerfilState {
  const EditarPerfilInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarPerfilInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditarPerfilState.initial()';
}


}




/// @nodoc


class EditarPerfilSaving implements EditarPerfilState {
  const EditarPerfilSaving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarPerfilSaving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditarPerfilState.saving()';
}


}




/// @nodoc


class EditarPerfilSuccess implements EditarPerfilState {
  const EditarPerfilSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarPerfilSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditarPerfilState.success()';
}


}




/// @nodoc


class EditarPerfilError implements EditarPerfilState {
  const EditarPerfilError(this.message);
  

 final  String message;

/// Create a copy of EditarPerfilState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditarPerfilErrorCopyWith<EditarPerfilError> get copyWith => _$EditarPerfilErrorCopyWithImpl<EditarPerfilError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarPerfilError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'EditarPerfilState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $EditarPerfilErrorCopyWith<$Res> implements $EditarPerfilStateCopyWith<$Res> {
  factory $EditarPerfilErrorCopyWith(EditarPerfilError value, $Res Function(EditarPerfilError) _then) = _$EditarPerfilErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$EditarPerfilErrorCopyWithImpl<$Res>
    implements $EditarPerfilErrorCopyWith<$Res> {
  _$EditarPerfilErrorCopyWithImpl(this._self, this._then);

  final EditarPerfilError _self;
  final $Res Function(EditarPerfilError) _then;

/// Create a copy of EditarPerfilState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(EditarPerfilError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
