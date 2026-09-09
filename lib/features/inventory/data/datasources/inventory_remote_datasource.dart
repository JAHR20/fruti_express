import 'package:fruti_express_jahr_admin/features/inventory/data/models/inventory_model.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryModel?> get({
    required String productId,
    required String branchId,
  });
  
  Future<InventoryModel> update(InventoryModel model);
  
  Future<List<InventoryModel>> getByBranch(String branchId);
  
  Future<InventoryModel> create(InventoryModel model);
  
  Future<List<InventoryModel>> getByProduct(String productId);
  
  Stream<List<InventoryModel>> watchByBranch(String branchId);
  
  Future<void> adjustStockAtomically({
    required String productId,
    required String branchId,
    required int quantityChange,
  });
  
  Future<int> getCurrentStock(String productId, String branchId);
}