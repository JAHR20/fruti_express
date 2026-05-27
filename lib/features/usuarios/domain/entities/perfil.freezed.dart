// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'perfil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Perfil {

 String get id; String get nombre; String get email; bool get activo; String? get telefono; TipoUsuario get rol; String? get sucursalId; String? get avatarUrl; DateTime get fechaCreacion;
/// Create a copy of Perfil
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerfilCopyWith<Perfil> get copyWith => _$PerfilCopyWithImpl<Perfil>(this as Perfil, _$identity);

  /// Serializes this Perfil to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Perfil&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.email, email) || other.email == email)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,email,activo,telefono,rol,sucursalId,avatarUrl,fechaCreacion);

@override
String toString() {
  return 'Perfil(id: $id, nombre: $nombre, email: $email, activo: $activo, telefono: $telefono, rol: $rol, sucursalId: $sucursalId, avatarUrl: $avatarUrl, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class $PerfilCopyWith<$Res>  {
  factory $PerfilCopyWith(Perfil value, $Res Function(Perfil) _then) = _$PerfilCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String email, bool activo, String? telefono, TipoUsuario rol, String? sucursalId, String? avatarUrl, DateTime fechaCreacion
});




}
/// @nodoc
class _$PerfilCopyWithImpl<$Res>
    implements $PerfilCopyWith<$Res> {
  _$PerfilCopyWithImpl(this._self, this._then);

  final Perfil _self;
  final $Res Function(Perfil) _then;

/// Create a copy of Perfil
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? email = null,Object? activo = null,Object? telefono = freezed,Object? rol = null,Object? sucursalId = freezed,Object? avatarUrl = freezed,Object? fechaCreacion = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [Perfil].
extension PerfilPatterns on Perfil {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Perfil value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Perfil() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Perfil value)  $default,){
final _that = this;
switch (_that) {
case _Perfil():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Perfil value)?  $default,){
final _that = this;
switch (_that) {
case _Perfil() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String email,  bool activo,  String? telefono,  TipoUsuario rol,  String? sucursalId,  String? avatarUrl,  DateTime fechaCreacion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Perfil() when $default != null:
return $default(_that.id,_that.nombre,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String email,  bool activo,  String? telefono,  TipoUsuario rol,  String? sucursalId,  String? avatarUrl,  DateTime fechaCreacion)  $default,) {final _that = this;
switch (_that) {
case _Perfil():
return $default(_that.id,_that.nombre,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String email,  bool activo,  String? telefono,  TipoUsuario rol,  String? sucursalId,  String? avatarUrl,  DateTime fechaCreacion)?  $default,) {final _that = this;
switch (_that) {
case _Perfil() when $default != null:
return $default(_that.id,_that.nombre,_that.email,_that.activo,_that.telefono,_that.rol,_that.sucursalId,_that.avatarUrl,_that.fechaCreacion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Perfil implements Perfil {
  const _Perfil({required this.id, required this.nombre, required this.email, required this.activo, this.telefono, required this.rol, this.sucursalId, this.avatarUrl, required this.fechaCreacion});
  factory _Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);

@override final  String id;
@override final  String nombre;
@override final  String email;
@override final  bool activo;
@override final  String? telefono;
@override final  TipoUsuario rol;
@override final  String? sucursalId;
@override final  String? avatarUrl;
@override final  DateTime fechaCreacion;

/// Create a copy of Perfil
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerfilCopyWith<_Perfil> get copyWith => __$PerfilCopyWithImpl<_Perfil>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerfilToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Perfil&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.email, email) || other.email == email)&&(identical(other.activo, activo) || other.activo == activo)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.sucursalId, sucursalId) || other.sucursalId == sucursalId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nombre,email,activo,telefono,rol,sucursalId,avatarUrl,fechaCreacion);

@override
String toString() {
  return 'Perfil(id: $id, nombre: $nombre, email: $email, activo: $activo, telefono: $telefono, rol: $rol, sucursalId: $sucursalId, avatarUrl: $avatarUrl, fechaCreacion: $fechaCreacion)';
}


}

/// @nodoc
abstract mixin class _$PerfilCopyWith<$Res> implements $PerfilCopyWith<$Res> {
  factory _$PerfilCopyWith(_Perfil value, $Res Function(_Perfil) _then) = __$PerfilCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String email, bool activo, String? telefono, TipoUsuario rol, String? sucursalId, String? avatarUrl, DateTime fechaCreacion
});




}
/// @nodoc
class __$PerfilCopyWithImpl<$Res>
    implements _$PerfilCopyWith<$Res> {
  __$PerfilCopyWithImpl(this._self, this._then);

  final _Perfil _self;
  final $Res Function(_Perfil) _then;

/// Create a copy of Perfil
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? email = null,Object? activo = null,Object? telefono = freezed,Object? rol = null,Object? sucursalId = freezed,Object? avatarUrl = freezed,Object? fechaCreacion = null,}) {
  return _then(_Perfil(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
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
