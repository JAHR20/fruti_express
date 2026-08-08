// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerFailure value)?  server,TResult Function( NetworkFailure value)?  network,TResult Function( CacheFailure value)?  cache,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( NotFoundFailure value)?  notFound,TResult Function( AlreadyExistsFailure value)?  alreadyExists,TResult Function( InsufficientStockFailure value)?  insufficientStock,TResult Function( InvalidStateFailure value)?  invalidState,TResult Function( ValidationFailure value)?  validation,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that);case NetworkFailure() when network != null:
return network(_that);case CacheFailure() when cache != null:
return cache(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that);case InvalidStateFailure() when invalidState != null:
return invalidState(_that);case ValidationFailure() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerFailure value)  server,required TResult Function( NetworkFailure value)  network,required TResult Function( CacheFailure value)  cache,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( NotFoundFailure value)  notFound,required TResult Function( AlreadyExistsFailure value)  alreadyExists,required TResult Function( InsufficientStockFailure value)  insufficientStock,required TResult Function( InvalidStateFailure value)  invalidState,required TResult Function( ValidationFailure value)  validation,}){
final _that = this;
switch (_that) {
case ServerFailure():
return server(_that);case NetworkFailure():
return network(_that);case CacheFailure():
return cache(_that);case UnauthorizedFailure():
return unauthorized(_that);case NotFoundFailure():
return notFound(_that);case AlreadyExistsFailure():
return alreadyExists(_that);case InsufficientStockFailure():
return insufficientStock(_that);case InvalidStateFailure():
return invalidState(_that);case ValidationFailure():
return validation(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerFailure value)?  server,TResult? Function( NetworkFailure value)?  network,TResult? Function( CacheFailure value)?  cache,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( NotFoundFailure value)?  notFound,TResult? Function( AlreadyExistsFailure value)?  alreadyExists,TResult? Function( InsufficientStockFailure value)?  insufficientStock,TResult? Function( InvalidStateFailure value)?  invalidState,TResult? Function( ValidationFailure value)?  validation,}){
final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that);case NetworkFailure() when network != null:
return network(_that);case CacheFailure() when cache != null:
return cache(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case NotFoundFailure() when notFound != null:
return notFound(_that);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that);case InvalidStateFailure() when invalidState != null:
return invalidState(_that);case ValidationFailure() when validation != null:
return validation(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  server,TResult Function()?  network,TResult Function()?  cache,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String message)?  alreadyExists,TResult Function( String message)?  insufficientStock,TResult Function( String message)?  invalidState,TResult Function( String message)?  validation,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that.message);case NetworkFailure() when network != null:
return network();case CacheFailure() when cache != null:
return cache();case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case NotFoundFailure() when notFound != null:
return notFound(_that.message);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that.message);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that.message);case InvalidStateFailure() when invalidState != null:
return invalidState(_that.message);case ValidationFailure() when validation != null:
return validation(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  server,required TResult Function()  network,required TResult Function()  cache,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String message)  alreadyExists,required TResult Function( String message)  insufficientStock,required TResult Function( String message)  invalidState,required TResult Function( String message)  validation,}) {final _that = this;
switch (_that) {
case ServerFailure():
return server(_that.message);case NetworkFailure():
return network();case CacheFailure():
return cache();case UnauthorizedFailure():
return unauthorized(_that.message);case NotFoundFailure():
return notFound(_that.message);case AlreadyExistsFailure():
return alreadyExists(_that.message);case InsufficientStockFailure():
return insufficientStock(_that.message);case InvalidStateFailure():
return invalidState(_that.message);case ValidationFailure():
return validation(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  server,TResult? Function()?  network,TResult? Function()?  cache,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String message)?  alreadyExists,TResult? Function( String message)?  insufficientStock,TResult? Function( String message)?  invalidState,TResult? Function( String message)?  validation,}) {final _that = this;
switch (_that) {
case ServerFailure() when server != null:
return server(_that.message);case NetworkFailure() when network != null:
return network();case CacheFailure() when cache != null:
return cache();case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.message);case NotFoundFailure() when notFound != null:
return notFound(_that.message);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that.message);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that.message);case InvalidStateFailure() when invalidState != null:
return invalidState(_that.message);case ValidationFailure() when validation != null:
return validation(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerFailure extends Failure {
  const ServerFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkFailure extends Failure {
  const NetworkFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.network()';
}


}




/// @nodoc


class CacheFailure extends Failure {
  const CacheFailure(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cache()';
}


}




/// @nodoc


class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnauthorizedFailureCopyWithImpl<$Res>
    implements $UnauthorizedFailureCopyWith<$Res> {
  _$UnauthorizedFailureCopyWithImpl(this._self, this._then);

  final UnauthorizedFailure _self;
  final $Res Function(UnauthorizedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnauthorizedFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotFoundFailure extends Failure {
  const NotFoundFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotFoundFailureCopyWith<NotFoundFailure> get copyWith => _$NotFoundFailureCopyWithImpl<NotFoundFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotFoundFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotFoundFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $NotFoundFailureCopyWith(NotFoundFailure value, $Res Function(NotFoundFailure) _then) = _$NotFoundFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotFoundFailureCopyWithImpl<$Res>
    implements $NotFoundFailureCopyWith<$Res> {
  _$NotFoundFailureCopyWithImpl(this._self, this._then);

  final NotFoundFailure _self;
  final $Res Function(NotFoundFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotFoundFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AlreadyExistsFailure extends Failure {
  const AlreadyExistsFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlreadyExistsFailureCopyWith<AlreadyExistsFailure> get copyWith => _$AlreadyExistsFailureCopyWithImpl<AlreadyExistsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlreadyExistsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.alreadyExists(message: $message)';
}


}

/// @nodoc
abstract mixin class $AlreadyExistsFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AlreadyExistsFailureCopyWith(AlreadyExistsFailure value, $Res Function(AlreadyExistsFailure) _then) = _$AlreadyExistsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AlreadyExistsFailureCopyWithImpl<$Res>
    implements $AlreadyExistsFailureCopyWith<$Res> {
  _$AlreadyExistsFailureCopyWithImpl(this._self, this._then);

  final AlreadyExistsFailure _self;
  final $Res Function(AlreadyExistsFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AlreadyExistsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InsufficientStockFailure extends Failure {
  const InsufficientStockFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsufficientStockFailureCopyWith<InsufficientStockFailure> get copyWith => _$InsufficientStockFailureCopyWithImpl<InsufficientStockFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsufficientStockFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.insufficientStock(message: $message)';
}


}

/// @nodoc
abstract mixin class $InsufficientStockFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InsufficientStockFailureCopyWith(InsufficientStockFailure value, $Res Function(InsufficientStockFailure) _then) = _$InsufficientStockFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InsufficientStockFailureCopyWithImpl<$Res>
    implements $InsufficientStockFailureCopyWith<$Res> {
  _$InsufficientStockFailureCopyWithImpl(this._self, this._then);

  final InsufficientStockFailure _self;
  final $Res Function(InsufficientStockFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InsufficientStockFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidStateFailure extends Failure {
  const InvalidStateFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidStateFailureCopyWith<InvalidStateFailure> get copyWith => _$InvalidStateFailureCopyWithImpl<InvalidStateFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidStateFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.invalidState(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidStateFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InvalidStateFailureCopyWith(InvalidStateFailure value, $Res Function(InvalidStateFailure) _then) = _$InvalidStateFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$InvalidStateFailureCopyWithImpl<$Res>
    implements $InvalidStateFailureCopyWith<$Res> {
  _$InvalidStateFailureCopyWithImpl(this._self, this._then);

  final InvalidStateFailure _self;
  final $Res Function(InvalidStateFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(InvalidStateFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ValidationFailure extends Failure {
  const ValidationFailure(this.message): super._();
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.validation(message: $message)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ValidationFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
