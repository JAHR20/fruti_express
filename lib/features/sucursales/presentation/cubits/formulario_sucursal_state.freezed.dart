// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formulario_sucursal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FormularioSucursalState {

// ─── Estados de carga y error ───
 bool get buscandoUbicacion; bool get guardando; String? get errorMessage; bool get guardadoExitoso;// ─── Datos de autocompletado (Postali) ───
 String? get sucursalIdCreada; String? get colonia; String? get estado; String? get municipio; double? get latitud; double? get longitud;// ─── Listas de Cobertura ───
 List<String> get codigosDisponibles; List<String> get codigosSeleccionados; Map<String, List<String>> get coloniasPorCp;
/// Create a copy of FormularioSucursalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormularioSucursalStateCopyWith<FormularioSucursalState> get copyWith => _$FormularioSucursalStateCopyWithImpl<FormularioSucursalState>(this as FormularioSucursalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormularioSucursalState&&(identical(other.buscandoUbicacion, buscandoUbicacion) || other.buscandoUbicacion == buscandoUbicacion)&&(identical(other.guardando, guardando) || other.guardando == guardando)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardadoExitoso, guardadoExitoso) || other.guardadoExitoso == guardadoExitoso)&&(identical(other.sucursalIdCreada, sucursalIdCreada) || other.sucursalIdCreada == sucursalIdCreada)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&const DeepCollectionEquality().equals(other.codigosDisponibles, codigosDisponibles)&&const DeepCollectionEquality().equals(other.codigosSeleccionados, codigosSeleccionados)&&const DeepCollectionEquality().equals(other.coloniasPorCp, coloniasPorCp));
}


@override
int get hashCode => Object.hash(runtimeType,buscandoUbicacion,guardando,errorMessage,guardadoExitoso,sucursalIdCreada,colonia,estado,municipio,latitud,longitud,const DeepCollectionEquality().hash(codigosDisponibles),const DeepCollectionEquality().hash(codigosSeleccionados),const DeepCollectionEquality().hash(coloniasPorCp));

@override
String toString() {
  return 'FormularioSucursalState(buscandoUbicacion: $buscandoUbicacion, guardando: $guardando, errorMessage: $errorMessage, guardadoExitoso: $guardadoExitoso, sucursalIdCreada: $sucursalIdCreada, colonia: $colonia, estado: $estado, municipio: $municipio, latitud: $latitud, longitud: $longitud, codigosDisponibles: $codigosDisponibles, codigosSeleccionados: $codigosSeleccionados, coloniasPorCp: $coloniasPorCp)';
}


}

