import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/products/data/datasources/product_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/products/data/models/product_model.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/entities/product.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/repositories/product_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductRepositoryImpl
    with SupabaseHandleException
    implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<List<Product>> getAll() => TaskEither.tryCatch(
    () async {
      final models = await remoteDataSource.getAll();
      return models.map((m) => m.toDomain()).toList();
    },
    handleException,
  );

  @override
  ResultTask<List<Product>> getByCategory(String categoryId, String branchId) =>
      TaskEither.tryCatch(
        () async {
          final models = await remoteDataSource.getByCategory(categoryId, branchId);
          return models.map((m) => m.toDomain()).toList();
        },
        handleException,
      );

  @override
  ResultTask<Product> getById(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDataSource.getById(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Producto no encontrado',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Product> getByName(String name) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.getByName(name);
        if (model == null) {
          throw const PostgrestException(
            message: 'Producto no encontrado',
            code: 'PGRST116',
          );
        }
        return model.toDomain();
      }, handleException);

  @override
  ResultTask<bool> existsByName(String name) => TaskEither.tryCatch(
    () async => remoteDataSource.existsByName(name),
    handleException,
  );

  @override
  ResultTask<List<Product>> searchProducts(String query, String branchId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.searchProducts(query, branchId);
        return models.map((model) => model.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<Product> create(Product product) => TaskEither.tryCatch(
    () async {
      final model = ProductModelX.fromDomain(product);
      final created = await remoteDataSource.create(model);
      return created.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Product> update(Product product) => TaskEither.tryCatch(
    () async {
      final model = ProductModelX.fromDomain(product);
      final updated = await remoteDataSource.update(model);
      return updated.toDomain();
    },
    handleException,
  );

  @override
  ResultTask<Unit> delete(String id) => TaskEither.tryCatch(() async {
    await remoteDataSource.delete(id);
    return unit;
  }, handleException);

  @override
  ResultTask<String> uploadImage(File file, String fileName) =>
      TaskEither.tryCatch(
        () async => remoteDataSource.uploadImage(file, fileName),
        handleException,
      );

  @override
  ResultTask<List<Product>> getByBranch(String branchId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.getByBranch(branchId);
        return models.map((model) => model.toDomain()).toList();
      }, handleException);

  @override
  Stream<void> watchInventoryChanges(String branchId) {
    return remoteDataSource.watchInventoryChanges(branchId);
  }
}