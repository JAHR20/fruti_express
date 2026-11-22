import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/banner_decoration_type.dart';

part 'banner_decoration_config.freezed.dart';

@freezed
abstract class BannerDecorationConfig with _$BannerDecorationConfig {
  const factory BannerDecorationConfig({
    required String id,

    required BannerDecorationType type,

    @Default('#FFFFFF') String color,

    @Default(0.2) double opacity,

    @Default(20.0) double widthPercent,
    @Default(20.0) double heightPercent,

    @Default(50.0) double positionX,
    @Default(50.0) double positionY,

    @Default(0.0) double rotation,

    @Default(0) int zIndex,

    @Default(true) bool visible,
  }) = _BannerDecorationConfig;
}