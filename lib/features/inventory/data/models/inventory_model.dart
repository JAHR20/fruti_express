import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';

part 'inventory_model.freezed.dart';
part 'inventory_model.g.dart';

@freezed
abstract class InventoryModel with _$InventoryModel {
  const factory InventoryModel({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'branch_id') required String branchId,
    @JsonKey(name: 'available_stock') required int availableStock,
    @JsonKey(name: 'reserved_stock') required int reservedStock,
    @JsonKey(name: 'local_price') int? localPrice,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _InventoryModel;

  factory InventoryModel.fromJson(Map<String, dynamic> json) =>
      _$InventoryModelFromJson(json);
}

extension InventoryModelX on InventoryModel {
  Inventory toDomain() => Inventory(
    productId: productId,
    branchId: branchId,
    availableStock: availableStock,
    reservedStock: reservedStock,
    localPrice: localPrice,
    updatedAt: updatedAt,
  );

  static InventoryModel fromDomain(Inventory i) => InventoryModel(
    productId: i.productId,
    branchId: i.branchId,
    availableStock: i.availableStock,
    reservedStock: i.reservedStock,
    localPrice: i.localPrice,
    updatedAt: i.updatedAt,
  );
}