/// @nodoc
abstract mixin class $FormularioSucursalStateCopyWith<$Res>  {
  factory $FormularioSucursalStateCopyWith(FormularioSucursalState value, $Res Function(FormularioSucursalState) _then) = _$FormularioSucursalStateCopyWithImpl;
@useResult
$Res call({
 bool buscandoUbicacion, bool guardando, String? errorMessage, bool guardadoExitoso, String? sucursalIdCreada, String? colonia, String? estado, String? municipio, double? latitud, double? longitud, List<String> codigosDisponibles, List<String> codigosSeleccionados, Map<String, List<String>> coloniasPorCp
});




}
/// @nodoc
class _$FormularioSucursalStateCopyWithImpl<$Res>
    implements $FormularioSucursalStateCopyWith<$Res> {
  _$FormularioSucursalStateCopyWithImpl(this._self, this._then);

  final FormularioSucursalState _self;
  final $Res Function(FormularioSucursalState) _then;

/// Create a copy of FormularioSucursalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buscandoUbicacion = null,Object? guardando = null,Object? errorMessage = freezed,Object? guardadoExitoso = null,Object? sucursalIdCreada = freezed,Object? colonia = freezed,Object? estado = freezed,Object? municipio = freezed,Object? latitud = freezed,Object? longitud = freezed,Object? codigosDisponibles = null,Object? codigosSeleccionados = null,Object? coloniasPorCp = null,}) {
  return _then(_self.copyWith(
buscandoUbicacion: null == buscandoUbicacion ? _self.buscandoUbicacion : buscandoUbicacion // ignore: cast_nullable_to_non_nullable
as bool,guardando: null == guardando ? _self.guardando : guardando // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardadoExitoso: null == guardadoExitoso ? _self.guardadoExitoso : guardadoExitoso // ignore: cast_nullable_to_non_nullable
as bool,sucursalIdCreada: freezed == sucursalIdCreada ? _self.sucursalIdCreada : sucursalIdCreada // ignore: cast_nullable_to_non_nullable
as String?,colonia: freezed == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,municipio: freezed == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String?,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,codigosDisponibles: null == codigosDisponibles ? _self.codigosDisponibles : codigosDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,codigosSeleccionados: null == codigosSeleccionados ? _self.codigosSeleccionados : codigosSeleccionados // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCp: null == coloniasPorCp ? _self.coloniasPorCp : coloniasPorCp // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormularioSucursalState].
extension FormularioSucursalStatePatterns on FormularioSucursalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormularioSucursalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormularioSucursalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormularioSucursalState value)  $default,){
final _that = this;
switch (_that) {
case _FormularioSucursalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormularioSucursalState value)?  $default,){
final _that = this;
switch (_that) {
case _FormularioSucursalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool buscandoUbicacion,  bool guardando,  String? errorMessage,  bool guardadoExitoso,  String? sucursalIdCreada,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormularioSucursalState() when $default != null:
return $default(_that.buscandoUbicacion,_that.guardando,_that.errorMessage,_that.guardadoExitoso,_that.sucursalIdCreada,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool buscandoUbicacion,  bool guardando,  String? errorMessage,  bool guardadoExitoso,  String? sucursalIdCreada,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp)  $default,) {final _that = this;
switch (_that) {
case _FormularioSucursalState():
return $default(_that.buscandoUbicacion,_that.guardando,_that.errorMessage,_that.guardadoExitoso,_that.sucursalIdCreada,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool buscandoUbicacion,  bool guardando,  String? errorMessage,  bool guardadoExitoso,  String? sucursalIdCreada,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp)?  $default,) {final _that = this;
switch (_that) {
case _FormularioSucursalState() when $default != null:
return $default(_that.buscandoUbicacion,_that.guardando,_that.errorMessage,_that.guardadoExitoso,_that.sucursalIdCreada,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp);case _:
  return null;

}
}

}

/// @nodoc


class _FormularioSucursalState implements FormularioSucursalState {
  const _FormularioSucursalState({this.buscandoUbicacion = false, this.guardando = false, this.errorMessage, this.guardadoExitoso = false, this.sucursalIdCreada, this.colonia, this.estado, this.municipio, this.latitud, this.longitud, final  List<String> codigosDisponibles = const <String>[], final  List<String> codigosSeleccionados = const <String>[], final  Map<String, List<String>> coloniasPorCp = const <String, List<String>>{}}): _codigosDisponibles = codigosDisponibles,_codigosSeleccionados = codigosSeleccionados,_coloniasPorCp = coloniasPorCp;
  

// ─── Estados de carga y error ───
@override@JsonKey() final  bool buscandoUbicacion;
@override@JsonKey() final  bool guardando;
@override final  String? errorMessage;
@override@JsonKey() final  bool guardadoExitoso;
// ─── Datos de autocompletado (Postali) ───
@override final  String? sucursalIdCreada;
@override final  String? colonia;
@override final  String? estado;
@override final  String? municipio;
@override final  double? latitud;
@override final  double? longitud;
// ─── Listas de Cobertura ───
 final  List<String> _codigosDisponibles;
// ─── Listas de Cobertura ───
@override@JsonKey() List<String> get codigosDisponibles {
  if (_codigosDisponibles is EqualUnmodifiableListView) return _codigosDisponibles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codigosDisponibles);
}

 final  List<String> _codigosSeleccionados;
@override@JsonKey() List<String> get codigosSeleccionados {
  if (_codigosSeleccionados is EqualUnmodifiableListView) return _codigosSeleccionados;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codigosSeleccionados);
}

 final  Map<String, List<String>> _coloniasPorCp;
@override@JsonKey() Map<String, List<String>> get coloniasPorCp {
  if (_coloniasPorCp is EqualUnmodifiableMapView) return _coloniasPorCp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coloniasPorCp);
}


