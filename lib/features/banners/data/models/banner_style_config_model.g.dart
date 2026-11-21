// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_style_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerStyleConfigModel _$BannerStyleConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerStyleConfigModel(
  version: (json['version'] as num?)?.toInt() ?? 1,
  defaultFormat:
      $enumDecodeNullable(
        _$BannerFormatEnumMap,
        json['defaultFormat'],
        unknownValue: BannerFormat.carouselCard,
      ) ??
      BannerFormat.carouselCard,
  formats: json['formats'] == null
      ? const {}
      : const BannerFormatsConverter().fromJson(
          json['formats'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$BannerStyleConfigModelToJson(
  _BannerStyleConfigModel instance,
) => <String, dynamic>{
  'version': instance.version,
  'defaultFormat': _$BannerFormatEnumMap[instance.defaultFormat]!,
  'formats': const BannerFormatsConverter().toJson(instance.formats),
};

const _$BannerFormatEnumMap = {
  BannerFormat.heroWide: 'heroWide',
  BannerFormat.carouselCard: 'carouselCard',
  BannerFormat.square: 'square',
  BannerFormat.portrait: 'portrait',
};
