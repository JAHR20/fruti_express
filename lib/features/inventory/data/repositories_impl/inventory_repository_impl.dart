import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/inventory/data/datasources/inventory_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/inventory/data/models/inventory_model.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/entities/inventory.dart';
import 'package:fruti_express_jahr_admin/features/inventory/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl
    with SupabaseHandleException
    implements InventoryRepository {
  final InventoryRemoteDataSource remoteDataSource;

  InventoryRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<Inventory> create(Inventory inventory) =>
      TaskEither.tryCatch(() async {
        final model = InventoryModelX.fromDomain(inventory);
        final created = await remoteDataSource.create(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Inventory> update(Inventory inventory) =>
      TaskEither.tryCatch(() async {
        final model = InventoryModelX.fromDomain(inventory);
        final updated = await remoteDataSource.update(model);
        return updated.toDomain();
      }, handleException);

  @override
  ResultTask<Inventory?> get({
    required String productId,
    required String branchId,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDataSource.get(
      productId: productId,
      branchId: branchId,
    );
    return model?.toDomain();
  }, handleException);

  @override
  ResultTask<List<Inventory>> getByProduct(String productId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.getByProduct(productId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<List<Inventory>> getByBranch(String branchId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.getByBranch(branchId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultStream<List<Inventory>> watchByBranch(String branchId) {
    return remoteDataSource
        .watchByBranch(branchId)
        .map<Either<Failure, List<Inventory>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Unit> adjustStockAtomically({
    required String productId,
    required String branchId,
    required int quantityChange,
  }) => TaskEither.tryCatch(() async {
    await remoteDataSource.adjustStockAtomically(
      productId: productId,
      branchId: branchId,
      quantityChange: quantityChange,
    );
    return unit;
  }, handleException);

  @override
  ResultTask<int> getCurrentStock(String productId, String branchId) =>
      TaskEither.tryCatch(
        () => remoteDataSource.getCurrentStock(productId, branchId),
        handleException,
      );
}