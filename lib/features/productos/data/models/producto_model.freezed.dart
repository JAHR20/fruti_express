// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'producto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductoModel {

 String? get id;@JsonKey(name: 'categoria_id') String get categoriaId; String get nombre; String? get descripcion;@JsonKey(name: 'precio_actual') int get precioActual;@JsonKey(name: 'precio_comparacion') int? get precioComparacion;@JsonKey(name: 'unidad_medida') UnidadMedida get unidadMedida;@JsonKey(name: 'imagen_url') String? get imagenUrl;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'fecha_creacion') DateTime get fechaCreacion;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(readValue: _leerStock, includeToJson: false) int get stock;
/// Create a copy of ProductoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductoModelCopyWith<ProductoModel> get copyWith => _$ProductoModelCopyWithImpl<ProductoModel>(this as ProductoModel, _$identity);

  /// Serializes this ProductoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioActual, precioActual) || other.precioActual == precioActual)&&(identical(other.precioComparacion, precioComparacion) || other.precioComparacion == precioComparacion)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoriaId,nombre,descripcion,precioActual,precioComparacion,unidadMedida,imagenUrl,isActive,fechaCreacion,updatedAt,stock);

@override
String toString() {
  return 'ProductoModel(id: $id, categoriaId: $categoriaId, nombre: $nombre, descripcion: $descripcion, precioActual: $precioActual, precioComparacion: $precioComparacion, unidadMedida: $unidadMedida, imagenUrl: $imagenUrl, isActive: $isActive, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class $ProductoModelCopyWith<$Res>  {
  factory $ProductoModelCopyWith(ProductoModel value, $Res Function(ProductoModel) _then) = _$ProductoModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'categoria_id') String categoriaId, String nombre, String? descripcion,@JsonKey(name: 'precio_actual') int precioActual,@JsonKey(name: 'precio_comparacion') int? precioComparacion,@JsonKey(name: 'unidad_medida') UnidadMedida unidadMedida,@JsonKey(name: 'imagen_url') String? imagenUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(readValue: _leerStock, includeToJson: false) int stock
});




}
/// @nodoc
class _$ProductoModelCopyWithImpl<$Res>
    implements $ProductoModelCopyWith<$Res> {
  _$ProductoModelCopyWithImpl(this._self, this._then);

  final ProductoModel _self;
  final $Res Function(ProductoModel) _then;

/// Create a copy of ProductoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoriaId = null,Object? nombre = null,Object? descripcion = freezed,Object? precioActual = null,Object? precioComparacion = freezed,Object? unidadMedida = null,Object? imagenUrl = freezed,Object? isActive = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: null == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioActual: null == precioActual ? _self.precioActual : precioActual // ignore: cast_nullable_to_non_nullable
as int,precioComparacion: freezed == precioComparacion ? _self.precioComparacion : precioComparacion // ignore: cast_nullable_to_non_nullable
as int?,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductoModel].
extension ProductoModelPatterns on ProductoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductoModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'categoria_id')  String categoriaId,  String nombre,  String? descripcion, @JsonKey(name: 'precio_actual')  int precioActual, @JsonKey(name: 'precio_comparacion')  int? precioComparacion, @JsonKey(name: 'unidad_medida')  UnidadMedida unidadMedida, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(readValue: _leerStock, includeToJson: false)  int stock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductoModel() when $default != null:
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'categoria_id')  String categoriaId,  String nombre,  String? descripcion, @JsonKey(name: 'precio_actual')  int precioActual, @JsonKey(name: 'precio_comparacion')  int? precioComparacion, @JsonKey(name: 'unidad_medida')  UnidadMedida unidadMedida, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(readValue: _leerStock, includeToJson: false)  int stock)  $default,) {final _that = this;
switch (_that) {
case _ProductoModel():
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'categoria_id')  String categoriaId,  String nombre,  String? descripcion, @JsonKey(name: 'precio_actual')  int precioActual, @JsonKey(name: 'precio_comparacion')  int? precioComparacion, @JsonKey(name: 'unidad_medida')  UnidadMedida unidadMedida, @JsonKey(name: 'imagen_url')  String? imagenUrl, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'fecha_creacion')  DateTime fechaCreacion, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(readValue: _leerStock, includeToJson: false)  int stock)?  $default,) {final _that = this;
switch (_that) {
case _ProductoModel() when $default != null:
return $default(_that.id,_that.categoriaId,_that.nombre,_that.descripcion,_that.precioActual,_that.precioComparacion,_that.unidadMedida,_that.imagenUrl,_that.isActive,_that.fechaCreacion,_that.updatedAt,_that.stock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductoModel implements ProductoModel {
  const _ProductoModel({this.id, @JsonKey(name: 'categoria_id') required this.categoriaId, required this.nombre, this.descripcion, @JsonKey(name: 'precio_actual') required this.precioActual, @JsonKey(name: 'precio_comparacion') this.precioComparacion, @JsonKey(name: 'unidad_medida') required this.unidadMedida, @JsonKey(name: 'imagen_url') this.imagenUrl, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'fecha_creacion') required this.fechaCreacion, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(readValue: _leerStock, includeToJson: false) this.stock = 0});
  factory _ProductoModel.fromJson(Map<String, dynamic> json) => _$ProductoModelFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'categoria_id') final  String categoriaId;
@override final  String nombre;
@override final  String? descripcion;
@override@JsonKey(name: 'precio_actual') final  int precioActual;
@override@JsonKey(name: 'precio_comparacion') final  int? precioComparacion;
@override@JsonKey(name: 'unidad_medida') final  UnidadMedida unidadMedida;
@override@JsonKey(name: 'imagen_url') final  String? imagenUrl;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'fecha_creacion') final  DateTime fechaCreacion;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(readValue: _leerStock, includeToJson: false) final  int stock;

/// Create a copy of ProductoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductoModelCopyWith<_ProductoModel> get copyWith => __$ProductoModelCopyWithImpl<_ProductoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoriaId, categoriaId) || other.categoriaId == categoriaId)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.descripcion, descripcion) || other.descripcion == descripcion)&&(identical(other.precioActual, precioActual) || other.precioActual == precioActual)&&(identical(other.precioComparacion, precioComparacion) || other.precioComparacion == precioComparacion)&&(identical(other.unidadMedida, unidadMedida) || other.unidadMedida == unidadMedida)&&(identical(other.imagenUrl, imagenUrl) || other.imagenUrl == imagenUrl)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fechaCreacion, fechaCreacion) || other.fechaCreacion == fechaCreacion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.stock, stock) || other.stock == stock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoriaId,nombre,descripcion,precioActual,precioComparacion,unidadMedida,imagenUrl,isActive,fechaCreacion,updatedAt,stock);

@override
String toString() {
  return 'ProductoModel(id: $id, categoriaId: $categoriaId, nombre: $nombre, descripcion: $descripcion, precioActual: $precioActual, precioComparacion: $precioComparacion, unidadMedida: $unidadMedida, imagenUrl: $imagenUrl, isActive: $isActive, fechaCreacion: $fechaCreacion, updatedAt: $updatedAt, stock: $stock)';
}


}

