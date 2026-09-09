// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {

 List<Category> get categories; bool get isLoading; String? get errorMessage; bool get isSavingOperation; String? get operationError; bool get operationSuccessful; String? get processingCategoryId;
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateCopyWith<CategoryState> get copyWith => _$CategoryStateCopyWithImpl<CategoryState>(this as CategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.processingCategoryId, processingCategoryId) || other.processingCategoryId == processingCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),isLoading,errorMessage,isSavingOperation,operationError,operationSuccessful,processingCategoryId);

@override
String toString() {
  return 'CategoryState(categories: $categories, isLoading: $isLoading, errorMessage: $errorMessage, isSavingOperation: $isSavingOperation, operationError: $operationError, operationSuccessful: $operationSuccessful, processingCategoryId: $processingCategoryId)';
}


}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res>  {
  factory $CategoryStateCopyWith(CategoryState value, $Res Function(CategoryState) _then) = _$CategoryStateCopyWithImpl;
@useResult
$Res call({
 List<Category> categories, bool isLoading, String? errorMessage, bool isSavingOperation, String? operationError, bool operationSuccessful, String? processingCategoryId
});




}
/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSavingOperation = null,Object? operationError = freezed,Object? operationSuccessful = null,Object? processingCategoryId = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,processingCategoryId: freezed == processingCategoryId ? _self.processingCategoryId : processingCategoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Category> categories,  bool isLoading,  String? errorMessage,  bool isSavingOperation,  String? operationError,  bool operationSuccessful,  String? processingCategoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.categories,_that.isLoading,_that.errorMessage,_that.isSavingOperation,_that.operationError,_that.operationSuccessful,_that.processingCategoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Category> categories,  bool isLoading,  String? errorMessage,  bool isSavingOperation,  String? operationError,  bool operationSuccessful,  String? processingCategoryId)  $default,) {final _that = this;
switch (_that) {
case _CategoryState():
return $default(_that.categories,_that.isLoading,_that.errorMessage,_that.isSavingOperation,_that.operationError,_that.operationSuccessful,_that.processingCategoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Category> categories,  bool isLoading,  String? errorMessage,  bool isSavingOperation,  String? operationError,  bool operationSuccessful,  String? processingCategoryId)?  $default,) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.categories,_that.isLoading,_that.errorMessage,_that.isSavingOperation,_that.operationError,_that.operationSuccessful,_that.processingCategoryId);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryState implements CategoryState {
  const _CategoryState({final  List<Category> categories = const <Category>[], this.isLoading = false, this.errorMessage, this.isSavingOperation = false, this.operationError, this.operationSuccessful = false, this.processingCategoryId}): _categories = categories;
  

 final  List<Category> _categories;
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool isSavingOperation;
@override final  String? operationError;
@override@JsonKey() final  bool operationSuccessful;
@override final  String? processingCategoryId;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStateCopyWith<_CategoryState> get copyWith => __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryState&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSavingOperation, isSavingOperation) || other.isSavingOperation == isSavingOperation)&&(identical(other.operationError, operationError) || other.operationError == operationError)&&(identical(other.operationSuccessful, operationSuccessful) || other.operationSuccessful == operationSuccessful)&&(identical(other.processingCategoryId, processingCategoryId) || other.processingCategoryId == processingCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),isLoading,errorMessage,isSavingOperation,operationError,operationSuccessful,processingCategoryId);

@override
String toString() {
  return 'CategoryState(categories: $categories, isLoading: $isLoading, errorMessage: $errorMessage, isSavingOperation: $isSavingOperation, operationError: $operationError, operationSuccessful: $operationSuccessful, processingCategoryId: $processingCategoryId)';
}


}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(_CategoryState value, $Res Function(_CategoryState) _then) = __$CategoryStateCopyWithImpl;
@override @useResult
$Res call({
 List<Category> categories, bool isLoading, String? errorMessage, bool isSavingOperation, String? operationError, bool operationSuccessful, String? processingCategoryId
});




}
/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isSavingOperation = null,Object? operationError = freezed,Object? operationSuccessful = null,Object? processingCategoryId = freezed,}) {
  return _then(_CategoryState(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSavingOperation: null == isSavingOperation ? _self.isSavingOperation : isSavingOperation // ignore: cast_nullable_to_non_nullable
as bool,operationError: freezed == operationError ? _self.operationError : operationError // ignore: cast_nullable_to_non_nullable
as String?,operationSuccessful: null == operationSuccessful ? _self.operationSuccessful : operationSuccessful // ignore: cast_nullable_to_non_nullable
as bool,processingCategoryId: freezed == processingCategoryId ? _self.processingCategoryId : processingCategoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
