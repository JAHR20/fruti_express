import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/order_preview.dart';

part 'order_preview_model.freezed.dart';
part 'order_preview_model.g.dart';

@freezed
abstract class OrderPreviewModel with _$OrderPreviewModel {
  const factory OrderPreviewModel({
    @Default(0) int subtotal,
    @JsonKey(
      name: 'shipping_cost',
      readValue: _readShippingCost,
    )
    @Default(0)
    int shippingCost,
    @Default(0) int discount,
    @Default(0) int total,
  }) = _OrderPreviewModel;

  factory OrderPreviewModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPreviewModelFromJson(json);
}

// 🛠️ Lee indistintamente 'shipping_cost' o 'shipping_fee' desde la base de datos
Object? _readShippingCost(Map dynamicMap, String fieldName) {
  return dynamicMap['shipping_cost'] ?? dynamicMap['shipping_fee'];
}

// 🔥 Extensión para mapear de Datos a Dominio
extension OrderPreviewModelX on OrderPreviewModel {
  OrderPreview toDomain() => OrderPreview(
    subtotal: subtotal,
    shippingCost: shippingCost,
    discount: discount,
    total: total,
  );

  static OrderPreviewModel fromDomain(OrderPreview preview) => OrderPreviewModel(
    subtotal: preview.subtotal,
    shippingCost: preview.shippingCost,
    discount: preview.discount,
    total: preview.total,
  );
}