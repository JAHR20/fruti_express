// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuracion_envio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfiguracionEnvioModel {

 String get id;@JsonKey(name: 'sucursal_id') String get sucursalId; EstrategiaEnvio get estrategia;@JsonKey(name: 'radio_max_km') double get radioMaximoKm;@JsonKey(includeToJson: false) List<String> get codigosPostalesPermitidos;@JsonKey(name: 'requerir_validacion_cp') bool get requerirValidacionCP;@JsonKey(name: 'monto_minimo_envio_gratis') double? get montoMinimoEnvioGratis; bool get activa;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;
/// Create a copy of ConfiguracionEnvioModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfiguracionEnvioModelCopyWith<ConfiguracionEnvioModel> get copyWith => _$ConfiguracionEnvioModelCopyWithImpl<ConfiguracionEnvioModel>(this as ConfiguracionEnvioModel, _$identity);

  /// Serializes this ConfiguracionEnvioModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfiguracionEnvioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.estrategia, estrategia) || other.estrategia == estrategia)&&(identical(other.radioMaximoKm, radioMaximoKm) || other.radioMaximoKm == radioMaximoKm)&&const DeepCollectionEquality().equals(other.codigosPostalesPermitidos, codigosPostalesPermitidos)&&(identical(other.requerirValidacionCP, requerirValidacionCP) || other.requerirValidacionCP == requerirValidacionCP)&&(identical(other.montoMinimoEnvioGratis, montoMinimoEnvioGratis) || other.montoMinimoEnvioGratis == montoMinimoEnvioGratis)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,estrategia,radioMaximoKm,const DeepCollectionEquality().hash(codigosPostalesPermitidos),requerirValidacionCP,montoMinimoEnvioGratis,activa,fechaCreacion);

