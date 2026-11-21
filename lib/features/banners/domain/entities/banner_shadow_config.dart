import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_shadow_config.freezed.dart';

@freezed
abstract class BannerShadowConfig with _$BannerShadowConfig {
  const factory BannerShadowConfig({
    @Default(false) bool enabled,

    @Default('#000000') String color,

    @Default(0.15) double opacity,

    @Default(8.0) double blurRadius,

    @Default(2.0) double spreadRadius,

    @Default(0.0) double offsetX,
    @Default(4.0) double offsetY,
  }) = _BannerShadowConfig;
}