import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/categorias/data/datasources/categoria_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/categorias/data/models/categoria_model.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';

class CategoriaRepositoryImpl
    with SupabaseHandleException
    implements CategoriaRepository {
  final CategoriaRemoteDataSource remoteDatasource;

  CategoriaRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Categoria>> obtenerTodas() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.obtenerTodas();
    return models.map((m) => m.toDomain()).toList(); // ← mapeo
  }, handleException);

  @override
  ResultTask<List<Categoria>> obtenerActivas() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.obtenerActivas();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<Categoria?> obtenerPorId(String id) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.obtenerPorId(id);
        return model?.toDomain(); // ← mapeo nullable
      }, handleException);

  @override
  ResultTask<Categoria?> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.obtenerPorNombre(nombre);
        return model?.toDomain(); // ← mapeo nullable
      }, handleException);

  @override
  ResultTask<List<Categoria>> obtenerPorCategoriaPadre(String? padreId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorPadre(padreId);
        return models.map((m) => m.toDomain()).toList(); // ← mapeo
      }, handleException);

  @override
  ResultStream<List<Categoria>> watchTodas() {
    return remoteDatasource
        .watchTodas()
        .map<Either<Failure, List<Categoria>>>(
          (models) =>
              Right(models.map((m) => m.toDomain()).toList()), // ← mapeo
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Categoria> crear(Categoria categoria) =>
      TaskEither.tryCatch(() async {
        final model = CategoriaModelX.fromDomain(
          categoria,
        ); // ← Categoria → Model
        final created = await remoteDatasource.crear(model);
        return created.toDomain(); // ← Model → Categoria
      }, handleException);

  @override
  ResultTask<Categoria> actualizar(Categoria categoria) =>
      TaskEither.tryCatch(() async {
        final model = CategoriaModelX.fromDomain(
          categoria,
        ); // ← Categoria → Model
        final updated = await remoteDatasource.actualizar(model);
        return updated.toDomain(); // ← Model → Categoria
      }, handleException);

  @override
  ResultTask<Unit> cambiarEstado(String id, bool nuevoEstado) =>
      TaskEither.tryCatch(() async {
        await remoteDatasource.cambiarEstado(id, nuevoEstado);
        return unit;
      }, handleException);
}
