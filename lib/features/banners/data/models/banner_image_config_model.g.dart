// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_image_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerImageConfigModel _$BannerImageConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerImageConfigModel(
  imagePath: json['imagePath'] as String? ?? '',
  position:
      $enumDecodeNullable(
        _$BannerImagePositionEnumMap,
        json['position'],
        unknownValue: BannerImagePosition.right,
      ) ??
      BannerImagePosition.right,
  fit:
      $enumDecodeNullable(
        _$BannerImageFitEnumMap,
        json['fit'],
        unknownValue: BannerImageFit.cover,
      ) ??
      BannerImageFit.cover,
  widthPercent: (json['widthPercent'] as num?)?.toDouble() ?? 40.0,
  heightPercent: (json['heightPercent'] as num?)?.toDouble() ?? 100.0,
  opacity: (json['opacity'] as num?)?.toDouble() ?? 1.0,
  offsetX: (json['offsetX'] as num?)?.toDouble() ?? 0.0,
  offsetY: (json['offsetY'] as num?)?.toDouble() ?? 0.0,
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
  borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 12.0,
  visible: json['visible'] as bool? ?? true,
);

Map<String, dynamic> _$BannerImageConfigModelToJson(
  _BannerImageConfigModel instance,
) => <String, dynamic>{
  'imagePath': instance.imagePath,
  'position': _$BannerImagePositionEnumMap[instance.position]!,
  'fit': _$BannerImageFitEnumMap[instance.fit]!,
  'widthPercent': instance.widthPercent,
  'heightPercent': instance.heightPercent,
  'opacity': instance.opacity,
  'offsetX': instance.offsetX,
  'offsetY': instance.offsetY,
  'rotation': instance.rotation,
  'borderRadius': instance.borderRadius,
  'visible': instance.visible,
};

const _$BannerImagePositionEnumMap = {
  BannerImagePosition.left: 'left',
  BannerImagePosition.right: 'right',
  BannerImagePosition.top: 'top',
  BannerImagePosition.bottom: 'bottom',
  BannerImagePosition.center: 'center',
};

const _$BannerImageFitEnumMap = {
  BannerImageFit.cover: 'cover',
  BannerImageFit.contain: 'contain',
  BannerImageFit.fill: 'fill',
};
