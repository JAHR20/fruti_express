// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_typography_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerTypographyConfigModel _$BannerTypographyConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerTypographyConfigModel(
  title: json['title'] == null
      ? null
      : BannerTextStyleConfigModel.fromJson(
          json['title'] as Map<String, dynamic>,
        ),
  discount: json['discount'] == null
      ? null
      : BannerTextStyleConfigModel.fromJson(
          json['discount'] as Map<String, dynamic>,
        ),
  subtitle: json['subtitle'] == null
      ? null
      : BannerTextStyleConfigModel.fromJson(
          json['subtitle'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$BannerTypographyConfigModelToJson(
  _BannerTypographyConfigModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'discount': instance.discount,
  'subtitle': instance.subtitle,
};
