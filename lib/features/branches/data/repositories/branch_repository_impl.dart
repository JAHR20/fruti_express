import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
// 🌟 Actualizado al datasource en inglés (lo traduciremos en el siguiente paso)
import 'package:fruti_express_jahr_admin/features/branches/data/datasources/branch_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/branches/data/models/branch_model.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/entities/branch.dart';
import 'package:fruti_express_jahr_admin/features/branches/domain/repositories/branch_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BranchRepositoryImpl
    with SupabaseHandleException
    implements BranchRepository {
  final BranchRemoteDatasource remoteDatasource;

  BranchRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Branch>> getAll() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.getAll();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<Branch> getById(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.getById(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Branch not found',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Branch> create(Branch branch) =>
      TaskEither.tryCatch(() async {
        final model = BranchModelX.fromDomain(branch);
        final created = await remoteDatasource.create(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Branch> update(Branch branch) =>
      TaskEither.tryCatch(() async {
        final model = BranchModelX.fromDomain(branch);
        final updated = await remoteDatasource.update(model);
        return updated.toDomain();
      }, handleException);

  @override
  ResultTask<Branch?> getByName(String name) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.getByName(name);
        return model?.toDomain();
      }, handleException);

  @override
  ResultStream<List<Branch>> watchAll() {
    return remoteDatasource
        .watchAll()
        .map<Either<Failure, List<Branch>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<List<String>> getCoverage(String branchId) =>
      TaskEither.tryCatch(
        () => remoteDatasource.getCoverage(branchId),
        handleException,
      );

  @override
  ResultTask<Unit> updateCoverage({
    required String branchId,
    required List<String> postalCodes,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.updateCoverage(
      branchId: branchId,
      postalCodes: postalCodes,
    );
    return unit;
  }, handleException);

  @override
  ResultTask<Branch?> getByPostalCode(String postalCode) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.getByPostalCode(
          postalCode,
        );
        return model?.toDomain();
      }, handleException);
}