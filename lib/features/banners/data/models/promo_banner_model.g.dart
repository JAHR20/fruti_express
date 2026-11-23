// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromoBannerModel _$PromoBannerModelFromJson(Map<String, dynamic> json) =>
    _PromoBannerModel(
      id: json['id'] as String,
      title: json['title'] as String,
      discount: json['discount'] as String,
      subtitle: json['subtitle'] as String,
      startColor: json['start_color'] as String,
      endColor: json['end_color'] as String,
      imageUrl: json['image_url'] as String?,
      styleConfig: json['style_config'] == null
          ? null
          : BannerStyleConfigModel.fromJson(
              json['style_config'] as Map<String, dynamic>,
            ),
      isActive: json['is_active'] as bool,
      sortOrder: (json['display_order'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      startsAt: json['starts_at'] == null
          ? null
          : DateTime.parse(json['starts_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
    );

Map<String, dynamic> _$PromoBannerModelToJson(_PromoBannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'discount': instance.discount,
      'subtitle': instance.subtitle,
      'start_color': instance.startColor,
      'end_color': instance.endColor,
      'image_url': instance.imageUrl,
      'style_config': instance.styleConfig?.toJson(),
      'is_active': instance.isActive,
      'display_order': instance.sortOrder,
      'created_at': instance.createdAt.toIso8601String(),
      'starts_at': instance.startsAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
    };
