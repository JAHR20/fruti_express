import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_border_config.freezed.dart';

@freezed
abstract class BannerBorderConfig with _$BannerBorderConfig {
  const factory BannerBorderConfig({
    @Default(false) bool enabled,

    @Default('#FFFFFF') String color,

    @Default(1.0) double width,

    @Default(16.0) double radius,
  }) = _BannerBorderConfig;
}