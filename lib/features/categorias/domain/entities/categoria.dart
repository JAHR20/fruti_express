import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoria.freezed.dart';
part 'categoria.g.dart';

@freezed
abstract class Categoria with _$Categoria {
  const factory Categoria({
    required String id,
    required String nombre,
    String? descripcion,
    String? imagenUrl,
    required bool activa,

    String? categoriaPadreId, // para subcategorías

    required DateTime fechaCreacion,
  }) = _Categoria;

  factory Categoria.fromJson(Map<String, dynamic> json) =>
      _$CategoriaFromJson(json);
}
