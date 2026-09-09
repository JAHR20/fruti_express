import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/categories/data/datasources/category_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/categories/data/models/category_model.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/entities/category.dart';
import 'package:fruti_express_jahr_admin/features/categories/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl
    with SupabaseHandleException
    implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  ResultTask<List<Category>> getAll() => TaskEither.tryCatch(() async {
    final models = await remoteDataSource.getAll();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<List<Category>> getActive() => TaskEither.tryCatch(() async {
    final models = await remoteDataSource.getActive();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<Category?> getById(String id) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.getById(id);
        return model?.toDomain();
      }, handleException);

  @override
  ResultTask<Category?> getByName(String name) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDataSource.getByName(name);
        return model?.toDomain();
      }, handleException);

  @override
  ResultTask<List<Category>> getByParentCategory(String? parentId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDataSource.getByParent(parentId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultStream<List<Category>> watchAll() {
    return remoteDataSource
        .watchAll()
        .map<Either<Failure, List<Category>>>(
          (models) =>
              Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Category> create(Category category) =>
      TaskEither.tryCatch(() async {
        final model = CategoryModelX.fromDomain(category);
        final created = await remoteDataSource.create(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Category> update(Category category) =>
      TaskEither.tryCatch(() async {
        final model = CategoryModelX.fromDomain(category);
        final updated = await remoteDataSource.update(model);
        return updated.toDomain();
      }, handleException);

  @override
  ResultTask<Unit> changeStatus(String id, bool newState) =>
      TaskEither.tryCatch(() async {
        await remoteDataSource.changeStatus(id, newState);
        return unit;
      }, handleException);
}