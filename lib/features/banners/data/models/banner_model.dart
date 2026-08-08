import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    required String id,
    required String titulo,
    required String descuento,
    required String subtitulo,
    @JsonKey(name: 'color_inicio') required String colorInicio,
    @JsonKey(name: 'color_fin') required String colorFin,
    @JsonKey(name: 'imagen_url') String? imagenUrl,
    required bool activo,
    required int orden,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

extension BannerModelX on BannerModel {
  Banner toDomain() => Banner(
    id: id,
    titulo: titulo,
    descuento: descuento,
    subtitulo: subtitulo,
    colorInicio: colorInicio,
    colorFin: colorFin,
    imagenUrl: imagenUrl,
    activo: activo,
    orden: orden,
    fechaCreacion: fechaCreacion,
  );

  static BannerModel fromDomain(Banner b) => BannerModel(
    id: b.id,
    titulo: b.titulo,
    descuento: b.descuento,
    subtitulo: b.subtitulo,
    colorInicio: b.colorInicio,
    colorFin: b.colorFin,
    imagenUrl: b.imagenUrl,
    activo: b.activo,
    orden: b.orden,
    fechaCreacion: b.fechaCreacion,
  );
}