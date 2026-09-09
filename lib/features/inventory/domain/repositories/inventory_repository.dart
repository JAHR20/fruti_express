import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';

abstract class InventoryRepository {
  ResultTask<Inventory> create(Inventory inventory); 
  ResultTask<Inventory> update(Inventory inventory); 
  ResultTask<Inventory?> get({ 
    required String productId,
    required String branchId,
  });
  ResultTask<List<Inventory>> getByProduct(String productId);
  ResultTask<List<Inventory>> getByBranch(String branchId); 
  ResultTask<Unit> adjustStockAtomically({ 
    required String productId,
    required String branchId,
    required int quantityChange, 
  });
  ResultStream<List<Inventory>> watchByBranch(String branchId); 
  ResultTask<int> getCurrentStock(String productId, String branchId); 
}