import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/core/utils/measurement_unit_converter.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';
import '../../domain/entities/order_item.dart';

part 'order_item_model.freezed.dart';
part 'order_item_model.g.dart';

@freezed
abstract class OrderItemModel with _$OrderItemModel {
  const factory OrderItemModel({
    required String id,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name_snapshot') required String productNameSnapshot,
    required int quantity,
    @JsonKey(name: 'unit_price_snapshot') required int unitPriceSnapshot,
    @MeasurementUnitConverter()
    @JsonKey(name: 'measurement_unit') MeasurementUnit? measurementUnit,
  }) = _OrderItemModel;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);
}

extension OrderItemModelX on OrderItemModel {
  OrderItem toDomain() => OrderItem(
    id: id,
    orderId: orderId,
    productId: productId,
    productNameSnapshot: productNameSnapshot,
    quantity: quantity,
    unitPriceSnapshot: unitPriceSnapshot,
    measurementUnit: measurementUnit,
  );

  static OrderItemModel fromDomain(OrderItem item) => OrderItemModel(
    id: item.id,
    orderId: item.orderId,
    productId: item.productId,
    productNameSnapshot: item.productNameSnapshot,
    quantity: item.quantity,
    unitPriceSnapshot: item.unitPriceSnapshot,
    measurementUnit: item.measurementUnit,
  );
}