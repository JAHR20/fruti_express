import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_font_weight.dart';
import '../enums/banner_text_alignment.dart';

part 'banner_text_style_config.freezed.dart';

@freezed
abstract class BannerTextStyleConfig with _$BannerTextStyleConfig {
  const factory BannerTextStyleConfig({
    @Default('#FFFFFF') String color,

    @Default(16.0) double fontSize,

    @Default(BannerFontWeight.w400)
    BannerFontWeight fontWeight,

    String? fontFamily,

    BannerTextAlignment? alignment,

    @Default(1.2) double lineHeight,
    @Default(0.0) double letterSpacing,

    @Default(2) int maxLines,

    @Default(false) bool uppercase,
    @Default(false) bool underline,

    @Default(0.0) double rotation,
  }) = _BannerTextStyleConfig;
}