/// Create a copy of FormularioSucursalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormularioSucursalStateCopyWith<_FormularioSucursalState> get copyWith => __$FormularioSucursalStateCopyWithImpl<_FormularioSucursalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormularioSucursalState&&(identical(other.buscandoUbicacion, buscandoUbicacion) || other.buscandoUbicacion == buscandoUbicacion)&&(identical(other.guardando, guardando) || other.guardando == guardando)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardadoExitoso, guardadoExitoso) || other.guardadoExitoso == guardadoExitoso)&&(identical(other.sucursalIdCreada, sucursalIdCreada) || other.sucursalIdCreada == sucursalIdCreada)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&const DeepCollectionEquality().equals(other._codigosDisponibles, _codigosDisponibles)&&const DeepCollectionEquality().equals(other._codigosSeleccionados, _codigosSeleccionados)&&const DeepCollectionEquality().equals(other._coloniasPorCp, _coloniasPorCp));
}


@override
int get hashCode => Object.hash(runtimeType,buscandoUbicacion,guardando,errorMessage,guardadoExitoso,sucursalIdCreada,colonia,estado,municipio,latitud,longitud,const DeepCollectionEquality().hash(_codigosDisponibles),const DeepCollectionEquality().hash(_codigosSeleccionados),const DeepCollectionEquality().hash(_coloniasPorCp));

@override
String toString() {
  return 'FormularioSucursalState(buscandoUbicacion: $buscandoUbicacion, guardando: $guardando, errorMessage: $errorMessage, guardadoExitoso: $guardadoExitoso, sucursalIdCreada: $sucursalIdCreada, colonia: $colonia, estado: $estado, municipio: $municipio, latitud: $latitud, longitud: $longitud, codigosDisponibles: $codigosDisponibles, codigosSeleccionados: $codigosSeleccionados, coloniasPorCp: $coloniasPorCp)';
}


}

/// @nodoc
abstract mixin class _$FormularioSucursalStateCopyWith<$Res> implements $FormularioSucursalStateCopyWith<$Res> {
  factory _$FormularioSucursalStateCopyWith(_FormularioSucursalState value, $Res Function(_FormularioSucursalState) _then) = __$FormularioSucursalStateCopyWithImpl;
@override @useResult
$Res call({
 bool buscandoUbicacion, bool guardando, String? errorMessage, bool guardadoExitoso, String? sucursalIdCreada, String? colonia, String? estado, String? municipio, double? latitud, double? longitud, List<String> codigosDisponibles, List<String> codigosSeleccionados, Map<String, List<String>> coloniasPorCp
});




}
/// @nodoc
class __$FormularioSucursalStateCopyWithImpl<$Res>
    implements _$FormularioSucursalStateCopyWith<$Res> {
  __$FormularioSucursalStateCopyWithImpl(this._self, this._then);

  final _FormularioSucursalState _self;
  final $Res Function(_FormularioSucursalState) _then;

/// Create a copy of FormularioSucursalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buscandoUbicacion = null,Object? guardando = null,Object? errorMessage = freezed,Object? guardadoExitoso = null,Object? sucursalIdCreada = freezed,Object? colonia = freezed,Object? estado = freezed,Object? municipio = freezed,Object? latitud = freezed,Object? longitud = freezed,Object? codigosDisponibles = null,Object? codigosSeleccionados = null,Object? coloniasPorCp = null,}) {
  return _then(_FormularioSucursalState(
buscandoUbicacion: null == buscandoUbicacion ? _self.buscandoUbicacion : buscandoUbicacion // ignore: cast_nullable_to_non_nullable
as bool,guardando: null == guardando ? _self.guardando : guardando // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardadoExitoso: null == guardadoExitoso ? _self.guardadoExitoso : guardadoExitoso // ignore: cast_nullable_to_non_nullable
as bool,sucursalIdCreada: freezed == sucursalIdCreada ? _self.sucursalIdCreada : sucursalIdCreada // ignore: cast_nullable_to_non_nullable
as String?,colonia: freezed == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,municipio: freezed == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String?,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,codigosDisponibles: null == codigosDisponibles ? _self._codigosDisponibles : codigosDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,codigosSeleccionados: null == codigosSeleccionados ? _self._codigosSeleccionados : codigosSeleccionados // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCp: null == coloniasPorCp ? _self._coloniasPorCp : coloniasPorCp // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
