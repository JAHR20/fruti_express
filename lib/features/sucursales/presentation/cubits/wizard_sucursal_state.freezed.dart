// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard_sucursal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WizardSucursalState {

// 📍 Control del Wizard
 int get pasoActual;// ─── Datos Temporales del Formulario (Paso 1) ───
 String get nombre; String get calle; String get numeroExterior; String get codigoPostal; String? get colonia; String? get estado; String? get municipio; double? get latitud; double? get longitud;// ─── Datos Temporales de Cobertura (Paso 2) ───
 List<String> get codigosDisponibles; List<String> get codigosSeleccionados; Map<String, List<String>> get coloniasPorCp;// ─── Entidad del Dominio de Envíos (Paso 2) ───
// Usamos la entidad completa para no desarmarla en variables sueltas
 ConfiguracionEnvio? get configuracionEnvio;// ─── Banderas de proceso y resultados ───
 bool get buscandoUbicacion; bool get guardando; bool get cargandoConfiguracion; String? get errorMessage; bool get guardadoExitoso;// True cuando finaliza TODO el wizard
 bool get paso1Completado;// True para avanzar al mapa
 String? get sucursalIdCreada;
/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WizardSucursalStateCopyWith<WizardSucursalState> get copyWith => _$WizardSucursalStateCopyWithImpl<WizardSucursalState>(this as WizardSucursalState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WizardSucursalState&&(identical(other.pasoActual, pasoActual) || other.pasoActual == pasoActual)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numeroExterior, numeroExterior) || other.numeroExterior == numeroExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&const DeepCollectionEquality().equals(other.codigosDisponibles, codigosDisponibles)&&const DeepCollectionEquality().equals(other.codigosSeleccionados, codigosSeleccionados)&&const DeepCollectionEquality().equals(other.coloniasPorCp, coloniasPorCp)&&(identical(other.configuracionEnvio, configuracionEnvio) || other.configuracionEnvio == configuracionEnvio)&&(identical(other.buscandoUbicacion, buscandoUbicacion) || other.buscandoUbicacion == buscandoUbicacion)&&(identical(other.guardando, guardando) || other.guardando == guardando)&&(identical(other.cargandoConfiguracion, cargandoConfiguracion) || other.cargandoConfiguracion == cargandoConfiguracion)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardadoExitoso, guardadoExitoso) || other.guardadoExitoso == guardadoExitoso)&&(identical(other.paso1Completado, paso1Completado) || other.paso1Completado == paso1Completado)&&(identical(other.sucursalIdCreada, sucursalIdCreada) || other.sucursalIdCreada == sucursalIdCreada));
}


@override
int get hashCode => Object.hashAll([runtimeType,pasoActual,nombre,calle,numeroExterior,codigoPostal,colonia,estado,municipio,latitud,longitud,const DeepCollectionEquality().hash(codigosDisponibles),const DeepCollectionEquality().hash(codigosSeleccionados),const DeepCollectionEquality().hash(coloniasPorCp),configuracionEnvio,buscandoUbicacion,guardando,cargandoConfiguracion,errorMessage,guardadoExitoso,paso1Completado,sucursalIdCreada]);

@override
String toString() {
  return 'WizardSucursalState(pasoActual: $pasoActual, nombre: $nombre, calle: $calle, numeroExterior: $numeroExterior, codigoPostal: $codigoPostal, colonia: $colonia, estado: $estado, municipio: $municipio, latitud: $latitud, longitud: $longitud, codigosDisponibles: $codigosDisponibles, codigosSeleccionados: $codigosSeleccionados, coloniasPorCp: $coloniasPorCp, configuracionEnvio: $configuracionEnvio, buscandoUbicacion: $buscandoUbicacion, guardando: $guardando, cargandoConfiguracion: $cargandoConfiguracion, errorMessage: $errorMessage, guardadoExitoso: $guardadoExitoso, paso1Completado: $paso1Completado, sucursalIdCreada: $sucursalIdCreada)';
}


}

