import 'package:fruti_express_jahr_admin/features/inventory/data/models/inventory_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'inventory_remote_datasource.dart';

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final SupabaseClient supabase;

  static const String _tableName = 'inventory';
  static const String _colProductId = 'product_id';
  static const String _colBranchId = 'branch_id';
  static const String _colAvailableStock = 'available_stock';

  static const String _adjustInventoryStockRpc = 'adjust_inventory_stock';
  static const String _productIdParam = 'p_product_id';
  static const String _branchIdParam = 'p_branch_id';
  static const String _quantityChangeParam = 'p_quantity_change';

  InventoryRemoteDataSourceImpl(this.supabase);

  @override
  Future<InventoryModel> create(InventoryModel model) async {
    final response = await supabase
        .from(_tableName)
        .insert(model.toJson())
        .select()
        .single();
    return InventoryModel.fromJson(response);
  }

  @override
  Future<List<InventoryModel>> getByProduct(String productId) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colProductId, productId);
    return (response as List).map((json) => InventoryModel.fromJson(json)).toList();
  }

  @override
  Stream<List<InventoryModel>> watchByBranch(String branchId) {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colBranchId, _colProductId])
        .eq(_colBranchId, branchId)
        .map((data) => data.map((json) => InventoryModel.fromJson(json)).toList());
  }

  @override
  Future<InventoryModel?> get({
    required String productId,
    required String branchId,
  }) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colProductId, productId)
        .eq(_colBranchId, branchId)
        .maybeSingle();

    return response != null ? InventoryModel.fromJson(response) : null;
  }

  @override
  Future<InventoryModel> update(InventoryModel model) async {
    final response = await supabase
        .from(_tableName)
        .upsert(model.toJson())
        .select()
        .single();

    return InventoryModel.fromJson(response);
  }

  @override
  Future<List<InventoryModel>> getByBranch(String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colBranchId, branchId);

    return (response as List).map((json) => InventoryModel.fromJson(json)).toList();
  }

  @override
  Future<void> adjustStockAtomically({
    required String productId,
    required String branchId,
    required int quantityChange,
  }) async {
    await supabase.rpc(
      _adjustInventoryStockRpc,
      params: {
        _productIdParam: productId,
        _branchIdParam: branchId,
        _quantityChangeParam: quantityChange,
      },
    );
  }

  @override
  Future<int> getCurrentStock(String productId, String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select(_colAvailableStock)
        .eq(_colProductId, productId)
        .eq(_colBranchId, branchId)
        .maybeSingle();

    return response?[_colAvailableStock] ?? 0;
  }
}