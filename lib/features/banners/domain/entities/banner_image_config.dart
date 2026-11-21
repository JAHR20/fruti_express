import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_image_fit.dart';
import '../enums/banner_image_position.dart';

part 'banner_image_config.freezed.dart';

@freezed
abstract class BannerImageConfig with _$BannerImageConfig {
  const factory BannerImageConfig({
    required String imagePath,

    @Default(BannerImagePosition.right)
    BannerImagePosition position,

    @Default(BannerImageFit.cover)
    BannerImageFit fit,

    @Default(40.0) double widthPercent,
    @Default(100.0) double heightPercent,

    @Default(1.0) double opacity,

    @Default(0.0) double offsetX,
    @Default(0.0) double offsetY,

    @Default(0.0) double rotation,

    @Default(12.0) double borderRadius,

    @Default(true) bool visible,
  }) = _BannerImageConfig;
}