/// @nodoc
abstract mixin class _$ProductoModelCopyWith<$Res> implements $ProductoModelCopyWith<$Res> {
  factory _$ProductoModelCopyWith(_ProductoModel value, $Res Function(_ProductoModel) _then) = __$ProductoModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'categoria_id') String categoriaId, String nombre, String? descripcion,@JsonKey(name: 'precio_actual') int precioActual,@JsonKey(name: 'precio_comparacion') int? precioComparacion,@JsonKey(name: 'unidad_medida') UnidadMedida unidadMedida,@JsonKey(name: 'imagen_url') String? imagenUrl,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'fecha_creacion') DateTime fechaCreacion,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(readValue: _leerStock, includeToJson: false) int stock
});




}
/// @nodoc
class __$ProductoModelCopyWithImpl<$Res>
    implements _$ProductoModelCopyWith<$Res> {
  __$ProductoModelCopyWithImpl(this._self, this._then);

  final _ProductoModel _self;
  final $Res Function(_ProductoModel) _then;

/// Create a copy of ProductoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoriaId = null,Object? nombre = null,Object? descripcion = freezed,Object? precioActual = null,Object? precioComparacion = freezed,Object? unidadMedida = null,Object? imagenUrl = freezed,Object? isActive = null,Object? fechaCreacion = null,Object? updatedAt = freezed,Object? stock = null,}) {
  return _then(_ProductoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,categoriaId: null == categoriaId ? _self.categoriaId : categoriaId // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,descripcion: freezed == descripcion ? _self.descripcion : descripcion // ignore: cast_nullable_to_non_nullable
as String?,precioActual: null == precioActual ? _self.precioActual : precioActual // ignore: cast_nullable_to_non_nullable
as int,precioComparacion: freezed == precioComparacion ? _self.precioComparacion : precioComparacion // ignore: cast_nullable_to_non_nullable
as int?,unidadMedida: null == unidadMedida ? _self.unidadMedida : unidadMedida // ignore: cast_nullable_to_non_nullable
as UnidadMedida,imagenUrl: freezed == imagenUrl ? _self.imagenUrl : imagenUrl // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,fechaCreacion: null == fechaCreacion ? _self.fechaCreacion : fechaCreacion // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