/// @nodoc
abstract mixin class $WizardSucursalStateCopyWith<$Res>  {
  factory $WizardSucursalStateCopyWith(WizardSucursalState value, $Res Function(WizardSucursalState) _then) = _$WizardSucursalStateCopyWithImpl;
@useResult
$Res call({
 int pasoActual, String nombre, String calle, String numeroExterior, String codigoPostal, String? colonia, String? estado, String? municipio, double? latitud, double? longitud, List<String> codigosDisponibles, List<String> codigosSeleccionados, Map<String, List<String>> coloniasPorCp, ConfiguracionEnvio? configuracionEnvio, bool buscandoUbicacion, bool guardando, bool cargandoConfiguracion, String? errorMessage, bool guardadoExitoso, bool paso1Completado, String? sucursalIdCreada
});


$ConfiguracionEnvioCopyWith<$Res>? get configuracionEnvio;

}
/// @nodoc
class _$WizardSucursalStateCopyWithImpl<$Res>
    implements $WizardSucursalStateCopyWith<$Res> {
  _$WizardSucursalStateCopyWithImpl(this._self, this._then);

  final WizardSucursalState _self;
  final $Res Function(WizardSucursalState) _then;

/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pasoActual = null,Object? nombre = null,Object? calle = null,Object? numeroExterior = null,Object? codigoPostal = null,Object? colonia = freezed,Object? estado = freezed,Object? municipio = freezed,Object? latitud = freezed,Object? longitud = freezed,Object? codigosDisponibles = null,Object? codigosSeleccionados = null,Object? coloniasPorCp = null,Object? configuracionEnvio = freezed,Object? buscandoUbicacion = null,Object? guardando = null,Object? cargandoConfiguracion = null,Object? errorMessage = freezed,Object? guardadoExitoso = null,Object? paso1Completado = null,Object? sucursalIdCreada = freezed,}) {
  return _then(_self.copyWith(
pasoActual: null == pasoActual ? _self.pasoActual : pasoActual // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numeroExterior: null == numeroExterior ? _self.numeroExterior : numeroExterior // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,colonia: freezed == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,municipio: freezed == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String?,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,codigosDisponibles: null == codigosDisponibles ? _self.codigosDisponibles : codigosDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,codigosSeleccionados: null == codigosSeleccionados ? _self.codigosSeleccionados : codigosSeleccionados // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCp: null == coloniasPorCp ? _self.coloniasPorCp : coloniasPorCp // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,configuracionEnvio: freezed == configuracionEnvio ? _self.configuracionEnvio : configuracionEnvio // ignore: cast_nullable_to_non_nullable
as ConfiguracionEnvio?,buscandoUbicacion: null == buscandoUbicacion ? _self.buscandoUbicacion : buscandoUbicacion // ignore: cast_nullable_to_non_nullable
as bool,guardando: null == guardando ? _self.guardando : guardando // ignore: cast_nullable_to_non_nullable
as bool,cargandoConfiguracion: null == cargandoConfiguracion ? _self.cargandoConfiguracion : cargandoConfiguracion // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardadoExitoso: null == guardadoExitoso ? _self.guardadoExitoso : guardadoExitoso // ignore: cast_nullable_to_non_nullable
as bool,paso1Completado: null == paso1Completado ? _self.paso1Completado : paso1Completado // ignore: cast_nullable_to_non_nullable
as bool,sucursalIdCreada: freezed == sucursalIdCreada ? _self.sucursalIdCreada : sucursalIdCreada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguracionEnvioCopyWith<$Res>? get configuracionEnvio {
    if (_self.configuracionEnvio == null) {
    return null;
  }

  return $ConfiguracionEnvioCopyWith<$Res>(_self.configuracionEnvio!, (value) {
    return _then(_self.copyWith(configuracionEnvio: value));
  });
}
}


/// Adds pattern-matching-related methods to [WizardSucursalState].
extension WizardSucursalStatePatterns on WizardSucursalState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WizardSucursalState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WizardSucursalState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WizardSucursalState value)  $default,){
final _that = this;
switch (_that) {
case _WizardSucursalState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WizardSucursalState value)?  $default,){
final _that = this;
switch (_that) {
case _WizardSucursalState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pasoActual,  String nombre,  String calle,  String numeroExterior,  String codigoPostal,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp,  ConfiguracionEnvio? configuracionEnvio,  bool buscandoUbicacion,  bool guardando,  bool cargandoConfiguracion,  String? errorMessage,  bool guardadoExitoso,  bool paso1Completado,  String? sucursalIdCreada)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WizardSucursalState() when $default != null:
return $default(_that.pasoActual,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp,_that.configuracionEnvio,_that.buscandoUbicacion,_that.guardando,_that.cargandoConfiguracion,_that.errorMessage,_that.guardadoExitoso,_that.paso1Completado,_that.sucursalIdCreada);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pasoActual,  String nombre,  String calle,  String numeroExterior,  String codigoPostal,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp,  ConfiguracionEnvio? configuracionEnvio,  bool buscandoUbicacion,  bool guardando,  bool cargandoConfiguracion,  String? errorMessage,  bool guardadoExitoso,  bool paso1Completado,  String? sucursalIdCreada)  $default,) {final _that = this;
switch (_that) {
case _WizardSucursalState():
return $default(_that.pasoActual,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp,_that.configuracionEnvio,_that.buscandoUbicacion,_that.guardando,_that.cargandoConfiguracion,_that.errorMessage,_that.guardadoExitoso,_that.paso1Completado,_that.sucursalIdCreada);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pasoActual,  String nombre,  String calle,  String numeroExterior,  String codigoPostal,  String? colonia,  String? estado,  String? municipio,  double? latitud,  double? longitud,  List<String> codigosDisponibles,  List<String> codigosSeleccionados,  Map<String, List<String>> coloniasPorCp,  ConfiguracionEnvio? configuracionEnvio,  bool buscandoUbicacion,  bool guardando,  bool cargandoConfiguracion,  String? errorMessage,  bool guardadoExitoso,  bool paso1Completado,  String? sucursalIdCreada)?  $default,) {final _that = this;
switch (_that) {
case _WizardSucursalState() when $default != null:
return $default(_that.pasoActual,_that.nombre,_that.calle,_that.numeroExterior,_that.codigoPostal,_that.colonia,_that.estado,_that.municipio,_that.latitud,_that.longitud,_that.codigosDisponibles,_that.codigosSeleccionados,_that.coloniasPorCp,_that.configuracionEnvio,_that.buscandoUbicacion,_that.guardando,_that.cargandoConfiguracion,_that.errorMessage,_that.guardadoExitoso,_that.paso1Completado,_that.sucursalIdCreada);case _:
  return null;

}
}

}

