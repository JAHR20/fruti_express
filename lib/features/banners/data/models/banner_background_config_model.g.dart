// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_background_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerBackgroundConfigModel _$BannerBackgroundConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerBackgroundConfigModel(
  type:
      $enumDecodeNullable(
        _$BannerBackgroundTypeEnumMap,
        json['type'],
        unknownValue: BannerBackgroundType.linearGradient,
      ) ??
      BannerBackgroundType.linearGradient,
  primaryColor: json['primaryColor'] as String? ?? '#0C700F',
  secondaryColor: json['secondaryColor'] as String? ?? '#F9A826',
  tertiaryColor: json['tertiaryColor'] as String?,
  gradientAngle: (json['gradientAngle'] as num?)?.toDouble() ?? 0.0,
  imagePath: json['imagePath'] as String?,
  overlayColor: json['overlayColor'] as String?,
  overlayOpacity: (json['overlayOpacity'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BannerBackgroundConfigModelToJson(
  _BannerBackgroundConfigModel instance,
) => <String, dynamic>{
  'type': _$BannerBackgroundTypeEnumMap[instance.type]!,
  'primaryColor': instance.primaryColor,
  'secondaryColor': instance.secondaryColor,
  'tertiaryColor': instance.tertiaryColor,
  'gradientAngle': instance.gradientAngle,
  'imagePath': instance.imagePath,
  'overlayColor': instance.overlayColor,
  'overlayOpacity': instance.overlayOpacity,
};

const _$BannerBackgroundTypeEnumMap = {
  BannerBackgroundType.solid: 'solid',
  BannerBackgroundType.linearGradient: 'linearGradient',
  BannerBackgroundType.radialGradient: 'radialGradient',
  BannerBackgroundType.image: 'image',
};
