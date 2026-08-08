// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perfil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PerfilModel {

 String get id; String get nombre;@JsonKey(name: 'apellido_paterno') String get apellidoPaterno;@JsonKey(name: 'apellido_materno') String? get apellidoMaterno; String? get alias; String get email; bool get activo; String? get telefono; TipoUsuario get rol;@JsonKey(name: 'sucursal_id') String? get sucursalId;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;
/// Create a copy of PerfilModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerfilModelCopyWith<PerfilModel> get copyWith => _$PerfilModelCopyWithImpl<PerfilModel>(this as PerfilModel, _$identity);

  /// Serializes this PerfilModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerfilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellidoPaterno, apellidoPaterno) || other.apellidoPaterno == apellidoPaterno)&&(identical(other.apellidoMaterno, apellidoMaterno) || other.apellidoMaterno == apellidoMaterno)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,apellidoPaterno,apellidoMaterno,alias,email,activo,telefono,rol,sucursalId,avatarUrl,fechaCreacion);

@override
String toString() {
  return 'PerfilModel(id: $id, nombre: $nombre, apellidoPaterno: $apellidoPaterno, apellidoMaterno: $apellidoMaterno, alias: $alias, email: $email, activo: $activo, telefono: $telefono, rol: $rol, sucursalId: $sucursalId, avatarUrl: $avatarUrl, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $PerfilModelCopyWith<$Res>  {
  factory $PerfilModelCopyWith(PerfilModel value, $Res Function(PerfilModel) _then) = _$PerfilModelCopyWithImpl;
@useResult
$Res call({
 String id, String nombre,@JsonKey(name: 'apellido_paterno') String apellidoPaterno,@JsonKey(name: 'apellido_materno') String? apellidoMaterno, String? alias, String email, bool activo, String? telefono, TipoUsuario rol,@JsonKey(name: 'sucursal_id') String? sucursalId,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class _$PerfilModelCopyWithImpl<$Res>
    implements $PerfilModelCopyWith<$Res> {
  _$PerfilModelCopyWithImpl(this._self, this._then);

  final PerfilModel _self;
  final $Res Function(PerfilModel) _then;

/// Create a copy of PerfilModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? apellidoPaterno = null,Object? apellidoMaterno = freezed,Object? alias = freezed,Object? email = null,Object? activo = null,Object? telefono = freezed,Object? rol = null,Object? sucursalId = freezed,Object? avatarUrl = freezed,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,apellidoPaterno: null == apellidoPaterno ? _self.apellidoPaterno : apellidoPaterno // ignore: cast_nullable_to_non_nullable
as String,apellidoMaterno: freezed == apellidoMaterno ? _self.apellidoMaterno : apellidoMaterno // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as TipoUsuario,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PerfilModel].
extension PerfilModelPatterns on PerfilModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerfilModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerfilModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerfilModel value)  $default,){
final _that = this;
switch (_that) {
case _PerfilModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerfilModel value)?  $default,){
final _that = this;
switch (_that) {
case _PerfilModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String? apellidoMaterno,  String? alias,  String email,  bool activo,  String? telefono,  TipoUsuario rol, @JsonKey(name: 'sucursal_id')  String? sucursalId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerfilModel() when $default != null:
return $default(_that.id,_that.nombre,_that.apellidoPaterno,_that.apellidoMaterno,_that.alias,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String? apellidoMaterno,  String? alias,  String email,  bool activo,  String? telefono,  TipoUsuario rol, @JsonKey(name: 'sucursal_id')  String? sucursalId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _PerfilModel():
return $default(_that.id,_that.nombre,_that.apellidoPaterno,_that.apellidoMaterno,_that.alias,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre, @JsonKey(name: 'apellido_paterno')  String apellidoPaterno, @JsonKey(name: 'apellido_materno')  String? apellidoMaterno,  String? alias,  String email,  bool activo,  String? telefono,  TipoUsuario rol, @JsonKey(name: 'sucursal_id')  String? sucursalId, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _PerfilModel() when $default != null:
return $default(_that.id,_that.nombre,_that.apellidoPaterno,_that.apellidoMaterno,_that.alias,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerfilModel implements PerfilModel {
  const _PerfilModel({required this.id, required this.nombre, @JsonKey(name: 'apellido_paterno') required this.apellidoPaterno, @JsonKey(name: 'apellido_materno') this.apellidoMaterno, this.alias, required this.email, required this.activo, this.telefono, required this.rol, @JsonKey(name: 'sucursal_id') this.sucursalId, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion});
  factory _PerfilModel.fromJson(Map<String, dynamic> json) => _$PerfilModelFromJson(json);

@override final  String id;
@override final  String nombre;
@override@JsonKey(name: 'apellido_paterno') final  String apellidoPaterno;
@override@JsonKey(name: 'apellido_materno') final  String? apellidoMaterno;
@override final  String? alias;
@override final  String email;
@override final  bool activo;
@override final  String? telefono;
@override final  TipoUsuario rol;
@override@JsonKey(name: 'sucursal_id') final  String? sucursalId;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;

/// Create a copy of PerfilModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerfilModelCopyWith<_PerfilModel> get copyWith => __$PerfilModelCopyWithImpl<_PerfilModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerfilModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerfilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellidoPaterno, apellidoPaterno) || other.apellidoPaterno == apellidoPaterno)&&(identical(other.apellidoMaterno, apellidoMaterno) || other.apellidoMaterno == apellidoMaterno)&&(identical(other.alias, alias) || other.alias == alias)&&(identical(other.email, email) || other.email == email)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,apellidoPaterno,apellidoMaterno,alias,email,activo,telefono,rol,sucursalId,avatarUrl,fechaCreacion);

@override
String toString() {
  return 'PerfilModel(id: $id, nombre: $nombre, apellidoPaterno: $apellidoPaterno, apellidoMaterno: $apellidoMaterno, alias: $alias, email: $email, activo: $activo, telefono: $telefono, rol: $rol, sucursalId: $sucursalId, avatarUrl: $avatarUrl, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$PerfilModelCopyWith<$Res> implements $PerfilModelCopyWith<$Res> {
  factory _$PerfilModelCopyWith(_PerfilModel value, $Res Function(_PerfilModel) _then) = __$PerfilModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre,@JsonKey(name: 'apellido_paterno') String apellidoPaterno,@JsonKey(name: 'apellido_materno') String? apellidoMaterno, String? alias, String email, bool activo, String? telefono, TipoUsuario rol,@JsonKey(name: 'sucursal_id') String? sucursalId,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion
});




}
/// @nodoc
class __$PerfilModelCopyWithImpl<$Res>
    implements _$PerfilModelCopyWith<$Res> {
  __$PerfilModelCopyWithImpl(this._self, this._then);

  final _PerfilModel _self;
  final $Res Function(_PerfilModel) _then;

/// Create a copy of PerfilModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? apellidoPaterno = null,Object? apellidoMaterno = freezed,Object? alias = freezed,Object? email = null,Object? activo = null,Object? telefono = freezed,Object? rol = null,Object? sucursalId = freezed,Object? avatarUrl = freezed,Object? fechaCreacion = null,}) {
  return _then(_PerfilModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,apellidoPaterno: null == apellidoPaterno ? _self.apellidoPaterno : apellidoPaterno // ignore: cast_nullable_to_non_nullable
as String,apellidoMaterno: freezed == apellidoMaterno ? _self.apellidoMaterno : apellidoMaterno // ignore: cast_nullable_to_non_nullable
as String?,alias: freezed == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,activo: null == activo ? _self.activo : activo // ignore: cast_nullable_to_non_nullable
as bool,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,rol: null == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as TipoUsuario,sucursalId: freezed == sucursalId ? _self.sucursalId : sucursalId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
