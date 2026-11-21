// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_text_style_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerTextStyleConfigModel _$BannerTextStyleConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerTextStyleConfigModel(
  color: json['color'] as String? ?? '#FFFFFF',
  fontSize: (json['fontSize'] as num?)?.toDouble() ?? 16.0,
  fontWeight:
      $enumDecodeNullable(
        _$BannerFontWeightEnumMap,
        json['fontWeight'],
        unknownValue: BannerFontWeight.w400,
      ) ??
      BannerFontWeight.w400,
  fontFamily: json['fontFamily'] as String?,
  alignment: $enumDecodeNullable(
    _$BannerTextAlignmentEnumMap,
    json['alignment'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  lineHeight: (json['lineHeight'] as num?)?.toDouble() ?? 1.2,
  letterSpacing: (json['letterSpacing'] as num?)?.toDouble() ?? 0.0,
  maxLines: (json['maxLines'] as num?)?.toInt() ?? 2,
  uppercase: json['uppercase'] as bool? ?? false,
  underline: json['underline'] as bool? ?? false,
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BannerTextStyleConfigModelToJson(
  _BannerTextStyleConfigModel instance,
) => <String, dynamic>{
  'color': instance.color,
  'fontSize': instance.fontSize,
  'fontWeight': _$BannerFontWeightEnumMap[instance.fontWeight]!,
  'fontFamily': instance.fontFamily,
  'alignment': _$BannerTextAlignmentEnumMap[instance.alignment],
  'lineHeight': instance.lineHeight,
  'letterSpacing': instance.letterSpacing,
  'maxLines': instance.maxLines,
  'uppercase': instance.uppercase,
  'underline': instance.underline,
  'rotation': instance.rotation,
};

const _$BannerFontWeightEnumMap = {
  BannerFontWeight.w300: 'w300',
  BannerFontWeight.w400: 'w400',
  BannerFontWeight.w500: 'w500',
  BannerFontWeight.w600: 'w600',
  BannerFontWeight.w700: 'w700',
  BannerFontWeight.w800: 'w800',
  BannerFontWeight.w900: 'w900',
};

const _$BannerTextAlignmentEnumMap = {
  BannerTextAlignment.left: 'left',
  BannerTextAlignment.center: 'center',
  BannerTextAlignment.right: 'right',
};
