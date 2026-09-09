import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/promo_banner.dart'; // Importamos la nueva entidad

part 'promo_banner_model.freezed.dart';
part 'promo_banner_model.g.dart';

@freezed
abstract class PromoBannerModel with _$PromoBannerModel { 
  const factory PromoBannerModel({
    required String id,
    @JsonKey(name: 'title') required String title, 
    @JsonKey(name: 'discount') required String discount,
    @JsonKey(name: 'subtitle') required String subtitle,
    @JsonKey(name: 'start_color') required String startColor,
    @JsonKey(name: 'end_color') required String endColor, 
    @JsonKey(name: 'image_url') String? imageUrl, 
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'display_order') required int sortOrder, 
    @JsonKey(name: 'created_at') required DateTime createdAt, 
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
    isActive: isActive,
    sortOrder: sortOrder,
    createdAt: createdAt,
  );

  static PromoBannerModel fromDomain(PromoBanner b) => PromoBannerModel(
    id: b.id,
    title: b.title,
    discount: b.discount,
    subtitle: b.subtitle,
    startColor: b.startColor,
    endColor: b.endColor,
    imageUrl: b.imageUrl,
    isActive: b.isActive,
    sortOrder: b.sortOrder,
    createdAt: b.createdAt,
  );
}