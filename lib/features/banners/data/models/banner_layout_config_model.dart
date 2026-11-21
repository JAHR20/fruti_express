import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_layout_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_text_alignment.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_vertical_alignment.dart';

part 'banner_layout_config_model.freezed.dart';
part 'banner_layout_config_model.g.dart';

@freezed
abstract class BannerLayoutConfigModel with _$BannerLayoutConfigModel {
  const BannerLayoutConfigModel._();

  const factory BannerLayoutConfigModel({
    @Default(16.0) double paddingTop,
    @Default(16.0) double paddingRight,
    @Default(16.0) double paddingBottom,
    @Default(16.0) double paddingLeft,
    @Default(8.0) double elementSpacing,
    @Default(BannerTextAlignment.left)
    @JsonKey(unknownEnumValue: BannerTextAlignment.left)
    BannerTextAlignment horizontalAlignment,
    @Default(BannerVerticalAlignment.center)
    @JsonKey(unknownEnumValue: BannerVerticalAlignment.center)
    BannerVerticalAlignment verticalAlignment,
    @Default(0.0) double offsetX,
    @Default(0.0) double offsetY,
  }) = _BannerLayoutConfigModel;

  factory BannerLayoutConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerLayoutConfigModelFromJson(json);

  factory BannerLayoutConfigModel.fromDomain(BannerLayoutConfig e) =>
      BannerLayoutConfigModel(
        paddingTop: e.paddingTop,
        paddingRight: e.paddingRight,
        paddingBottom: e.paddingBottom,
        paddingLeft: e.paddingLeft,
        elementSpacing: e.elementSpacing,
        horizontalAlignment: e.horizontalAlignment,
        verticalAlignment: e.verticalAlignment,
        offsetX: e.offsetX,
        offsetY: e.offsetY,
      );

  BannerLayoutConfig toDomain() => BannerLayoutConfig(
        paddingTop: paddingTop,
        paddingRight: paddingRight,
        paddingBottom: paddingBottom,
        paddingLeft: paddingLeft,
        elementSpacing: elementSpacing,
        horizontalAlignment: horizontalAlignment,
        verticalAlignment: verticalAlignment,
        offsetX: offsetX,
        offsetY: offsetY,
      );
}