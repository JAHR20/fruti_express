// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BannerState {

// ============================================================
// DATOS
// ============================================================
 List<Banner> get banners;// ============================================================
// CARGA
// ============================================================
 bool get isLoading;// Banner que está siendo modificado actualmente.
 String? get bannerProcesandoId;// ============================================================
// ERRORES
// ============================================================
 String? get errorMessage; String? get operacionError;// ============================================================
// RESULTADO DE OPERACIÓN
// ============================================================
 bool get operacionExitosa;
/// Create a copy of BannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerStateCopyWith<BannerState> get copyWith => _$BannerStateCopyWithImpl<BannerState>(this as BannerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerState&&const DeepCollectionEquality().equals(other.banners, banners)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.bannerProcesandoId, bannerProcesandoId) || other.bannerProcesandoId == bannerProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(banners),isLoading,bannerProcesandoId,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'BannerState(banners: $banners, isLoading: $isLoading, bannerProcesandoId: $bannerProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class $BannerStateCopyWith<$Res>  {
  factory $BannerStateCopyWith(BannerState value, $Res Function(BannerState) _then) = _$BannerStateCopyWithImpl;
@useResult
$Res call({
 List<Banner> banners, bool isLoading, String? bannerProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa
});




}
/// @nodoc
class _$BannerStateCopyWithImpl<$Res>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._self, this._then);

  final BannerState _self;
  final $Res Function(BannerState) _then;

/// Create a copy of BannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banners = null,Object? isLoading = null,Object? bannerProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_self.copyWith(
banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<Banner>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,bannerProcesandoId: freezed == bannerProcesandoId ? _self.bannerProcesandoId : bannerProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerState].
extension BannerStatePatterns on BannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerState value)  $default,){
final _that = this;
switch (_that) {
case _BannerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerState value)?  $default,){
final _that = this;
switch (_that) {
case _BannerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Banner> banners,  bool isLoading,  String? bannerProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerState() when $default != null:
return $default(_that.banners,_that.isLoading,_that.bannerProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Banner> banners,  bool isLoading,  String? bannerProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)  $default,) {final _that = this;
switch (_that) {
case _BannerState():
return $default(_that.banners,_that.isLoading,_that.bannerProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Banner> banners,  bool isLoading,  String? bannerProcesandoId,  String? errorMessage,  String? operacionError,  bool operacionExitosa)?  $default,) {final _that = this;
switch (_that) {
case _BannerState() when $default != null:
return $default(_that.banners,_that.isLoading,_that.bannerProcesandoId,_that.errorMessage,_that.operacionError,_that.operacionExitosa);case _:
  return null;

}
}

}

/// @nodoc


class _BannerState extends BannerState {
  const _BannerState({final  List<Banner> banners = const <Banner>[], this.isLoading = false, this.bannerProcesandoId, this.errorMessage, this.operacionError, this.operacionExitosa = false}): _banners = banners,super._();
  

// ============================================================
// DATOS
// ============================================================
 final  List<Banner> _banners;
// ============================================================
// DATOS
// ============================================================
@override@JsonKey() List<Banner> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

// ============================================================
// CARGA
// ============================================================
@override@JsonKey() final  bool isLoading;
// Banner que está siendo modificado actualmente.
@override final  String? bannerProcesandoId;
// ============================================================
// ERRORES
// ============================================================
@override final  String? errorMessage;
@override final  String? operacionError;
// ============================================================
// RESULTADO DE OPERACIÓN
// ============================================================
@override@JsonKey() final  bool operacionExitosa;

/// Create a copy of BannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerStateCopyWith<_BannerState> get copyWith => __$BannerStateCopyWithImpl<_BannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerState&&const DeepCollectionEquality().equals(other._banners, _banners)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.bannerProcesandoId, bannerProcesandoId) || other.bannerProcesandoId == bannerProcesandoId)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.operacionError, operacionError) || other.operacionError == operacionError)&&(identical(other.operacionExitosa, operacionExitosa) || other.operacionExitosa == operacionExitosa));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_banners),isLoading,bannerProcesandoId,errorMessage,operacionError,operacionExitosa);

@override
String toString() {
  return 'BannerState(banners: $banners, isLoading: $isLoading, bannerProcesandoId: $bannerProcesandoId, errorMessage: $errorMessage, operacionError: $operacionError, operacionExitosa: $operacionExitosa)';
}


}

/// @nodoc
abstract mixin class _$BannerStateCopyWith<$Res> implements $BannerStateCopyWith<$Res> {
  factory _$BannerStateCopyWith(_BannerState value, $Res Function(_BannerState) _then) = __$BannerStateCopyWithImpl;
@override @useResult
$Res call({
 List<Banner> banners, bool isLoading, String? bannerProcesandoId, String? errorMessage, String? operacionError, bool operacionExitosa
});




}
/// @nodoc
class __$BannerStateCopyWithImpl<$Res>
    implements _$BannerStateCopyWith<$Res> {
  __$BannerStateCopyWithImpl(this._self, this._then);

  final _BannerState _self;
  final $Res Function(_BannerState) _then;

/// Create a copy of BannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banners = null,Object? isLoading = null,Object? bannerProcesandoId = freezed,Object? errorMessage = freezed,Object? operacionError = freezed,Object? operacionExitosa = null,}) {
  return _then(_BannerState(
banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<Banner>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,bannerProcesandoId: freezed == bannerProcesandoId ? _self.bannerProcesandoId : bannerProcesandoId // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,operacionError: freezed == operacionError ? _self.operacionError : operacionError // ignore: cast_nullable_to_non_nullable
as String?,operacionExitosa: null == operacionExitosa ? _self.operacionExitosa : operacionExitosa // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
