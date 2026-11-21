import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_format.dart';
import 'banner_format_config.dart';

part 'banner_style_config.freezed.dart';

@freezed
abstract class BannerStyleConfig with _$BannerStyleConfig {
  const factory BannerStyleConfig({
    required int version,
    required BannerFormat defaultFormat,
    required Map<BannerFormat, BannerFormatConfig> formats,
  }) = _BannerStyleConfig;
}