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

 FailureCode get code;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'Failure(code: $code)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 FailureCode code
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ValidationFailure value)?  validation,TResult Function( UnauthorizedFailure value)?  unauthorized,TResult Function( BadRequestFailure value)?  badRequest,TResult Function( AlreadyExistsFailure value)?  alreadyExists,TResult Function( ServerFailure value)?  server,TResult Function( _NotFound value)?  notFound,TResult Function( InsufficientStockFailure value)?  insufficientStock,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ValidationFailure() when validation != null:
return validation(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case BadRequestFailure() when badRequest != null:
return badRequest(_that);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that);case ServerFailure() when server != null:
return server(_that);case _NotFound() when notFound != null:
return notFound(_that);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ValidationFailure value)  validation,required TResult Function( UnauthorizedFailure value)  unauthorized,required TResult Function( BadRequestFailure value)  badRequest,required TResult Function( AlreadyExistsFailure value)  alreadyExists,required TResult Function( ServerFailure value)  server,required TResult Function( _NotFound value)  notFound,required TResult Function( InsufficientStockFailure value)  insufficientStock,}){
final _that = this;
switch (_that) {
case ValidationFailure():
return validation(_that);case UnauthorizedFailure():
return unauthorized(_that);case BadRequestFailure():
return badRequest(_that);case AlreadyExistsFailure():
return alreadyExists(_that);case ServerFailure():
return server(_that);case _NotFound():
return notFound(_that);case InsufficientStockFailure():
return insufficientStock(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ValidationFailure value)?  validation,TResult? Function( UnauthorizedFailure value)?  unauthorized,TResult? Function( BadRequestFailure value)?  badRequest,TResult? Function( AlreadyExistsFailure value)?  alreadyExists,TResult? Function( ServerFailure value)?  server,TResult? Function( _NotFound value)?  notFound,TResult? Function( InsufficientStockFailure value)?  insufficientStock,}){
final _that = this;
switch (_that) {
case ValidationFailure() when validation != null:
return validation(_that);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that);case BadRequestFailure() when badRequest != null:
return badRequest(_that);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that);case ServerFailure() when server != null:
return server(_that);case _NotFound() when notFound != null:
return notFound(_that);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FailureCode code,  Map<String, dynamic>? params)?  validation,TResult Function( FailureCode code,  Map<String, dynamic>? params)?  unauthorized,TResult Function( FailureCode code,  Map<String, dynamic>? params)?  badRequest,TResult Function( FailureCode code,  Map<String, dynamic>? params)?  alreadyExists,TResult Function( FailureCode code,  Map<String, dynamic>? params)?  server,TResult Function( FailureCode code)?  notFound,TResult Function( FailureCode code,  Map<String, dynamic>? params)?  insufficientStock,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ValidationFailure() when validation != null:
return validation(_that.code,_that.params);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.code,_that.params);case BadRequestFailure() when badRequest != null:
return badRequest(_that.code,_that.params);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that.code,_that.params);case ServerFailure() when server != null:
return server(_that.code,_that.params);case _NotFound() when notFound != null:
return notFound(_that.code);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that.code,_that.params);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FailureCode code,  Map<String, dynamic>? params)  validation,required TResult Function( FailureCode code,  Map<String, dynamic>? params)  unauthorized,required TResult Function( FailureCode code,  Map<String, dynamic>? params)  badRequest,required TResult Function( FailureCode code,  Map<String, dynamic>? params)  alreadyExists,required TResult Function( FailureCode code,  Map<String, dynamic>? params)  server,required TResult Function( FailureCode code)  notFound,required TResult Function( FailureCode code,  Map<String, dynamic>? params)  insufficientStock,}) {final _that = this;
switch (_that) {
case ValidationFailure():
return validation(_that.code,_that.params);case UnauthorizedFailure():
return unauthorized(_that.code,_that.params);case BadRequestFailure():
return badRequest(_that.code,_that.params);case AlreadyExistsFailure():
return alreadyExists(_that.code,_that.params);case ServerFailure():
return server(_that.code,_that.params);case _NotFound():
return notFound(_that.code);case InsufficientStockFailure():
return insufficientStock(_that.code,_that.params);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  validation,TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  unauthorized,TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  badRequest,TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  alreadyExists,TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  server,TResult? Function( FailureCode code)?  notFound,TResult? Function( FailureCode code,  Map<String, dynamic>? params)?  insufficientStock,}) {final _that = this;
switch (_that) {
case ValidationFailure() when validation != null:
return validation(_that.code,_that.params);case UnauthorizedFailure() when unauthorized != null:
return unauthorized(_that.code,_that.params);case BadRequestFailure() when badRequest != null:
return badRequest(_that.code,_that.params);case AlreadyExistsFailure() when alreadyExists != null:
return alreadyExists(_that.code,_that.params);case ServerFailure() when server != null:
return server(_that.code,_that.params);case _NotFound() when notFound != null:
return notFound(_that.code);case InsufficientStockFailure() when insufficientStock != null:
return insufficientStock(_that.code,_that.params);case _:
  return null;

}
}

}

