import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_image_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_image_fit.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_image_position.dart';

part 'banner_image_config_model.freezed.dart';
part 'banner_image_config_model.g.dart';

@freezed
abstract class BannerImageConfigModel with _$BannerImageConfigModel {
  const BannerImageConfigModel._();

  const factory BannerImageConfigModel({
    @Default('') String imagePath,
    @Default(BannerImagePosition.right)
    @JsonKey(unknownEnumValue: BannerImagePosition.right)
    BannerImagePosition position,
    @Default(BannerImageFit.cover)
    @JsonKey(unknownEnumValue: BannerImageFit.cover)
    BannerImageFit fit,
    @Default(40.0) double widthPercent,
    @Default(100.0) double heightPercent,
    @Default(1.0) double opacity,
    @Default(0.0) double offsetX,
    @Default(0.0) double offsetY,
    @Default(0.0) double rotation,
    @Default(12.0) double borderRadius,
    @Default(true) bool visible,
  }) = _BannerImageConfigModel;

  factory BannerImageConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerImageConfigModelFromJson(json);

  factory BannerImageConfigModel.fromDomain(BannerImageConfig e) =>
      BannerImageConfigModel(
        imagePath: e.imagePath,
        position: e.position,
        fit: e.fit,
        widthPercent: e.widthPercent,
        heightPercent: e.heightPercent,
        opacity: e.opacity,
        offsetX: e.offsetX,
        offsetY: e.offsetY,
        rotation: e.rotation,
        borderRadius: e.borderRadius,
        visible: e.visible,
      );

  BannerImageConfig toDomain() => BannerImageConfig(
        imagePath: imagePath,
        position: position,
        fit: fit,
        widthPercent: widthPercent,
        heightPercent: heightPercent,
        opacity: opacity,
        offsetX: offsetX,
        offsetY: offsetY,
        rotation: rotation,
        borderRadius: borderRadius,
        visible: visible,
      );
}