@override
String toString() {
  return 'ConfiguracionEnvioModel(id: $id, sucursalId: $sucursalId, estrategia: $estrategia, radioMaximoKm: $radioMaximoKm, codigosPostalesPermitidos: $codigosPostalesPermitidos, requerirValidacionCP: $requerirValidacionCP, montoMinimoEnvioGratis: $montoMinimoEnvioGratis, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $ConfiguracionEnvioModelCopyWith<$Res>  {
  factory $ConfiguracionEnvioModelCopyWith(ConfiguracionEnvioModel value, $Res Function(ConfiguracionEnvioModel) _then) = _$ConfiguracionEnvioModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'sucursal_id') String sucursalId, EstrategiaEnvio estrategia,@JsonKey(name: 'radio_max_km') double radioMaximoKm,@JsonKey(includeToJson: false) List<String> codigosPostalesPermitidos,@JsonKey(name: 'requerir_validacion_cp') bool requerirValidacionCP,@JsonKey(name: 'monto_minimo_envio_gratis') double? montoMinimoEnvioGratis, bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class _$ConfiguracionEnvioModelCopyWithImpl<$Res>
    implements $ConfiguracionEnvioModelCopyWith<$Res> {
  _$ConfiguracionEnvioModelCopyWithImpl(this._self, this._then);

  final ConfiguracionEnvioModel _self;
  final $Res Function(ConfiguracionEnvioModel) _then;

/// Create a copy of ConfiguracionEnvioModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sucursalId = null,Object? estrategia = null,Object? radioMaximoKm = null,Object? codigosPostalesPermitidos = null,Object? requerirValidacionCP = null,Object? montoMinimoEnvioGratis = freezed,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,estrategia: null == estrategia ? _self.estrategia : estrategia // ignore: cast_nullable_to_non_nullable
as EstrategiaEnvio,radioMaximoKm: null == radioMaximoKm ? _self.radioMaximoKm : radioMaximoKm // ignore: cast_nullable_to_non_nullable
as double,codigosPostalesPermitidos: null == codigosPostalesPermitidos ? _self.codigosPostalesPermitidos : codigosPostalesPermitidos // ignore: cast_nullable_to_non_nullable
as List<String>,requerirValidacionCP: null == requerirValidacionCP ? _self.requerirValidacionCP : requerirValidacionCP // ignore: cast_nullable_to_non_nullable
as bool,montoMinimoEnvioGratis: freezed == montoMinimoEnvioGratis ? _self.montoMinimoEnvioGratis : montoMinimoEnvioGratis // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfiguracionEnvioModel].
extension ConfiguracionEnvioModelPatterns on ConfiguracionEnvioModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfiguracionEnvioModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfiguracionEnvioModel value)  $default,){
final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfiguracionEnvioModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  EstrategiaEnvio estrategia, @JsonKey(name: 'radio_max_km')  double radioMaximoKm, @JsonKey(includeToJson: false)  List<String> codigosPostalesPermitidos, @JsonKey(name: 'requerir_validacion_cp')  bool requerirValidacionCP, @JsonKey(name: 'monto_minimo_envio_gratis')  double? montoMinimoEnvioGratis,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel() when $default != null:
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  EstrategiaEnvio estrategia, @JsonKey(name: 'radio_max_km')  double radioMaximoKm, @JsonKey(includeToJson: false)  List<String> codigosPostalesPermitidos, @JsonKey(name: 'requerir_validacion_cp')  bool requerirValidacionCP, @JsonKey(name: 'monto_minimo_envio_gratis')  double? montoMinimoEnvioGratis,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel():
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'sucursal_id')  String sucursalId,  EstrategiaEnvio estrategia, @JsonKey(name: 'radio_max_km')  double radioMaximoKm, @JsonKey(includeToJson: false)  List<String> codigosPostalesPermitidos, @JsonKey(name: 'requerir_validacion_cp')  bool requerirValidacionCP, @JsonKey(name: 'monto_minimo_envio_gratis')  double? montoMinimoEnvioGratis,  bool activa, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _ConfiguracionEnvioModel() when $default != null:
return $default(_that.id,_that.sucursalId,_that.estrategia,_that.radioMaximoKm,_that.codigosPostalesPermitidos,_that.requerirValidacionCP,_that.montoMinimoEnvioGratis,_that.activa,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfiguracionEnvioModel extends ConfiguracionEnvioModel {
  const _ConfiguracionEnvioModel({required this.id, @JsonKey(name: 'sucursal_id') required this.sucursalId, required this.estrategia, @JsonKey(name: 'radio_max_km') required this.radioMaximoKm, @JsonKey(includeToJson: false) final  List<String> codigosPostalesPermitidos = const [], @JsonKey(name: 'requerir_validacion_cp') this.requerirValidacionCP = false, @JsonKey(name: 'monto_minimo_envio_gratis') this.montoMinimoEnvioGratis, required this.activa, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion}): _codigosPostalesPermitidos = codigosPostalesPermitidos,super._();
  factory _ConfiguracionEnvioModel.fromJson(Map<String, dynamic> json) => _$ConfiguracionEnvioModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'sucursal_id') final  String sucursalId;
@override final  EstrategiaEnvio estrategia;
@override@JsonKey(name: 'radio_max_km') final  double radioMaximoKm;
 final  List<String> _codigosPostalesPermitidos;
@override@JsonKey(includeToJson: false) List<String> get codigosPostalesPermitidos {
  if (_codigosPostalesPermitidos is EqualUnmodifiableListView) return _codigosPostalesPermitidos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codigosPostalesPermitidos);
}

@override@JsonKey(name: 'requerir_validacion_cp') final  bool requerirValidacionCP;
@override@JsonKey(name: 'monto_minimo_envio_gratis') final  double? montoMinimoEnvioGratis;
@override final  bool activa;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;

