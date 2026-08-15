import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/errors/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/data/datasources/sucursal_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/data/models/sucursal_model.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SucursalRepositoryImpl
    with SupabaseHandleException
    implements SucursalRepository {
  final SucursalRemoteDatasource remoteDatasource;

  SucursalRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Sucursal>> obtenerTodas() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.obtenerTodas();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<Sucursal> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.obtenerPorId(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Sucursal no encontrada',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Sucursal> crear(Sucursal sucursal) =>
      TaskEither.tryCatch(() async {
        final model = SucursalModelX.fromDomain(sucursal);
        final created = await remoteDatasource.crear(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<Sucursal> actualizar(Sucursal sucursal) =>
      TaskEither.tryCatch(() async {
        final model = SucursalModelX.fromDomain(sucursal);
        final updated = await remoteDatasource.actualizar(model);
        return updated.toDomain();
      }, handleException);

  @override
  ResultTask<Sucursal?> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.obtenerPorNombre(nombre);
        return model?.toDomain();
      }, handleException);

  @override
  ResultStream<List<Sucursal>> watchTodas() {
    return remoteDatasource
        .watchTodas()
        .map<Either<Failure, List<Sucursal>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }

  @override
  ResultTask<List<String>> obtenerCobertura(String sucursalId) =>
      TaskEither.tryCatch(
        () => remoteDatasource.obtenerCobertura(sucursalId),
        handleException,
      );

  @override
  ResultTask<Unit> actualizarCobertura({
    required String sucursalId,
    required List<String> codigosPostales,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.actualizarCobertura(
      sucursalId: sucursalId,
      codigosPostales: codigosPostales,
    );
    return unit;
  }, handleException);

  @override
  ResultTask<Sucursal?> obtenerPorCodigoPostal(String codigoPostal) =>
      TaskEither.tryCatch(() async {
        final model = await remoteDatasource.obtenerPorCodigoPostal(
          codigoPostal,
        );
        return model?.toDomain();
      }, handleException);
}
