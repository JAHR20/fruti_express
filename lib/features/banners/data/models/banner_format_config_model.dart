import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_format_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_template.dart';
import 'banner_background_config_model.dart';
import 'banner_button_config_model.dart';
import 'banner_image_config_model.dart';
import 'banner_layout_config_model.dart';
import 'banner_typography_config_model.dart';

part 'banner_format_config_model.freezed.dart';
part 'banner_format_config_model.g.dart';

@freezed
abstract class BannerFormatConfigModel with _$BannerFormatConfigModel {
  const BannerFormatConfigModel._();

  const factory BannerFormatConfigModel({
    @Default(BannerTemplate.centered)
    @JsonKey(unknownEnumValue: BannerTemplate.centered)
    BannerTemplate template,
    @Default(BannerBackgroundConfigModel())
    BannerBackgroundConfigModel background,
    @Default(BannerLayoutConfigModel()) BannerLayoutConfigModel layout,
    @Default(BannerTypographyConfigModel())
    BannerTypographyConfigModel typography,
    BannerImageConfigModel? image,
    BannerButtonConfigModel? button,
  }) = _BannerFormatConfigModel;

  factory BannerFormatConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerFormatConfigModelFromJson(json);

  factory BannerFormatConfigModel.fromDomain(BannerFormatConfig e) =>
      BannerFormatConfigModel(
        template: e.template,
        background: BannerBackgroundConfigModel.fromDomain(e.background),
        layout: BannerLayoutConfigModel.fromDomain(e.layout),
        typography: BannerTypographyConfigModel.fromDomain(e.typography),
        image: e.image == null
            ? null
            : BannerImageConfigModel.fromDomain(e.image!),
        button: e.button == null
            ? null
            : BannerButtonConfigModel.fromDomain(e.button!),
      );

  BannerFormatConfig toDomain() => BannerFormatConfig(
        template: template,
        background: background.toDomain(),
        layout: layout.toDomain(),
        typography: typography.toDomain(),
        image: image?.toDomain(),
        button: button?.toDomain(),
      );
}