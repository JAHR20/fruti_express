// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'direccion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Direccion {

 String get id; String get usuarioId; String get alias; String get calle; String get numExt; String? get numInt; String get colonia; String get codigoPostal; String get municipio; String get estado; String get pais; String? get referencias; bool get esPrincipal; DateTime get fechaCreacion;
/// Create a copy of Direccion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DireccionCopyWith<Direccion> get copyWith => _$DireccionCopyWithImpl<Direccion>(this as Direccion, _$identity);

  /// Serializes this Direccion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Direccion&&(identical(other.id, id) || other.id == id)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExt, numExt) || other.numExt == numExt)&&(identical(other.numInt, numInt) || other.numInt == numInt)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.pais, pais) || other.pais == pais)&&(identical(other.referencias, referencias) || other.referencias == referencias)&&(identical(other.esPrincipal, esPrincipal) || other.esPrincipal == esPrincipal)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuarioId,alias,calle,numExt,numInt,colonia,codigoPostal,municipio,estado,pais,referencias,esPrincipal,fechaCreacion);

@override
String toString() {
  return 'Direccion(id: $id, usuarioId: $usuarioId, alias: $alias, calle: $calle, numExt: $numExt, numInt: $numInt, colonia: $colonia, codigoPostal: $codigoPostal, municipio: $municipio, estado: $estado, pais: $pais, referencias: $referencias, esPrincipal: $esPrincipal, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $DireccionCopyWith<$Res>  {
  factory $DireccionCopyWith(Direccion value, $Res Function(Direccion) _then) = _$DireccionCopyWithImpl;
@useResult
$Res call({
 String id, String usuarioId, String alias, String calle, String numExt, String? numInt, String colonia, String codigoPostal, String municipio, String estado, String pais, String? referencias, bool esPrincipal, DateTime fechaCreacion
});




}
/// @nodoc
class _$DireccionCopyWithImpl<$Res>
    implements $DireccionCopyWith<$Res> {
  _$DireccionCopyWithImpl(this._self, this._then);

  final Direccion _self;
  final $Res Function(Direccion) _then;

/// Create a copy of Direccion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? usuarioId = null,Object? alias = null,Object? calle = null,Object? numExt = null,Object? numInt = freezed,Object? colonia = null,Object? codigoPostal = null,Object? municipio = null,Object? estado = null,Object? pais = null,Object? referencias = freezed,Object? esPrincipal = null,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExt: null == numExt ? _self.numExt : numExt // ignore: cast_nullable_to_non_nullable
as String,numInt: freezed == numInt ? _self.numInt : numInt // ignore: cast_nullable_to_non_nullable
as String?,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,pais: null == pais ? _self.pais : pais // ignore: cast_nullable_to_non_nullable
as String,referencias: freezed == referencias ? _self.referencias : referencias // ignore: cast_nullable_to_non_nullable
as String?,esPrincipal: null == esPrincipal ? _self.esPrincipal : esPrincipal // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Direccion].
extension DireccionPatterns on Direccion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Direccion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Direccion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Direccion value)  $default,){
final _that = this;
switch (_that) {
case _Direccion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Direccion value)?  $default,){
final _that = this;
switch (_that) {
case _Direccion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String usuarioId,  String alias,  String calle,  String numExt,  String? numInt,  String colonia,  String codigoPostal,  String municipio,  String estado,  String pais,  String? referencias,  bool esPrincipal,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Direccion() when $default != null:
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.pais,_that.referencias,_that.esPrincipal,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String usuarioId,  String alias,  String calle,  String numExt,  String? numInt,  String colonia,  String codigoPostal,  String municipio,  String estado,  String pais,  String? referencias,  bool esPrincipal,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _Direccion():
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.pais,_that.referencias,_that.esPrincipal,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String usuarioId,  String alias,  String calle,  String numExt,  String? numInt,  String colonia,  String codigoPostal,  String municipio,  String estado,  String pais,  String? referencias,  bool esPrincipal,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _Direccion() when $default != null:
return $default(_that.id,_that.usuarioId,_that.alias,_that.calle,_that.numExt,_that.numInt,_that.colonia,_that.codigoPostal,_that.municipio,_that.estado,_that.pais,_that.referencias,_that.esPrincipal,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Direccion implements Direccion {
  const _Direccion({required this.id, required this.usuarioId, required this.alias, required this.calle, required this.numExt, this.numInt, required this.colonia, required this.codigoPostal, required this.municipio, required this.estado, required this.pais, this.referencias, this.esPrincipal = false, required this.fechaCreacion});
  factory _Direccion.fromJson(Map<String, dynamic> json) => _$DireccionFromJson(json);

@override final  String id;
@override final  String usuarioId;
@override final  String alias;
@override final  String calle;
@override final  String numExt;
@override final  String? numInt;
@override final  String colonia;
@override final  String codigoPostal;
@override final  String municipio;
@override final  String estado;
@override final  String pais;
@override final  String? referencias;
@override@JsonKey() final  bool esPrincipal;
@override final  DateTime fechaCreacion;

/// Create a copy of Direccion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DireccionCopyWith<_Direccion> get copyWith => __$DireccionCopyWithImpl<_Direccion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DireccionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Direccion&&(identical(other.id, id) || other.id == id)&&(identical(other.usuarioId, usuarioId) || other.usuarioId == usuarioId)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.calle, calle) || other.calle == calle)&&(identical(other.numExt, numExt) || other.numExt == numExt)&&(identical(other.numInt, numInt) || other.numInt == numInt)&&(identical(other.colonia, colonia) || other.colonia == colonia)&&(identical(other.codigoPostal, codigoPostal) || other.codigoPostal == codigoPostal)&&(identical(other.municipio, municipio) || other.municipio == municipio)&&(identical(other.estado, estado) || other.estado == estado)&&(identical(other.pais, pais) || other.pais == pais)&&(identical(other.referencias, referencias) || other.referencias == referencias)&&(identical(other.esPrincipal, esPrincipal) || other.esPrincipal == esPrincipal)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,usuarioId,alias,calle,numExt,numInt,colonia,codigoPostal,municipio,estado,pais,referencias,esPrincipal,fechaCreacion);

@override
String toString() {
  return 'Direccion(id: $id, usuarioId: $usuarioId, alias: $alias, calle: $calle, numExt: $numExt, numInt: $numInt, colonia: $colonia, codigoPostal: $codigoPostal, municipio: $municipio, estado: $estado, pais: $pais, referencias: $referencias, esPrincipal: $esPrincipal, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$DireccionCopyWith<$Res> implements $DireccionCopyWith<$Res> {
  factory _$DireccionCopyWith(_Direccion value, $Res Function(_Direccion) _then) = __$DireccionCopyWithImpl;
@override @useResult
$Res call({
 String id, String usuarioId, String alias, String calle, String numExt, String? numInt, String colonia, String codigoPostal, String municipio, String estado, String pais, String? referencias, bool esPrincipal, DateTime fechaCreacion
});




}
/// @nodoc
class __$DireccionCopyWithImpl<$Res>
    implements _$DireccionCopyWith<$Res> {
  __$DireccionCopyWithImpl(this._self, this._then);

  final _Direccion _self;
  final $Res Function(_Direccion) _then;

/// Create a copy of Direccion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? usuarioId = null,Object? alias = null,Object? calle = null,Object? numExt = null,Object? numInt = freezed,Object? colonia = null,Object? codigoPostal = null,Object? municipio = null,Object? estado = null,Object? pais = null,Object? referencias = freezed,Object? esPrincipal = null,Object? fechaCreacion = null,}) {
  return _then(_Direccion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,usuarioId: null == usuarioId ? _self.usuarioId : usuarioId // ignore: cast_nullable_to_non_nullable
as String,alias: null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,calle: null == calle ? _self.calle : calle // ignore: cast_nullable_to_non_nullable
as String,numExt: null == numExt ? _self.numExt : numExt // ignore: cast_nullable_to_non_nullable
as String,numInt: freezed == numInt ? _self.numInt : numInt // ignore: cast_nullable_to_non_nullable
as String?,colonia: null == colonia ? _self.colonia : colonia // ignore: cast_nullable_to_non_nullable
as String,codigoPostal: null == codigoPostal ? _self.codigoPostal : codigoPostal // ignore: cast_nullable_to_non_nullable
as String,municipio: null == municipio ? _self.municipio : municipio // ignore: cast_nullable_to_non_nullable
as String,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,pais: null == pais ? _self.pais : pais // ignore: cast_nullable_to_non_nullable
as String,referencias: freezed == referencias ? _self.referencias : referencias // ignore: cast_nullable_to_non_nullable
as String?,esPrincipal: null == esPrincipal ? _self.esPrincipal : esPrincipal // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
