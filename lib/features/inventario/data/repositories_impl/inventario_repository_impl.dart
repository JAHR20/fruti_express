import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/inventario/data/datasources/inventario_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class InventarioRepositoryImpl
    with SupabaseHandleException
    implements InventarioRepository {
  final InventarioRemoteDatasource remoteDatasource;

  InventarioRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<Inventario> crear(Inventario inventario) => TaskEither.tryCatch(
    () async => await remoteDatasource.crear(inventario),
    handleException,
  );

  @override
  ResultTask<List<Inventario>> obtenerPorProducto(String productoId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorProducto(productoId),
        handleException,
      );

  @override
  ResultStream<List<Inventario>> watchPorSucursal(String sucursalId) {
    return remoteDatasource
        .watchPorSucursal(sucursalId)
        .map<Either<Failure, List<Inventario>>>((list) => Right(list))
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  }) => TaskEither.tryCatch(
    () async => await remoteDatasource.obtener(
      productoId: productoId,
      sucursalId: sucursalId,
    ),
    handleException,
  );

  @override
  ResultTask<Inventario> actualizar(Inventario inventario) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.actualizar(inventario),
        handleException,
      );

  @override
  ResultTask<List<Inventario>> obtenerPorSucursal(String sucursalId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorSucursal(sucursalId),
        handleException,
      );
}
