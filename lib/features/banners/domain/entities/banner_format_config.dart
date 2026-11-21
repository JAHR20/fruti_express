import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_template.dart';
import 'banner_background_config.dart';
import 'banner_layout_config.dart';
import 'banner_typography_config.dart';
import 'banner_image_config.dart';
import 'banner_button_config.dart';
import 'banner_decoration_config.dart';
import 'banner_border_config.dart';
import 'banner_shadow_config.dart';

part 'banner_format_config.freezed.dart';

@freezed
abstract class BannerFormatConfig with _$BannerFormatConfig {
  const factory BannerFormatConfig({
    required BannerTemplate template,
    required BannerBackgroundConfig background,
    required BannerLayoutConfig layout,
    required BannerTypographyConfig typography,
    BannerImageConfig? image,
    BannerButtonConfig? button,
    @Default([]) List<BannerDecorationConfig> decorations,
    BannerBorderConfig? border,
    BannerShadowConfig? shadow,
  }) = _BannerFormatConfig;
}