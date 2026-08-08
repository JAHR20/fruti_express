import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/inventario/data/datasources/inventario_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/inventario/data/models/inventario_model.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/entities/inventario.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';

class InventarioRepositoryImpl
    with SupabaseHandleException
    implements InventarioRepository {
  final InventarioRemoteDatasource remoteDatasource;

  InventarioRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<Inventario> crear(Inventario inventario) =>
      TaskEither.tryCatch(() async {
        final model = InventarioModelX.fromDomain(inventario);
        final created = await remoteDatasource.crear(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Inventario> actualizar(Inventario inventario) =>
      TaskEither.tryCatch(() async {
        final model = InventarioModelX.fromDomain(inventario);
        final updated = await remoteDatasource.actualizar(model);
        return updated.toDomain();
      }, handleException);

  @override
  ResultTask<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.obtener(
      productoId: productoId,
      sucursalId: sucursalId,
    );
    return model?.toDomain();
  }, handleException);

  @override
  ResultTask<List<Inventario>> obtenerPorProducto(String productoId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorProducto(productoId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<List<Inventario>> obtenerPorSucursal(String sucursalId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorSucursal(sucursalId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultStream<List<Inventario>> watchPorSucursal(String sucursalId) {
    return remoteDatasource
        .watchPorSucursal(sucursalId)
        .map<Either<Failure, List<Inventario>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<Unit> ajustarStockAtomicamente({
    required String productoId,
    required String sucursalId,
    required int cantidadCambio,
  }) => TaskEither.tryCatch(
    () async {
      await remoteDatasource.ajustarStockAtomicamente(
        productoId: productoId,
        sucursalId: sucursalId,
        cantidadCambio: cantidadCambio,
      );
      return unit;
    },
    handleException, // ← usa el mixin consistentemente
  );

  @override
  ResultTask<int> obtenerStockActual(String productoId, String sucursalId) =>
      TaskEither.tryCatch(
        () => remoteDatasource.obtenerStockActual(productoId, sucursalId),
        handleException,
      );
}