/// @nodoc


class _WizardSucursalState implements WizardSucursalState {
  const _WizardSucursalState({this.pasoActual = 0, this.nombre = '', this.calle = '', this.numeroExterior = '', this.codigoPostal = '', this.colonia, this.estado, this.municipio, this.latitud, this.longitud, final  List<String> codigosDisponibles = const <String>[], final  List<String> codigosSeleccionados = const <String>[], final  Map<String, List<String>> coloniasPorCp = const <String, List<String>>{}, this.configuracionEnvio, this.buscandoUbicacion = false, this.guardando = false, this.cargandoConfiguracion = false, this.errorMessage, this.guardadoExitoso = false, this.paso1Completado = false, this.sucursalIdCreada}): _codigosDisponibles = codigosDisponibles,_codigosSeleccionados = codigosSeleccionados,_coloniasPorCp = coloniasPorCp;
  

// 📍 Control del Wizard
@override@JsonKey() final  int pasoActual;
// ─── Datos Temporales del Formulario (Paso 1) ───
@override@JsonKey() final  String nombre;
@override@JsonKey() final  String calle;
@override@JsonKey() final  String numeroExterior;
@override@JsonKey() final  String codigoPostal;
@override final  String? colonia;
@override final  String? estado;
@override final  String? municipio;
@override final  double? latitud;
@override final  double? longitud;
// ─── Datos Temporales de Cobertura (Paso 2) ───
 final  List<String> _codigosDisponibles;
// ─── Datos Temporales de Cobertura (Paso 2) ───
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

// ─── Entidad del Dominio de Envíos (Paso 2) ───
// Usamos la entidad completa para no desarmarla en variables sueltas
@override final  ConfiguracionEnvio? configuracionEnvio;
// ─── Banderas de proceso y resultados ───
@override@JsonKey() final  bool buscandoUbicacion;
@override@JsonKey() final  bool guardando;
@override@JsonKey() final  bool cargandoConfiguracion;
@override final  String? errorMessage;
@override@JsonKey() final  bool guardadoExitoso;
// True cuando finaliza TODO el wizard
@override@JsonKey() final  bool paso1Completado;
// True para avanzar al mapa
@override final  String? sucursalIdCreada;

/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WizardSucursalStateCopyWith<_WizardSucursalState> get copyWith => __$WizardSucursalStateCopyWithImpl<_WizardSucursalState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WizardSucursalState&&(identical(other.pasoActual, pasoActual) || other.pasoActual == pasoActual)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numeroExterior, numeroExterior) || other.numeroExterior == numeroExterior)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.latitud, latitud) || other.latitud == latitud)&&(identical(other.longitud, longitud) || other.longitud == longitud)&&const DeepCollectionEquality().equals(other._codigosDisponibles, _codigosDisponibles)&&const DeepCollectionEquality().equals(other._codigosSeleccionados, _codigosSeleccionados)&&const DeepCollectionEquality().equals(other._coloniasPorCp, _coloniasPorCp)&&(identical(other.configuracionEnvio, configuracionEnvio) || other.configuracionEnvio == configuracionEnvio)&&(identical(other.buscandoUbicacion, buscandoUbicacion) || other.buscandoUbicacion == buscandoUbicacion)&&(identical(other.guardando, guardando) || other.guardando == guardando)&&(identical(other.cargandoConfiguracion, cargandoConfiguracion) || other.cargandoConfiguracion == cargandoConfiguracion)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.guardadoExitoso, guardadoExitoso) || other.guardadoExitoso == guardadoExitoso)&&(identical(other.paso1Completado, paso1Completado) || other.paso1Completado == paso1Completado)&&(identical(other.sucursalIdCreada, sucursalIdCreada) || other.sucursalIdCreada == sucursalIdCreada));
}


