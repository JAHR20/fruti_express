import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_background_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_background_type.dart';

part 'banner_background_config_model.freezed.dart';
part 'banner_background_config_model.g.dart';

@freezed
abstract class BannerBackgroundConfigModel with _$BannerBackgroundConfigModel {
  const BannerBackgroundConfigModel._();

  const factory BannerBackgroundConfigModel({
    @Default(BannerBackgroundType.linearGradient)
    @JsonKey(unknownEnumValue: BannerBackgroundType.linearGradient)
    BannerBackgroundType type,
    @Default('#0C700F') String primaryColor,
    @Default('#F9A826') String secondaryColor,
    String? tertiaryColor,
    @Default(0.0) double gradientAngle,
    String? imagePath,
    String? overlayColor,
    @Default(0.0) double overlayOpacity,
  }) = _BannerBackgroundConfigModel;

  factory BannerBackgroundConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerBackgroundConfigModelFromJson(json);

  factory BannerBackgroundConfigModel.fromDomain(BannerBackgroundConfig e) =>
      BannerBackgroundConfigModel(
        type: e.type,
        primaryColor: e.primaryColor,
        secondaryColor: e.secondaryColor,
        tertiaryColor: e.tertiaryColor,
        gradientAngle: e.gradientAngle,
        imagePath: e.imagePath,
        overlayColor: e.overlayColor,
        overlayOpacity: e.overlayOpacity,
      );

  BannerBackgroundConfig toDomain() => BannerBackgroundConfig(
        type: type,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        tertiaryColor: tertiaryColor,
        gradientAngle: gradientAngle,
        imagePath: imagePath,
        overlayColor: overlayColor,
        overlayOpacity: overlayOpacity,
      );
}