import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/entities/banner_text_style_config.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_font_weight.dart';
import 'package:fruti_express_jahr_admin/features/banners/domain/enums/banner_text_alignment.dart';

part 'banner_text_style_config_model.freezed.dart';
part 'banner_text_style_config_model.g.dart';

@freezed
abstract class BannerTextStyleConfigModel with _$BannerTextStyleConfigModel {
  const BannerTextStyleConfigModel._();

  const factory BannerTextStyleConfigModel({
    @Default('#FFFFFF') String color,
    @Default(16.0) double fontSize,
    @Default(BannerFontWeight.w400)
    @JsonKey(unknownEnumValue: BannerFontWeight.w400)
    BannerFontWeight fontWeight,
    String? fontFamily,
    // null = hereda la alineación del layout.
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)
    BannerTextAlignment? alignment,
    @Default(1.2) double lineHeight,
    @Default(0.0) double letterSpacing,
    @Default(2) int maxLines,
    @Default(false) bool uppercase,
    @Default(false) bool underline,
    @Default(0.0) double rotation,
  }) = _BannerTextStyleConfigModel;

  factory BannerTextStyleConfigModel.fromJson(Map<String, dynamic> json) =>
      _$BannerTextStyleConfigModelFromJson(json);

  factory BannerTextStyleConfigModel.fromDomain(BannerTextStyleConfig e) =>
      BannerTextStyleConfigModel(
        color: e.color,
        fontSize: e.fontSize,
        fontWeight: e.fontWeight,
        fontFamily: e.fontFamily,
        alignment: e.alignment,
        lineHeight: e.lineHeight,
        letterSpacing: e.letterSpacing,
        maxLines: e.maxLines,
        uppercase: e.uppercase,
        underline: e.underline,
        rotation: e.rotation,
      );

  BannerTextStyleConfig toDomain() => BannerTextStyleConfig(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        alignment: alignment,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        uppercase: uppercase,
        underline: underline,
        rotation: rotation,
      );
}