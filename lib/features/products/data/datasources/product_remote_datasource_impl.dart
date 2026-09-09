import 'dart:io';
import 'package:fruti_express_jahr_admin/features/products/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SupabaseClient supabase;

  static const String _tableName = 'products';
  static const String _colId = 'id';
  static const String _colName = 'name';
  static const String _colIsActive = 'is_active';
  static const String _colCategoryId = 'category_id';
  static const String _relInventory = 'inventory!inner(available_stock)';
  static const String _colInventoryBranchId = 'inventory.branch_id';

  ProductRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<ProductModel>> getAll() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .order(_colName, ascending: true);

    return (response as List)
        .map((json) => ProductModel.fromJson(json))
        .where((product) => product.id != null && product.id!.isNotEmpty)
        .toList();
  }

  @override
  Future<ProductModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();
    return response != null ? ProductModel.fromJson(response) : null;
  }

  @override
  Future<ProductModel?> getByName(String name) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colName, name)
        .maybeSingle();
    return response != null ? ProductModel.fromJson(response) : null;
  }

  @override
  Future<bool> existsByName(String name) async {
    final response = await supabase
        .from(_tableName)
        .select(_colId)
        .eq(_colName, name)
        .maybeSingle();
    return response != null;
  }

  @override
  Future<List<ProductModel>> searchProducts(String query, String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select('*, $_relInventory')
        .ilike(_colName, '%$query%')
        .eq(_colInventoryBranchId, branchId);

    return (response as List).map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<ProductModel> create(ProductModel model) async {
    final Map<String, dynamic> productJson = model.toJson();
    productJson.removeWhere((key, value) => value == null || value == '');

    final response = await supabase
        .from(_tableName)
        .insert(productJson)
        .select()
        .single();
    return ProductModel.fromJson(response);
  }

  @override
  Future<ProductModel> update(ProductModel model) async {
    final Map<String, dynamic> productJson = model.toJson();
    productJson.removeWhere((key, value) => value == null || value == '');

    final response = await supabase
        .from(_tableName)
        .update(productJson)
        .eq(_colId, model.id!)
        .select()
        .single();
    return ProductModel.fromJson(response);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from(_tableName).update({_colIsActive: false}).eq(_colId, id);
  }

  @override
  Future<List<ProductModel>> getByCategory(String categoryId, String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select('*, $_relInventory')
        .eq(_colCategoryId, categoryId)
        .eq(_colInventoryBranchId, branchId);

    return (response as List).map((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<String> uploadImage(File file, String fileName) async {
    final String storagePath = 'catalogo/$fileName';
    final extension = fileName.split('.').last.toLowerCase();

    String contentType = 'image/jpeg'; 
    if (extension == 'png') contentType = 'image/png';
    if (extension == 'webp') contentType = 'image/webp';
    if (extension == 'heic') contentType = 'image/heic'; 

    await supabase.storage
        .from('imagenes_productos')
        .upload(
          storagePath,
          file,
          fileOptions: FileOptions(
            cacheControl: '3600',
            upsert: true,
            contentType: contentType, 
          ),
        );

    return supabase.storage
        .from('imagenes_productos')
        .getPublicUrl(storagePath);
  }

  @override
  Future<List<ProductModel>> getByBranch(String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select('*, $_relInventory')
        .eq(_colInventoryBranchId, branchId); 

    return (response as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}