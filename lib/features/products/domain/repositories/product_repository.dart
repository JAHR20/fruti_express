import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  ResultTask<Product> create(Product product); 
  ResultTask<Product> update(Product product); 
  ResultTask<Product> getById(String id); 
  ResultTask<Product> getByName(String name); 
  ResultTask<bool> existsByName(String name); 
  ResultTask<List<Product>> getAll(); 
  ResultTask<List<Product>> getByCategory(String categoryId, String branchId); 
  ResultTask<List<Product>> searchProducts(String query, String branchId); 
  ResultTask<Unit> delete(String id); 
  ResultTask<String> uploadImage(File file, String fileName); 
  ResultTask<List<Product>> getByBranch(String branchId);
  Stream<void> watchInventoryChanges(String branchId);
}