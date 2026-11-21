import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_typography_config.dart';
import 'banner_text_style_config_model.dart';

part 'banner_typography_config_model.freezed.dart';
part 'banner_typography_config_model.g.dart';

@freezed
abstract class BannerTypographyConfigModel with _$BannerTypographyConfigModel {
  const BannerTypographyConfigModel._();

  const factory BannerTypographyConfigModel({
    BannerTextStyleConfigModel? title,
    BannerTextStyleConfigModel? discount,
    BannerTextStyleConfigModel? subtitle,
  }) = _BannerTypographyConfigModel;

  factory BannerTypographyConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerTypographyConfigModelFromJson(json);

  factory BannerTypographyConfigModel.fromDomain(BannerTypographyConfig e) =>
      BannerTypographyConfigModel(
        title: e.title == null
            ? null
            : BannerTextStyleConfigModel.fromDomain(e.title!),
        discount: e.discount == null
            ? null
            : BannerTextStyleConfigModel.fromDomain(e.discount!),
        subtitle: e.subtitle == null
            ? null
            : BannerTextStyleConfigModel.fromDomain(e.subtitle!),
      );

  BannerTypographyConfig toDomain() => BannerTypographyConfig(
        title: title?.toDomain(),
        discount: discount?.toDomain(),
        subtitle: subtitle?.toDomain(),
      );
}