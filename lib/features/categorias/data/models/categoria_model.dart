import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';

part 'categoria_model.freezed.dart';
part 'categoria_model.g.dart';

@freezed
abstract class CategoriaModel with _$CategoriaModel {
  const factory CategoriaModel({
    required String id,
    required String nombre,
    String? descripcion,
    @JsonKey(name: 'imagen_url') String? imagenUrl,
    @JsonKey(name: 'is_active') required bool activa,
    @JsonKey(name: 'categoria_padre_id') String? categoriaPadreId,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion,
  }) = _CategoriaModel;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriaModelFromJson(json);
}

extension CategoriaModelX on CategoriaModel {
  Categoria toDomain() => Categoria(
    id: id,
    nombre: nombre,
    descripcion: descripcion,
    imagenUrl: imagenUrl,
    activa: activa,
    categoriaPadreId: categoriaPadreId,
    fechaCreacion: fechaCreacion,
    fechaActualizacion: fechaActualizacion,
  );

  static CategoriaModel fromDomain(Categoria c) => CategoriaModel(
    id: c.id,
    nombre: c.nombre,
    descripcion: c.descripcion,
    imagenUrl: c.imagenUrl,
    activa: c.activa,
    categoriaPadreId: c.categoriaPadreId,
    fechaCreacion: c.fechaCreacion,
    fechaActualizacion: c.fechaActualizacion,
  );
}