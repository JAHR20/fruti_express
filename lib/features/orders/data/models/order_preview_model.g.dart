// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderPreviewModel _$OrderPreviewModelFromJson(Map<String, dynamic> json) =>
    _OrderPreviewModel(
      subtotal: (json['subtotal'] as num?)?.toInt() ?? 0,
      shippingCost:
          (_readShippingCost(json, 'shipping_cost') as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$OrderPreviewModelToJson(_OrderPreviewModel instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'shipping_cost': instance.shippingCost,
      'discount': instance.discount,
      'total': instance.total,
    };
