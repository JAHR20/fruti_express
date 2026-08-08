import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';

@freezed
abstract class Banner with _$Banner {
  const factory Banner({
    required String id,
    required String titulo,
    required String descuento,
    required String subtitulo,
    required String colorInicio,
    required String colorFin,
    String? imagenUrl,
    required bool activo,
    required int orden,
    required DateTime fechaCreacion,
  }) = _Banner;
}