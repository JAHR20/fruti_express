import 'dart:io';
import 'package:fruti_express_jahr_admin/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAll();
  Future<List<ProductModel>> getByCategory(String categoryId, String branchId);
  Future<ProductModel?> getById(String id);
  Future<ProductModel?> getByName(String name);
  Future<bool> existsByName(String name);
  Future<List<ProductModel>> searchProducts(String query, String branchId);
  Future<ProductModel> create(ProductModel model);
  Future<ProductModel> update(ProductModel model);
  Future<String> uploadImage(File file, String fileName);
  Future<void> delete(String id);
  Future<List<ProductModel>> getByBranch(String branchId);
}