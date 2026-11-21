// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_button_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerButtonConfigModel _$BannerButtonConfigModelFromJson(
  Map<String, dynamic> json,
) => _BannerButtonConfigModel(
  enabled: json['enabled'] as bool? ?? false,
  text: json['text'] as String? ?? 'Ver más',
  textColor: json['textColor'] as String? ?? '#FFFFFF',
  backgroundColor: json['backgroundColor'] as String? ?? '#0C700F',
  borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 8.0,
  horizontalPadding: (json['horizontalPadding'] as num?)?.toDouble() ?? 12.0,
  verticalPadding: (json['verticalPadding'] as num?)?.toDouble() ?? 8.0,
  iconName: json['iconName'] as String?,
  actionType:
      $enumDecodeNullable(
        _$BannerActionTypeEnumMap,
        json['actionType'],
        unknownValue: BannerActionType.none,
      ) ??
      BannerActionType.none,
  actionValue: json['actionValue'] as String?,
);

Map<String, dynamic> _$BannerButtonConfigModelToJson(
  _BannerButtonConfigModel instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'text': instance.text,
  'textColor': instance.textColor,
  'backgroundColor': instance.backgroundColor,
  'borderRadius': instance.borderRadius,
  'horizontalPadding': instance.horizontalPadding,
  'verticalPadding': instance.verticalPadding,
  'iconName': instance.iconName,
  'actionType': _$BannerActionTypeEnumMap[instance.actionType]!,
  'actionValue': instance.actionValue,
};

const _$BannerActionTypeEnumMap = {
  BannerActionType.none: 'none',
  BannerActionType.category: 'category',
  BannerActionType.product: 'product',
  BannerActionType.promotions: 'promotions',
  BannerActionType.internalRoute: 'internalRoute',
};