@override
int get hashCode => Object.hashAll([runtimeType,pasoActual,nombre,calle,numeroExterior,codigoPostal,colonia,estado,municipio,latitud,longitud,const DeepCollectionEquality().hash(_codigosDisponibles),const DeepCollectionEquality().hash(_codigosSeleccionados),const DeepCollectionEquality().hash(_coloniasPorCp),configuracionEnvio,buscandoUbicacion,guardando,cargandoConfiguracion,errorMessage,guardadoExitoso,paso1Completado,sucursalIdCreada]);

@override
String toString() {
  return 'WizardSucursalState(pasoActual: $pasoActual, nombre: $nombre, calle: $calle, numeroExterior: $numeroExterior, codigoPostal: $codigoPostal, colonia: $colonia, estado: $estado, municipio: $municipio, latitud: $latitud, longitud: $longitud, codigosDisponibles: $codigosDisponibles, codigosSeleccionados: $codigosSeleccionados, coloniasPorCp: $coloniasPorCp, configuracionEnvio: $configuracionEnvio, buscandoUbicacion: $buscandoUbicacion, guardando: $guardando, cargandoConfiguracion: $cargandoConfiguracion, errorMessage: $errorMessage, guardadoExitoso: $guardadoExitoso, paso1Completado: $paso1Completado, sucursalIdCreada: $sucursalIdCreada)';
}


}

