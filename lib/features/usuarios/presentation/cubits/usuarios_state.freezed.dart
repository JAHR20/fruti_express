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

 List<Perfil> get usuarios; bool get isLoading; UsuariosTab get tab; String? get usuarioProcesandoId; String? get errorMessage; String get searchQuery;
/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsuariosStateCopyWith<UsuariosState> get copyWith => _$UsuariosStateCopyWithImpl<UsuariosState>(this as UsuariosState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsuariosState&&const DeepCollectionEquality().equals(other.usuarios, usuarios)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.usuarioProcesandoId, usuarioProcesandoId) || other.usuarioProcesandoId == usuarioProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(usuarios),isLoading,tab,usuarioProcesandoId,errorMessage,searchQuery);

@override
String toString() {
  return 'UsuariosState(usuarios: $usuarios, isLoading: $isLoading, tab: $tab, usuarioProcesandoId: $usuarioProcesandoId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $UsuariosStateCopyWith<$Res>  {
  factory $UsuariosStateCopyWith(UsuariosState value, $Res Function(UsuariosState) _then) = _$UsuariosStateCopyWithImpl;
@useResult
$Res call({
 List<Perfil> usuarios, bool isLoading, UsuariosTab tab, String? usuarioProcesandoId, String? errorMessage, String searchQuery
});




}
/// @nodoc
class _$UsuariosStateCopyWithImpl<$Res>
    implements $UsuariosStateCopyWith<$Res> {
  _$UsuariosStateCopyWithImpl(this._self, this._then);

  final UsuariosState _self;
  final $Res Function(UsuariosState) _then;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usuarios = null,Object? isLoading = null,Object? tab = null,Object? usuarioProcesandoId = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
usuarios: null == usuarios ? _self.usuarios : usuarios // ignore: cast_nullable_to_non_nullable
as List<Perfil>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as UsuariosTab,usuarioProcesandoId: freezed == usuarioProcesandoId ? _self.usuarioProcesandoId : usuarioProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsuariosState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsuariosState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsuariosState value)  $default,){
final _that = this;
switch (_that) {
case _UsuariosState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsuariosState value)?  $default,){
final _that = this;
switch (_that) {
case _UsuariosState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Perfil> usuarios,  bool isLoading,  UsuariosTab tab,  String? usuarioProcesandoId,  String? errorMessage,  String searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsuariosState() when $default != null:
return $default(_that.usuarios,_that.isLoading,_that.tab,_that.usuarioProcesandoId,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Perfil> usuarios,  bool isLoading,  UsuariosTab tab,  String? usuarioProcesandoId,  String? errorMessage,  String searchQuery)  $default,) {final _that = this;
switch (_that) {
case _UsuariosState():
return $default(_that.usuarios,_that.isLoading,_that.tab,_that.usuarioProcesandoId,_that.errorMessage,_that.searchQuery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Perfil> usuarios,  bool isLoading,  UsuariosTab tab,  String? usuarioProcesandoId,  String? errorMessage,  String searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _UsuariosState() when $default != null:
return $default(_that.usuarios,_that.isLoading,_that.tab,_that.usuarioProcesandoId,_that.errorMessage,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _UsuariosState implements UsuariosState {
  const _UsuariosState({final  List<Perfil> usuarios = const [], this.isLoading = false, this.tab = UsuariosTab.todos, this.usuarioProcesandoId, this.errorMessage, this.searchQuery = ''}): _usuarios = usuarios;
  

 final  List<Perfil> _usuarios;
@override@JsonKey() List<Perfil> get usuarios {
  if (_usuarios is EqualUnmodifiableListView) return _usuarios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_usuarios);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  UsuariosTab tab;
@override final  String? usuarioProcesandoId;
@override final  String? errorMessage;
@override@JsonKey() final  String searchQuery;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsuariosStateCopyWith<_UsuariosState> get copyWith => __$UsuariosStateCopyWithImpl<_UsuariosState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsuariosState&&const DeepCollectionEquality().equals(other._usuarios, _usuarios)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.usuarioProcesandoId, usuarioProcesandoId) || other.usuarioProcesandoId == usuarioProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_usuarios),isLoading,tab,usuarioProcesandoId,errorMessage,searchQuery);

@override
String toString() {
  return 'UsuariosState(usuarios: $usuarios, isLoading: $isLoading, tab: $tab, usuarioProcesandoId: $usuarioProcesandoId, errorMessage: $errorMessage, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$UsuariosStateCopyWith<$Res> implements $UsuariosStateCopyWith<$Res> {
  factory _$UsuariosStateCopyWith(_UsuariosState value, $Res Function(_UsuariosState) _then) = __$UsuariosStateCopyWithImpl;
@override @useResult
$Res call({
 List<Perfil> usuarios, bool isLoading, UsuariosTab tab, String? usuarioProcesandoId, String? errorMessage, String searchQuery
});




}
/// @nodoc
class __$UsuariosStateCopyWithImpl<$Res>
    implements _$UsuariosStateCopyWith<$Res> {
  __$UsuariosStateCopyWithImpl(this._self, this._then);

  final _UsuariosState _self;
  final $Res Function(_UsuariosState) _then;

/// Create a copy of UsuariosState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usuarios = null,Object? isLoading = null,Object? tab = null,Object? usuarioProcesandoId = freezed,Object? errorMessage = freezed,Object? searchQuery = null,}) {
  return _then(_UsuariosState(
usuarios: null == usuarios ? _self._usuarios : usuarios // ignore: cast_nullable_to_non_nullable
as List<Perfil>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as UsuariosTab,usuarioProcesandoId: freezed == usuarioProcesandoId ? _self.usuarioProcesandoId : usuarioProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
