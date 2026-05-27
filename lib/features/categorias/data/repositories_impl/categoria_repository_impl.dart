import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/categorias/data/datasources/categoria_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/entities/categoria.dart';
import 'package:fruti_express_jahr_admin/features/categorias/domain/repositories/categoria_repositorie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoriaRepositoryImpl
    with SupabaseHandleException
    implements CategoriaRepository {
  final CategoriaRemoteDataSource remoteDatasource;

  CategoriaRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Categoria>> obtenerTodas() => TaskEither.tryCatch(
    () async => await remoteDatasource.obtenerTodas(),
    handleException,
  );

  @override
  ResultTask<Categoria> obtenerPorId(String id) =>
      TaskEither.tryCatch(() async {
        final res = await remoteDatasource.obtenerPorId(id);
        if (res == null) {
          throw const PostgrestException(
            message: 'Categoría no encontrada',
            code: 'PGRST116',
          );
        }
        return res;
      }, handleException);

  @override
  ResultTask<Categoria> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final res = await remoteDatasource.obtenerPorNombre(nombre);
        if (res == null) {
          throw const PostgrestException(
            message: 'Categoría no encontrada',
            code: 'PGRST116',
          );
        }
        return res;
      }, handleException);

  @override
  ResultTask<List<Categoria>> obtenerPorCategoriaPadre(String? padreId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorPadre(padreId),
        handleException,
      );

  @override
  ResultStream<List<Categoria>> watchTodas() {
    return remoteDatasource
        .watchTodas()
        .map<Either<Failure, List<Categoria>>>(
          (categorias) => Right(categorias),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Categoria> crear(Categoria categoria) => TaskEither.tryCatch(
    () async => await remoteDatasource.crear(categoria),
    handleException,
  );

  @override
  ResultTask<Categoria> actualizar(Categoria categoria) => TaskEither.tryCatch(
    () async => await remoteDatasource.actualizar(categoria),
    handleException,
  );

  @override
  ResultTask<Unit> desactivar(String id) => TaskEither.tryCatch(() async {
    await remoteDatasource.desactivar(id);
    return unit;
  }, handleException);
}