/// @nodoc
abstract mixin class _$WizardSucursalStateCopyWith<$Res> implements $WizardSucursalStateCopyWith<$Res> {
  factory _$WizardSucursalStateCopyWith(_WizardSucursalState value, $Res Function(_WizardSucursalState) _then) = __$WizardSucursalStateCopyWithImpl;
@override @useResult
$Res call({
 int pasoActual, String nombre, String calle, String numeroExterior, String codigoPostal, String? colonia, String? estado, String? municipio, double? latitud, double? longitud, List<String> codigosDisponibles, List<String> codigosSeleccionados, Map<String, List<String>> coloniasPorCp, ConfiguracionEnvio? configuracionEnvio, bool buscandoUbicacion, bool guardando, bool cargandoConfiguracion, String? errorMessage, bool guardadoExitoso, bool paso1Completado, String? sucursalIdCreada
});


@override $ConfiguracionEnvioCopyWith<$Res>? get configuracionEnvio;

}
/// @nodoc
class __$WizardSucursalStateCopyWithImpl<$Res>
    implements _$WizardSucursalStateCopyWith<$Res> {
  __$WizardSucursalStateCopyWithImpl(this._self, this._then);

  final _WizardSucursalState _self;
  final $Res Function(_WizardSucursalState) _then;

/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pasoActual = null,Object? nombre = null,Object? calle = null,Object? numeroExterior = null,Object? codigoPostal = null,Object? colonia = freezed,Object? estado = freezed,Object? municipio = freezed,Object? latitud = freezed,Object? longitud = freezed,Object? codigosDisponibles = null,Object? codigosSeleccionados = null,Object? coloniasPorCp = null,Object? configuracionEnvio = freezed,Object? buscandoUbicacion = null,Object? guardando = null,Object? cargandoConfiguracion = null,Object? errorMessage = freezed,Object? guardadoExitoso = null,Object? paso1Completado = null,Object? sucursalIdCreada = freezed,}) {
  return _then(_WizardSucursalState(
pasoActual: null == pasoActual ? _self.pasoActual : pasoActual // ignore: cast_nullable_to_non_nullable
as int,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numeroExterior: null == numeroExterior ? _self.numeroExterior : numeroExterior // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,colonia: freezed == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String?,estado: freezed == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String?,municipio: freezed == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String?,latitud: freezed == latitud ? _self.latitud : latitud // ignore: cast_nullable_to_non_nullable
as double?,longitud: freezed == longitud ? _self.longitud : longitud // ignore: cast_nullable_to_non_nullable
as double?,codigosDisponibles: null == codigosDisponibles ? _self._codigosDisponibles : codigosDisponibles // ignore: cast_nullable_to_non_nullable
as List<String>,codigosSeleccionados: null == codigosSeleccionados ? _self._codigosSeleccionados : codigosSeleccionados // ignore: cast_nullable_to_non_nullable
as List<String>,coloniasPorCp: null == coloniasPorCp ? _self._coloniasPorCp : coloniasPorCp // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,configuracionEnvio: freezed == configuracionEnvio ? _self.configuracionEnvio : configuracionEnvio // ignore: cast_nullable_to_non_nullable
as ConfiguracionEnvio?,buscandoUbicacion: null == buscandoUbicacion ? _self.buscandoUbicacion : buscandoUbicacion // ignore: cast_nullable_to_non_nullable
as bool,guardando: null == guardando ? _self.guardando : guardando // ignore: cast_nullable_to_non_nullable
as bool,cargandoConfiguracion: null == cargandoConfiguracion ? _self.cargandoConfiguracion : cargandoConfiguracion // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,guardadoExitoso: null == guardadoExitoso ? _self.guardadoExitoso : guardadoExitoso // ignore: cast_nullable_to_non_nullable
as bool,paso1Completado: null == paso1Completado ? _self.paso1Completado : paso1Completado // ignore: cast_nullable_to_non_nullable
as bool,sucursalIdCreada: freezed == sucursalIdCreada ? _self.sucursalIdCreada : sucursalIdCreada // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WizardSucursalState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConfiguracionEnvioCopyWith<$Res>? get configuracionEnvio {
    if (_self.configuracionEnvio == null) {
    return null;
  }

  return $ConfiguracionEnvioCopyWith<$Res>(_self.configuracionEnvio!, (value) {
    return _then(_self.copyWith(configuracionEnvio: value));
  });
}
}

// dart format on
