import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/data/datasources/sucursal_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/repositories/sucursal_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SucursalRepositoryImpl
    with SupabaseHandleException
    implements SucursalRepository {
  final SucursalRemoteDatasource remoteDatasource;

  SucursalRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Sucursal>> obtenerTodas() => TaskEither.tryCatch(
    () async => await remoteDatasource.obtenerTodas(),
    handleException,
  );

  @override
  ResultTask<Sucursal> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final res = await remoteDatasource.obtenerPorId(id);
    if (res == null) {
      throw const PostgrestException(
        message: 'Sucursal no encontrada',
        code: 'PGRST116',
      );
    }
    return res;
  }, handleException);

  @override
  ResultTask<Sucursal> crear(Sucursal sucursal) => TaskEither.tryCatch(
    () async => await remoteDatasource.crear(sucursal),
    handleException,
  );

  @override
  ResultTask<Sucursal> actualizar(Sucursal sucursal) => TaskEither.tryCatch(
    () async => await remoteDatasource.actualizar(sucursal),
    handleException,
  );

  @override
  ResultTask<Unit> desactivar(String id) => TaskEither.tryCatch(() async {
    await remoteDatasource.desactivar(id);
    return unit;
  }, handleException);

  @override
  ResultTask<Sucursal> obtenerPorNombre(String nombre) =>
      TaskEither.tryCatch(() async {
        final res = await remoteDatasource.obtenerPorNombre(nombre);
        if (res == null) {
          throw const PostgrestException(
            message: 'Sucursal no encontrada',
            code: 'PGRST116',
          );
        }
        return res;
      }, handleException);

  @override
  ResultStream<List<Sucursal>> watchTodas() {
    return remoteDatasource
        .watchTodas()
        .map<Either<Failure, List<Sucursal>>>((lista) => Right(lista))
        .handleError(
          (error) => Left(handleException(error, StackTrace.current)),
        );
  }
}
