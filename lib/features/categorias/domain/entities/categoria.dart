import 'package:freezed_annotation/freezed_annotation.dart';

part 'categoria.freezed.dart';

@freezed
abstract class Categoria with _$Categoria {
  const factory Categoria({
    required String id,
    required String nombre,
    String? descripcion,
    String? imagenUrl,
    required bool activa,
    String? categoriaPadreId,
    required DateTime fechaCreacion,
    DateTime? fechaActualizacion,
  }) = _Categoria;
  // ← Sin fromJson, sin @JsonKey, sin .g.dart
}