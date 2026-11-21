// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_layout_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerLayoutConfigModel _$BannerLayoutConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerLayoutConfigModel(
  paddingTop: (json['paddingTop'] as num?)?.toDouble() ?? 16.0,
  paddingRight: (json['paddingRight'] as num?)?.toDouble() ?? 16.0,
  paddingBottom: (json['paddingBottom'] as num?)?.toDouble() ?? 16.0,
  paddingLeft: (json['paddingLeft'] as num?)?.toDouble() ?? 16.0,
  elementSpacing: (json['elementSpacing'] as num?)?.toDouble() ?? 8.0,
  horizontalAlignment:
      $enumDecodeNullable(
        _$BannerTextAlignmentEnumMap,
        json['horizontalAlignment'],
        unknownValue: BannerTextAlignment.left,
      ) ??
      BannerTextAlignment.left,
  verticalAlignment:
      $enumDecodeNullable(
        _$BannerVerticalAlignmentEnumMap,
        json['verticalAlignment'],
        unknownValue: BannerVerticalAlignment.center,
      ) ??
      BannerVerticalAlignment.center,
  offsetX: (json['offsetX'] as num?)?.toDouble() ?? 0.0,
  offsetY: (json['offsetY'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BannerLayoutConfigModelToJson(
  _BannerLayoutConfigModel instance,
) => <String, dynamic>{
  'paddingTop': instance.paddingTop,
  'paddingRight': instance.paddingRight,
  'paddingBottom': instance.paddingBottom,
  'paddingLeft': instance.paddingLeft,
  'elementSpacing': instance.elementSpacing,
  'horizontalAlignment':
      _$BannerTextAlignmentEnumMap[instance.horizontalAlignment]!,
  'verticalAlignment':
      _$BannerVerticalAlignmentEnumMap[instance.verticalAlignment]!,
  'offsetX': instance.offsetX,
  'offsetY': instance.offsetY,
};

const _$BannerTextAlignmentEnumMap = {
  BannerTextAlignment.left: 'left',
  BannerTextAlignment.center: 'center',
  BannerTextAlignment.right: 'right',
};

const _$BannerVerticalAlignmentEnumMap = {
  BannerVerticalAlignment.top: 'top',
  BannerVerticalAlignment.center: 'center',
  BannerVerticalAlignment.bottom: 'bottom',
};
