import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/data/datasources/pedido_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart'; // Importante para los Enums
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PedidoRepositoryImpl
    with SupabaseHandleException
    implements PedidoRepository {
  final PedidoRemoteDatasource remoteDatasource;

  PedidoRepositoryImpl(this.remoteDatasource);

  // --- 🔍 CONSULTAS ---

  @override
  ResultTask<Pedido> crear(Pedido pedido) => TaskEither.tryCatch(
    () async => await remoteDatasource.crear(pedido),
    handleException,
  );

  @override
  ResultTask<List<Pedido>> obtenerTodos() => TaskEither.tryCatch(
    () async => await remoteDatasource.obtenerTodos(),
    handleException,
  );

  @override
  ResultTask<List<Pedido>> obtenerPorSucursal(String sucursalId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorSucursal(sucursalId),
        handleException,
      );

  @override
  ResultTask<List<Pedido>> obtenerPorEstado({
    required String sucursalId,
    required EstadoPedido estado,
  }) => TaskEither.tryCatch(
    // Traducimos el Enum a String con .name
    () async =>
        await remoteDatasource.obtenerPorEstado(sucursalId, estado.name),
    handleException,
  );

  @override
  ResultTask<Pedido> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final res = await remoteDatasource.obtenerPorId(id);
    if (res == null) {
      throw const PostgrestException(
        message: 'Pedido no encontrado',
        code: 'PGRST116',
      );
    }
    return res;
  }, handleException);

  @override
  ResultTask<List<Pedido>> obtenerPorUsuario(String usuarioId) =>
      TaskEither.tryCatch(
        () async => await remoteDatasource.obtenerPorUsuario(usuarioId),
        handleException,
      );

  // --- 📊 ESTADÍSTICAS ---

  @override
  ResultTask<int> contarPorEstado(String sucursalId, EstadoPedido estado) =>
      TaskEither.tryCatch(
        () async =>
            await remoteDatasource.contarPorEstado(sucursalId, estado.name),
        handleException,
      );

  @override
  ResultTask<int> obtenerVentasDelDia(String sucursalId) => TaskEither.tryCatch(
    () async => await remoteDatasource.obtenerVentasDelDia(sucursalId),
    handleException,
  );

  @override
  ResultTask<int> contarPedidosHoy(String sucursalId) => TaskEither.tryCatch(
    () async => await remoteDatasource.contarPedidosHoy(sucursalId),
    handleException,
  );

  // --- ✍️ ACCIONES ---

  @override
  ResultTask<Pedido> actualizarEstado({
    required String pedidoId,
    required EstadoPedido nuevoEstado,
  }) => TaskEither.tryCatch(
    () async =>
        await remoteDatasource.actualizarEstado(pedidoId, nuevoEstado.name),
    handleException,
  );

  @override
  ResultTask<Pedido> asignarRepartidor({
    required String pedidoId,
    required String repartidorId,
  }) => TaskEither.tryCatch(
    () async =>
        await remoteDatasource.asignarRepartidor(pedidoId, repartidorId),
    handleException,
  );

  // --- 📡 TIEMPO REAL ---

  @override
  ResultStream<List<Pedido>> watchPorSucursal(String sucursalId) {
    return remoteDatasource
        .watchPorSucursal(sucursalId)
        .map<Either<Failure, List<Pedido>>>((lista) => Right(lista))
        .handleError((e) => Left(handleException(e, StackTrace.current)));
  }
}
