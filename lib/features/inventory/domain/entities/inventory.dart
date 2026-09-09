import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

part 'inventory.freezed.dart';

@freezed
abstract class Inventory with _$Inventory {
  const Inventory._();

  const factory Inventory({
    required String productId, 
    required String branchId, 
    required int availableStock, 
    required int reservedStock, 
    int? localPrice, 
    required DateTime updatedAt, 
  }) = _Inventory;

  bool get hasLocalPrice => localPrice != null; 

  int finalPrice(Product product) => 
      localPrice ?? product.currentPrice;

  bool hasGlobalDiscount(Product product) =>
      !hasLocalPrice && product.hasDiscount;

  bool isCriticalStock(Product product) {

    return availableStock <= 5;
  }
}