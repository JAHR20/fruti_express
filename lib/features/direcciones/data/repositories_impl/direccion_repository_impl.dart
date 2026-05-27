import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import '../datasources/direccion_remote_datasource.dart';
import '../../domain/entities/direccion.dart';
import '../../domain/repositories/direccion_repository.dart';

class DireccionRepositoryImpl
    with SupabaseHandleException
    implements DireccionRepository {
  final DireccionRemoteDatasource remoteDatasource;
  DireccionRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<List<Direccion>> obtenerPorUsuario(String usuarioId) =>
      TaskEither.tryCatch(
        () => remoteDatasource.obtenerPorUsuario(usuarioId),
        handleException,
      );

  @override
  ResultTask<Direccion> crear(Direccion direccion) => TaskEither.tryCatch(
    () => remoteDatasource.crear(direccion),
    handleException,
  );

  @override
  ResultTask<Direccion> actualizar(Direccion direccion) => TaskEither.tryCatch(
    () => remoteDatasource.actualizar(direccion),
    handleException,
  );

  @override
  ResultTask<Unit> eliminar(String id) => TaskEither.tryCatch(() async {
    await remoteDatasource.eliminar(id);
    return unit;
  }, handleException);

  @override
  ResultTask<Unit> establecerPrincipal({
    required String usuarioId,
    required String direccionId,
  }) => TaskEither.tryCatch(() async {
    await remoteDatasource.establecerPrincipal(usuarioId, direccionId);
    return unit;
  }, handleException);
}
