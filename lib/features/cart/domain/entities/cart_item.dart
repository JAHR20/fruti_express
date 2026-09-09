import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart'; 

@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required String productId, 
    required String name, 
    String? imageUrl, 
    required int unitPrice, 
    required int quantity, 
    required MeasurementUnit measurementUnit,
    required String branchId, 
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => 
      _$CartItemFromJson(json);

  int get subtotal {
    if (measurementUnit == MeasurementUnit.gram || 
        measurementUnit == MeasurementUnit.milliliter) {
      return ((quantity / 1000) * unitPrice).round();
    }
    return quantity * unitPrice;
  }
}