/// @nodoc


class ValidationFailure implements Failure {
  const ValidationFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationFailureCopyWith<ValidationFailure> get copyWith => _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.validation(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(ValidationFailure value, $Res Function(ValidationFailure) _then) = _$ValidationFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(ValidationFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class UnauthorizedFailure implements Failure {
  const UnauthorizedFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnauthorizedFailureCopyWith<UnauthorizedFailure> get copyWith => _$UnauthorizedFailureCopyWithImpl<UnauthorizedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnauthorizedFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.unauthorized(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $UnauthorizedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnauthorizedFailureCopyWith(UnauthorizedFailure value, $Res Function(UnauthorizedFailure) _then) = _$UnauthorizedFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(UnauthorizedFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class BadRequestFailure implements Failure {
  const BadRequestFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BadRequestFailureCopyWith<BadRequestFailure> get copyWith => _$BadRequestFailureCopyWithImpl<BadRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BadRequestFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.badRequest(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $BadRequestFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $BadRequestFailureCopyWith(BadRequestFailure value, $Res Function(BadRequestFailure) _then) = _$BadRequestFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
});




}
/// @nodoc
class _$BadRequestFailureCopyWithImpl<$Res>
    implements $BadRequestFailureCopyWith<$Res> {
  _$BadRequestFailureCopyWithImpl(this._self, this._then);

  final BadRequestFailure _self;
  final $Res Function(BadRequestFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(BadRequestFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class AlreadyExistsFailure implements Failure {
  const AlreadyExistsFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlreadyExistsFailureCopyWith<AlreadyExistsFailure> get copyWith => _$AlreadyExistsFailureCopyWithImpl<AlreadyExistsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlreadyExistsFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.alreadyExists(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $AlreadyExistsFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AlreadyExistsFailureCopyWith(AlreadyExistsFailure value, $Res Function(AlreadyExistsFailure) _then) = _$AlreadyExistsFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(AlreadyExistsFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.server(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(ServerFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class _NotFound implements Failure {
  const _NotFound(this.code);
  

@override final  FailureCode code;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundCopyWith<_NotFound> get copyWith => __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,code);

@override
String toString() {
  return 'Failure.notFound(code: $code)';
}


}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) = __$NotFoundCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code
});




}
/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,}) {
  return _then(_NotFound(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,
  ));
}


}

/// @nodoc


class InsufficientStockFailure implements Failure {
  const InsufficientStockFailure(this.code, {final  Map<String, dynamic>? params}): _params = params;
  

@override final  FailureCode code;
 final  Map<String, dynamic>? _params;
 Map<String, dynamic>? get params {
  final value = _params;
  if (value == null) return null;
  if (_params is EqualUnmodifiableMapView) return _params;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsufficientStockFailureCopyWith<InsufficientStockFailure> get copyWith => _$InsufficientStockFailureCopyWithImpl<InsufficientStockFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsufficientStockFailure&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._params, _params));
}


@override
int get hashCode => Object.hash(runtimeType,code,const DeepCollectionEquality().hash(_params));

@override
String toString() {
  return 'Failure.insufficientStock(code: $code, params: $params)';
}


}

/// @nodoc
abstract mixin class $InsufficientStockFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InsufficientStockFailureCopyWith(InsufficientStockFailure value, $Res Function(InsufficientStockFailure) _then) = _$InsufficientStockFailureCopyWithImpl;
@override @useResult
$Res call({
 FailureCode code, Map<String, dynamic>? params
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? params = freezed,}) {
  return _then(InsufficientStockFailure(
null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as FailureCode,params: freezed == params ? _self._params : params // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
