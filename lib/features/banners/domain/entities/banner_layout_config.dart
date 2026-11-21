import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_text_alignment.dart';
import '../enums/banner_vertical_alignment.dart';

part 'banner_layout_config.freezed.dart';

@freezed
abstract class BannerLayoutConfig with _$BannerLayoutConfig {
  const factory BannerLayoutConfig({
    // Espaciado interior.
    @Default(16.0) double paddingTop,
    @Default(16.0) double paddingRight,
    @Default(16.0) double paddingBottom,
    @Default(16.0) double paddingLeft,

    // Separación entre elementos.
    @Default(8.0) double elementSpacing,

    // Alineación del contenido.
    @Default(BannerTextAlignment.left)
    BannerTextAlignment horizontalAlignment,

    @Default(BannerVerticalAlignment.center)
    BannerVerticalAlignment verticalAlignment,

    // Desplazamiento del contenido.
    @Default(0.0) double offsetX,
    @Default(0.0) double offsetY,
  }) = _BannerLayoutConfig;
}