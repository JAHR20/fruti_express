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

 List<Categoria> get categorias; bool get isLoading; String? get errorMessage;// 🌟 Para crear/editar/cambiar estado — no tumba la lista completa
 bool get guardandoOperacion; String? get operacionError; bool get operacionExitosa;// 🌟 Para saber qué categoría específica se está procesando
 String? get categoriaProcesandoId;
/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoriaStateCopyWith<CategoriaState> get copyWith => _$CategoriaStateCopyWithImpl<CategoriaState>(this as CategoriaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoriaState&&const DeepCollectionEquality().equals(other.categorias, categorias)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardandoOperacion, guardandoOperacion) || other.guardandoOperacion == guardandoOperacion)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.categoriaProcesandoId, categoriaProcesandoId) || other.categoriaProcesandoId == categoriaProcesandoId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categorias),isLoading,errorMessage,guardandoOperacion,operacionError,operacionExitosa,categoriaProcesandoId);

@override
String toString() {
  return 'CategoriaState(categorias: $categorias, isLoading: $isLoading, errorMessage: $errorMessage, guardandoOperacion: $guardandoOperacion, operacionError: $operacionError, operacionExitosa: $operacionExitosa, categoriaProcesandoId: $categoriaProcesandoId)';
}


}

/// @nodoc
abstract mixin class $CategoriaStateCopyWith<$Res>  {
  factory $CategoriaStateCopyWith(CategoriaState value, $Res Function(CategoriaState) _then) = _$CategoriaStateCopyWithImpl;
@useResult
$Res call({
 List<Categoria> categorias, bool isLoading, String? errorMessage, bool guardandoOperacion, String? operacionError, bool operacionExitosa, String? categoriaProcesandoId
});




}
/// @nodoc
class _$CategoriaStateCopyWithImpl<$Res>
    implements $CategoriaStateCopyWith<$Res> {
  _$CategoriaStateCopyWithImpl(this._self, this._then);

  final CategoriaState _self;
  final $Res Function(CategoriaState) _then;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categorias = null,Object? isLoading = null,Object? errorMessage = freezed,Object? guardandoOperacion = null,Object? operacionError = freezed,Object? operacionExitosa = null,Object? categoriaProcesandoId = freezed,}) {
  return _then(_self.copyWith(
categorias: null == categorias ? _self.categorias : categorias // ignore: cast_nullable_to_non_nullable
as List<Categoria>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardandoOperacion: null == guardandoOperacion ? _self.guardandoOperacion : guardandoOperacion // ignore: cast_nullable_to_non_nullable
as bool,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,categoriaProcesandoId: freezed == categoriaProcesandoId ? _self.categoriaProcesandoId : categoriaProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoriaState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoriaState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoriaState value)  $default,){
final _that = this;
switch (_that) {
case _CategoriaState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoriaState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoriaState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Categoria> categorias,  bool isLoading,  String? errorMessage,  bool guardandoOperacion,  String? operacionError,  bool operacionExitosa,  String? categoriaProcesandoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoriaState() when $default != null:
return $default(_that.categorias,_that.isLoading,_that.errorMessage,_that.guardandoOperacion,_that.operacionError,_that.operacionExitosa,_that.categoriaProcesandoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Categoria> categorias,  bool isLoading,  String? errorMessage,  bool guardandoOperacion,  String? operacionError,  bool operacionExitosa,  String? categoriaProcesandoId)  $default,) {final _that = this;
switch (_that) {
case _CategoriaState():
return $default(_that.categorias,_that.isLoading,_that.errorMessage,_that.guardandoOperacion,_that.operacionError,_that.operacionExitosa,_that.categoriaProcesandoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Categoria> categorias,  bool isLoading,  String? errorMessage,  bool guardandoOperacion,  String? operacionError,  bool operacionExitosa,  String? categoriaProcesandoId)?  $default,) {final _that = this;
switch (_that) {
case _CategoriaState() when $default != null:
return $default(_that.categorias,_that.isLoading,_that.errorMessage,_that.guardandoOperacion,_that.operacionError,_that.operacionExitosa,_that.categoriaProcesandoId);case _:
  return null;

}
}

}

/// @nodoc


class _CategoriaState implements CategoriaState {
  const _CategoriaState({final  List<Categoria> categorias = const <Categoria>[], this.isLoading = false, this.errorMessage, this.guardandoOperacion = false, this.operacionError, this.operacionExitosa = false, this.categoriaProcesandoId}): _categorias = categorias;
  

 final  List<Categoria> _categorias;
@override@JsonKey() List<Categoria> get categorias {
  if (_categorias is EqualUnmodifiableListView) return _categorias;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categorias);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
// 🌟 Para crear/editar/cambiar estado — no tumba la lista completa
@override@JsonKey() final  bool guardandoOperacion;
@override final  String? operacionError;
@override@JsonKey() final  bool operacionExitosa;
// 🌟 Para saber qué categoría específica se está procesando
@override final  String? categoriaProcesandoId;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoriaStateCopyWith<_CategoriaState> get copyWith => __$CategoriaStateCopyWithImpl<_CategoriaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoriaState&&const DeepCollectionEquality().equals(other._categorias, _categorias)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardandoOperacion, guardandoOperacion) || other.guardandoOperacion == guardandoOperacion)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa)&&(identical(other.categoriaProcesandoId, categoriaProcesandoId) || other.categoriaProcesandoId == categoriaProcesandoId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categorias),isLoading,errorMessage,guardandoOperacion,operacionError,operacionExitosa,categoriaProcesandoId);

@override
String toString() {
  return 'CategoriaState(categorias: $categorias, isLoading: $isLoading, errorMessage: $errorMessage, guardandoOperacion: $guardandoOperacion, operacionError: $operacionError, operacionExitosa: $operacionExitosa, categoriaProcesandoId: $categoriaProcesandoId)';
}


}

/// @nodoc
abstract mixin class _$CategoriaStateCopyWith<$Res> implements $CategoriaStateCopyWith<$Res> {
  factory _$CategoriaStateCopyWith(_CategoriaState value, $Res Function(_CategoriaState) _then) = __$CategoriaStateCopyWithImpl;
@override @useResult
$Res call({
 List<Categoria> categorias, bool isLoading, String? errorMessage, bool guardandoOperacion, String? operacionError, bool operacionExitosa, String? categoriaProcesandoId
});




}
/// @nodoc
class __$CategoriaStateCopyWithImpl<$Res>
    implements _$CategoriaStateCopyWith<$Res> {
  __$CategoriaStateCopyWithImpl(this._self, this._then);

  final _CategoriaState _self;
  final $Res Function(_CategoriaState) _then;

/// Create a copy of CategoriaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categorias = null,Object? isLoading = null,Object? errorMessage = freezed,Object? guardandoOperacion = null,Object? operacionError = freezed,Object? operacionExitosa = null,Object? categoriaProcesandoId = freezed,}) {
  return _then(_CategoriaState(
categorias: null == categorias ? _self._categorias : categorias // ignore: cast_nullable_to_non_nullable
as List<Categoria>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardandoOperacion: null == guardandoOperacion ? _self.guardandoOperacion : guardandoOperacion // ignore: cast_nullable_to_non_nullable
as bool,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,categoriaProcesandoId: freezed == categoriaProcesandoId ? _self.categoriaProcesandoId : categoriaProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
