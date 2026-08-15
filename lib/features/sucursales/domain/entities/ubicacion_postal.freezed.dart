// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ubicacion_postal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UbicacionPostal {

 String get codigoPostal; String get estado; String get municipio; List<String> get codigosPostalesDisponibles; Map<String, List<String>> get coloniasPorCodigoPostal;
/// Create a copy of UbicacionPostal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UbicacionPostalCopyWith<UbicacionPostal> get copyWith => _$UbicacionPostalCopyWithImpl<UbicacionPostal>(this as UbicacionPostal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UbicacionPostal&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&const DeepCollectionEquality().equals(other.codigosPostalesDisponibles, codigosPostalesDisponibles)&&const DeepCollectionEquality().equals(other.coloniasPorCodigoPostal, coloniasPorCodigoPostal));
}


@override
int get hashCode => Object.hash(runtimeType,codigoPostal,estado,municipio,const DeepCollectionEquality().hash(codigosPostalesDisponibles),const DeepCollectionEquality().hash(coloniasPorCodigoPostal));

@override
String toString() {
  return 'UbicacionPostal(codigoPostal: $codigoPostal, estado: $estado, municipio: $municipio, codigosPostalesDisponibles: $codigosPostalesDisponibles, coloniasPorCodigoPostal: $coloniasPorCodigoPostal)';
}


}

/// @nodoc
abstract mixin class $UbicacionPostalCopyWith<$Res>  {
  factory $UbicacionPostalCopyWith(UbicacionPostal value, $Res Function(UbicacionPostal) _then) = _$UbicacionPostalCopyWithImpl;
@useResult
$Res call({
 String codigoPostal, String estado, String municipio, List<String> codigosPostalesDisponibles, Map<String, List<String>> coloniasPorCodigoPostal
});




}
/// @nodoc
class _$UbicacionPostalCopyWithImpl<$Res>
    implements $UbicacionPostalCopyWith<$Res> {
  _$UbicacionPostalCopyWithImpl(this._self, this._then);

  final UbicacionPostal _self;
  final $Res Function(UbicacionPostal) _then;

/// Create a copy of UbicacionPostal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codigoPostal = null,Object? estado = null,Object? municipio = null,Object? codigosPostalesDisponibles = null,Object? coloniasPorCodigoPostal = null,}) {
  return _then(_self.copyWith(
codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,codigosPostalesDisponibles: null == codigosPostalesDisponibles ? _self.codigosPostalesDisponibles : codigosPostalesDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCodigoPostal: null == coloniasPorCodigoPostal ? _self.coloniasPorCodigoPostal : coloniasPorCodigoPostal // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [UbicacionPostal].
extension UbicacionPostalPatterns on UbicacionPostal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UbicacionPostal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UbicacionPostal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UbicacionPostal value)  $default,){
final _that = this;
switch (_that) {
case _UbicacionPostal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UbicacionPostal value)?  $default,){
final _that = this;
switch (_that) {
case _UbicacionPostal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codigoPostal,  String estado,  String municipio,  List<String> codigosPostalesDisponibles,  Map<String, List<String>> coloniasPorCodigoPostal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UbicacionPostal() when $default != null:
return $default(_that.codigoPostal,_that.estado,_that.municipio,_that.codigosPostalesDisponibles,_that.coloniasPorCodigoPostal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codigoPostal,  String estado,  String municipio,  List<String> codigosPostalesDisponibles,  Map<String, List<String>> coloniasPorCodigoPostal)  $default,) {final _that = this;
switch (_that) {
case _UbicacionPostal():
return $default(_that.codigoPostal,_that.estado,_that.municipio,_that.codigosPostalesDisponibles,_that.coloniasPorCodigoPostal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codigoPostal,  String estado,  String municipio,  List<String> codigosPostalesDisponibles,  Map<String, List<String>> coloniasPorCodigoPostal)?  $default,) {final _that = this;
switch (_that) {
case _UbicacionPostal() when $default != null:
return $default(_that.codigoPostal,_that.estado,_that.municipio,_that.codigosPostalesDisponibles,_that.coloniasPorCodigoPostal);case _:
  return null;

}
}

}

/// @nodoc


class _UbicacionPostal implements UbicacionPostal {
  const _UbicacionPostal({required this.codigoPostal, required this.estado, required this.municipio, final  List<String> codigosPostalesDisponibles = const [], final  Map<String, List<String>> coloniasPorCodigoPostal = const {}}): _codigosPostalesDisponibles = codigosPostalesDisponibles,_coloniasPorCodigoPostal = coloniasPorCodigoPostal;
  

@override final  String codigoPostal;
@override final  String estado;
@override final  String municipio;
 final  List<String> _codigosPostalesDisponibles;
@override@JsonKey() List<String> get codigosPostalesDisponibles {
  if (_codigosPostalesDisponibles is EqualUnmodifiableListView) return _codigosPostalesDisponibles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codigosPostalesDisponibles);
}

 final  Map<String, List<String>> _coloniasPorCodigoPostal;
@override@JsonKey() Map<String, List<String>> get coloniasPorCodigoPostal {
  if (_coloniasPorCodigoPostal is EqualUnmodifiableMapView) return _coloniasPorCodigoPostal;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coloniasPorCodigoPostal);
}


/// Create a copy of UbicacionPostal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UbicacionPostalCopyWith<_UbicacionPostal> get copyWith => __$UbicacionPostalCopyWithImpl<_UbicacionPostal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UbicacionPostal&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&const DeepCollectionEquality().equals(other._codigosPostalesDisponibles, _codigosPostalesDisponibles)&&const DeepCollectionEquality().equals(other._coloniasPorCodigoPostal, _coloniasPorCodigoPostal));
}


@override
int get hashCode => Object.hash(runtimeType,codigoPostal,estado,municipio,const DeepCollectionEquality().hash(_codigosPostalesDisponibles),const DeepCollectionEquality().hash(_coloniasPorCodigoPostal));

@override
String toString() {
  return 'UbicacionPostal(codigoPostal: $codigoPostal, estado: $estado, municipio: $municipio, codigosPostalesDisponibles: $codigosPostalesDisponibles, coloniasPorCodigoPostal: $coloniasPorCodigoPostal)';
}


}

/// @nodoc
abstract mixin class _$UbicacionPostalCopyWith<$Res> implements $UbicacionPostalCopyWith<$Res> {
  factory _$UbicacionPostalCopyWith(_UbicacionPostal value, $Res Function(_UbicacionPostal) _then) = __$UbicacionPostalCopyWithImpl;
@override @useResult
$Res call({
 String codigoPostal, String estado, String municipio, List<String> codigosPostalesDisponibles, Map<String, List<String>> coloniasPorCodigoPostal
});




}
/// @nodoc
class __$UbicacionPostalCopyWithImpl<$Res>
    implements _$UbicacionPostalCopyWith<$Res> {
  __$UbicacionPostalCopyWithImpl(this._self, this._then);

  final _UbicacionPostal _self;
  final $Res Function(_UbicacionPostal) _then;

/// Create a copy of UbicacionPostal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codigoPostal = null,Object? estado = null,Object? municipio = null,Object? codigosPostalesDisponibles = null,Object? coloniasPorCodigoPostal = null,}) {
  return _then(_UbicacionPostal(
codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,codigosPostalesDisponibles: null == codigosPostalesDisponibles ? _self._codigosPostalesDisponibles : codigosPostalesDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCodigoPostal: null == coloniasPorCodigoPostal ? _self._coloniasPorCodigoPostal : coloniasPorCodigoPostal // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
