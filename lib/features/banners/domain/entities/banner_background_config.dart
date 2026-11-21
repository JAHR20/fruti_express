import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_background_type.dart';

part 'banner_background_config.freezed.dart';

@freezed
abstract class BannerBackgroundConfig with _$BannerBackgroundConfig {
  const factory BannerBackgroundConfig({
    @Default(BannerBackgroundType.linearGradient)
    BannerBackgroundType type,

    @Default('#0C700F') String primaryColor,
    @Default('#F9A826') String secondaryColor,
    String? tertiaryColor,

    // Gradiente.
    @Default(0.0) double gradientAngle,

    // Imagen de fondo.
    String? imagePath,

    // Superposición sobre el fondo.
    String? overlayColor,
    @Default(0.0) double overlayOpacity,
  }) = _BannerBackgroundConfig;
}