// lib/features/banners/data/models/promo_banner_model.dart
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/data/models/banner_style_config_model.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart';

part 'promo_banner_model.freezed.dart';
part 'promo_banner_model.g.dart';

@freezed
abstract class PromoBannerModel with _$PromoBannerModel {
  @JsonSerializable(explicitToJson: true)
  const factory PromoBannerModel({
    required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'discount') required String discount,
    @JsonKey(name: 'subtitle') required String subtitle,
    @JsonKey(name: 'start_color') required String startColor,
    @JsonKey(name: 'end_color') required String endColor,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'style_config') BannerStyleConfigModel? styleConfig,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'display_order') required int sortOrder,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'starts_at') DateTime? startsAt,
    @JsonKey(name: 'ends_at') DateTime? endsAt,
  }) = _PromoBannerModel;

  factory PromoBannerModel.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerModelFromJson(json);
}

extension PromoBannerModelX on PromoBannerModel {
  PromoBanner toDomain() => PromoBanner(
    id: id,
    title: title,
    discount: discount,
    subtitle: subtitle,
    startColor: startColor,
    endColor: endColor,
    imageUrl: imageUrl,
    styleConfig: styleConfig?.toDomain(),
    isActive: isActive,
    sortOrder: sortOrder,
    createdAt: createdAt,
    startsAt: startsAt,
    endsAt: endsAt,
  );

  static PromoBannerModel fromDomain(PromoBanner b) => PromoBannerModel(
    id: b.id,
    title: b.title,
    discount: b.discount,
    subtitle: b.subtitle,
    startColor: b.startColor,
    endColor: b.endColor,
    imageUrl: b.imageUrl,
    styleConfig: b.styleConfig == null
        ? null
        : BannerStyleConfigModel.fromDomain(b.styleConfig!),
    isActive: b.isActive,
    sortOrder: b.sortOrder,
    createdAt: b.createdAt,
    // Siempre en UTC: sin zona horaria, la base de datos tomaría la hora como UTC
    // y el banner se programaría desfasado.
    startsAt: b.startsAt?.toUtc(),
    endsAt: b.endsAt?.toUtc(),
  );
}