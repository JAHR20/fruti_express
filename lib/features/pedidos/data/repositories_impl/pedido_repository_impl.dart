import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/core/utils/supabase_handle_exception.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/data/datasources/pedido_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/data/models/pedido_model.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/confirmar_entrega_params.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PedidoRepositoryImpl
    with SupabaseHandleException
    implements PedidoRepository {
  final PedidoRemoteDatasource remoteDatasource;

  PedidoRepositoryImpl(this.remoteDatasource);

  @override
  ResultTask<Pedido> crear(CrearPedidoParams params) =>
      TaskEither.tryCatch(() async {
        final model = PedidoModelX.fromParams(params);
        final created = await remoteDatasource.crear(model);
        return created.toDomain();
      }, handleException);

  @override
  ResultTask<List<Pedido>> obtenerTodos() => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.obtenerTodos();
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<List<Pedido>> obtenerPorSucursal(String sucursalId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorSucursal(sucursalId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<List<Pedido>> obtenerPorEstado({
    required String sucursalId,
    required EstadoPedido estado,
  }) => TaskEither.tryCatch(() async {
    final models = await remoteDatasource.obtenerPorEstado(
      sucursalId,
      estado.name,
    );
    return models.map((m) => m.toDomain()).toList();
  }, handleException);

  @override
  ResultTask<Pedido> obtenerPorId(String id) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.obtenerPorId(id);
    if (model == null) {
      throw const PostgrestException(
        message: 'Pedido no encontrado',
        code: 'PGRST116',
      );
    }
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<List<Pedido>> obtenerPorUsuario(String usuarioId) =>
      TaskEither.tryCatch(() async {
        final models = await remoteDatasource.obtenerPorUsuario(usuarioId);
        return models.map((m) => m.toDomain()).toList();
      }, handleException);

  @override
  ResultTask<int> contarPorEstado(String sucursalId, EstadoPedido estado) =>
      TaskEither.tryCatch(
        () async => remoteDatasource.contarPorEstado(sucursalId, estado.name),
        handleException,
      );

  @override
  ResultTask<int> obtenerVentasDelDia(String sucursalId) => TaskEither.tryCatch(
    () async => remoteDatasource.obtenerVentasDelDia(sucursalId),
    handleException,
  );

  @override
  ResultTask<int> contarPedidosHoy(String sucursalId) => TaskEither.tryCatch(
    () async => remoteDatasource.contarPedidosHoy(sucursalId),
    handleException,
  );

  @override
  ResultTask<Pedido> actualizarEstado({
    required String pedidoId,
    required EstadoPedido nuevoEstado,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.actualizarEstado(
      pedidoId,
      nuevoEstado.name,
    );
    return model.toDomain();
  }, handleException);

  @override
  ResultTask<Pedido> asignarRepartidor({
    required String pedidoId,
    required String repartidorId,
  }) => TaskEither.tryCatch(() async {
    final model = await remoteDatasource.asignarRepartidor(
      pedidoId,
      repartidorId,
    );
    return model.toDomain();
  }, handleException);

  @override
  ResultStream<List<Pedido>> watchPorSucursal(String sucursalId) {
    return remoteDatasource
        .watchPorSucursal(sucursalId)
        .map<Either<Failure, List<Pedido>>>(
          (models) => Right(models.map((m) => m.toDomain()).toList()),
        )
        .handleError((e) => Left(handleException(e, StackTrace.current)));
  }

  @override
  ResultStream<List<Pedido>> watchPorRepartidor(String repartidorId) {
    return remoteDatasource
        .watchPorRepartidor(repartidorId)
        .map(
          (models) => Either<Failure, List<Pedido>>.right(
            models.map((m) => m.toDomain()).toList(),
          ),
        )
        .handleError(
          (e) => Either<Failure, List<Pedido>>.left(
            handleException(e, StackTrace.current),
          ),
        );
  }

  @override
  ResultTask<Unit> confirmarEntrega(ConfirmarEntregaParams params) =>
      TaskEither.tryCatch(() async {
        await remoteDatasource.confirmarEntrega(
          pedidoId: params.pedidoId,
          codigoConfirmacion: params.codigoConfirmacion,
          urlEvidencia: params.urlEvidencia,
        );
        return unit;
      }, handleException);
}
