// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_format_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerFormatConfigModel _$BannerFormatConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerFormatConfigModel(
  template:
      $enumDecodeNullable(
        _$BannerTemplateEnumMap,
        json['template'],
        unknownValue: BannerTemplate.centered,
      ) ??
      BannerTemplate.centered,
  background: json['background'] == null
      ? const BannerBackgroundConfigModel()
      : BannerBackgroundConfigModel.fromJson(
          json['background'] as Map<String, dynamic>,
        ),
  layout: json['layout'] == null
      ? const BannerLayoutConfigModel()
      : BannerLayoutConfigModel.fromJson(
          json['layout'] as Map<String, dynamic>,
        ),
  typography: json['typography'] == null
      ? const BannerTypographyConfigModel()
      : BannerTypographyConfigModel.fromJson(
          json['typography'] as Map<String, dynamic>,
        ),
  image: json['image'] == null
      ? null
      : BannerImageConfigModel.fromJson(json['image'] as Map<String, dynamic>),
  button: json['button'] == null
      ? null
      : BannerButtonConfigModel.fromJson(
          json['button'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$BannerFormatConfigModelToJson(
  _BannerFormatConfigModel instance,
) => <String, dynamic>{
  'template': _$BannerTemplateEnumMap[instance.template]!,
  'background': instance.background,
  'layout': instance.layout,
  'typography': instance.typography,
  'image': instance.image,
  'button': instance.button,
};

const _$BannerTemplateEnumMap = {
  BannerTemplate.imageRight: 'imageRight',
  BannerTemplate.imageLeft: 'imageLeft',
  BannerTemplate.backgroundImage: 'backgroundImage',
  BannerTemplate.split: 'split',
  BannerTemplate.centered: 'centered',
  BannerTemplate.productFocus: 'productFocus',
  BannerTemplate.asymmetric: 'asymmetric',
};