/// Create a copy of ConfiguracionEnvioModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfiguracionEnvioModelCopyWith<_ConfiguracionEnvioModel> get copyWith => __$ConfiguracionEnvioModelCopyWithImpl<_ConfiguracionEnvioModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfiguracionEnvioModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfiguracionEnvioModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.estrategia, estrategia) || other.estrategia == estrategia)&&(identical(other.radioMaximoKm, radioMaximoKm) || other.radioMaximoKm == radioMaximoKm)&&const DeepCollectionEquality().equals(other._codigosPostalesPermitidos, _codigosPostalesPermitidos)&&(identical(other.requerirValidacionCP, requerirValidacionCP) || other.requerirValidacionCP == requerirValidacionCP)&&(identical(other.montoMinimoEnvioGratis, montoMinimoEnvioGratis) || other.montoMinimoEnvioGratis == montoMinimoEnvioGratis)&&(identical(other.activa, activa) || other.activa == activa)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sucursalId,estrategia,radioMaximoKm,const DeepCollectionEquality().hash(_codigosPostalesPermitidos),requerirValidacionCP,montoMinimoEnvioGratis,activa,fechaCreacion);

@override
String toString() {
  return 'ConfiguracionEnvioModel(id: $id, sucursalId: $sucursalId, estrategia: $estrategia, radioMaximoKm: $radioMaximoKm, codigosPostalesPermitidos: $codigosPostalesPermitidos, requerirValidacionCP: $requerirValidacionCP, montoMinimoEnvioGratis: $montoMinimoEnvioGratis, activa: $activa, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$ConfiguracionEnvioModelCopyWith<$Res> implements $ConfiguracionEnvioModelCopyWith<$Res> {
  factory _$ConfiguracionEnvioModelCopyWith(_ConfiguracionEnvioModel value, $Res Function(_ConfiguracionEnvioModel) _then) = __$ConfiguracionEnvioModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'sucursal_id') String sucursalId, EstrategiaEnvio estrategia,@JsonKey(name: 'radio_max_km') double radioMaximoKm,@JsonKey(includeToJson: false) List<String> codigosPostalesPermitidos,@JsonKey(name: 'requerir_validacion_cp') bool requerirValidacionCP,@JsonKey(name: 'monto_minimo_envio_gratis') double? montoMinimoEnvioGratis, bool activa,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class __$ConfiguracionEnvioModelCopyWithImpl<$Res>
    implements _$ConfiguracionEnvioModelCopyWith<$Res> {
  __$ConfiguracionEnvioModelCopyWithImpl(this._self, this._then);

  final _ConfiguracionEnvioModel _self;
  final $Res Function(_ConfiguracionEnvioModel) _then;

/// Create a copy of ConfiguracionEnvioModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sucursalId = null,Object? estrategia = null,Object? radioMaximoKm = null,Object? codigosPostalesPermitidos = null,Object? requerirValidacionCP = null,Object? montoMinimoEnvioGratis = freezed,Object? activa = null,Object? fechaCreacion = null,}) {
  return _then(_ConfiguracionEnvioModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sucursalId: null == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String,estrategia: null == estrategia ? _self.estrategia : estrategia // ignore: cast_nullable_to_non_nullable
as EstrategiaEnvio,radioMaximoKm: null == radioMaximoKm ? _self.radioMaximoKm : radioMaximoKm // ignore: cast_nullable_to_non_nullable
as double,codigosPostalesPermitidos: null == codigosPostalesPermitidos ? _self._codigosPostalesPermitidos : codigosPostalesPermitidos // ignore: cast_nullable_to_non_nullable
as List<String>,requerirValidacionCP: null == requerirValidacionCP ? _self.requerirValidacionCP : requerirValidacionCP // ignore: cast_nullable_to_non_nullable
as bool,montoMinimoEnvioGratis: freezed == montoMinimoEnvioGratis ? _self.montoMinimoEnvioGratis : montoMinimoEnvioGratis // ignore: cast_nullable_to_non_nullable
as double?,activa: null == activa ? _self.activa : activa // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
