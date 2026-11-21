import 'package:freezed_annotation/freezed_annotation.dart';
import 'banner_text_style_config.dart';

part 'banner_typography_config.freezed.dart';

@freezed
abstract class BannerTypographyConfig with _$BannerTypographyConfig {
  const factory BannerTypographyConfig({
    BannerTextStyleConfig? title,
    BannerTextStyleConfig? discount,
    BannerTextStyleConfig? subtitle,
  }) = _BannerTypographyConfig;
}