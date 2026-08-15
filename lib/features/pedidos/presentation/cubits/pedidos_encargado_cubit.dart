import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/presentation/cubits/pedidos_encargado_state.dart';

class PedidosEncargadoCubit extends Cubit<PedidosEncargadoState> {
  final PedidoRepository _repository;
  StreamSubscription<Either<Failure, List<Pedido>>>? _subscription;

  PedidosEncargadoCubit({required PedidoRepository repository})
    : _repository = repository,
      super(const PedidosEncargadoState.inicial());

  void iniciarWatch(String sucursalId) {
  emit(const PedidosEncargadoState.cargando());
  
  _subscription?.cancel();

  _subscription = _repository.watchPorSucursal(sucursalId).listen(
    (either) => either.fold(
      (failure) {
        emit(PedidosEncargadoState.error(failure.errorMessage));
      },
      (pedidos) {
        emit(PedidosEncargadoState.cargado(pedidos));
      },
    ),
  );
}

  void detenerWatch() {
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> confirmarPedido(String pedidoId) async {
    final pedidosActuales = _pedidosActuales();
    if (pedidosActuales == null) return;

    emit(
      PedidosEncargadoState.accionando(
        pedidos: pedidosActuales,
        pedidoId: pedidoId,
      ),
    );

    final result = await _repository
        .actualizarEstado(
          pedidoId: pedidoId,
          nuevoEstado: EstadoPedido.confirmado,
        )
        .run();

    result.fold(
      (failure) => emit(PedidosEncargadoState.error(failure.errorMessage)),
      (_) => emit(PedidosEncargadoState.cargado(pedidosActuales)),
    );
  }

  Future<void> asignarRepartidorYPreparar({
    required String pedidoId,
    required String repartidorId,
  }) async {
    final pedidosActuales = _pedidosActuales();
    if (pedidosActuales == null) return;

    emit(
      PedidosEncargadoState.accionando(
        pedidos: pedidosActuales,
        pedidoId: pedidoId,
      ),
    );

    final asignacion = await _repository
        .asignarRepartidor(pedidoId: pedidoId, repartidorId: repartidorId)
        .run();

    final asignacionFallida = asignacion.fold((failure) {
      emit(PedidosEncargadoState.error(failure.errorMessage));
      return true;
    }, (_) => false);

    if (asignacionFallida) return;

    final resultado = await _repository
        .actualizarEstado(
          pedidoId: pedidoId,
          nuevoEstado: EstadoPedido.enPreparacion,
        )
        .run();

    resultado.fold(
      (failure) => emit(PedidosEncargadoState.error(failure.errorMessage)),
      (_) => emit(PedidosEncargadoState.cargado(pedidosActuales)),
    );
  }

  Future<void> cancelarPedido(String pedidoId) async {
    final pedidosActuales = _pedidosActuales();
    if (pedidosActuales == null) return;

    emit(
      PedidosEncargadoState.accionando(
        pedidos: pedidosActuales,
        pedidoId: pedidoId,
      ),
    );

    final result = await _repository
        .actualizarEstado(
          pedidoId: pedidoId,
          nuevoEstado: EstadoPedido.cancelado,
        )
        .run();

    result.fold(
      (failure) => emit(PedidosEncargadoState.error(failure.errorMessage)),
      (_) => emit(PedidosEncargadoState.cargado(pedidosActuales)),
    );
  }

  List<Pedido>? _pedidosActuales() {
    return state.maybeWhen(
      cargado: (pedidos) => pedidos,
      accionando: (pedidos, _) => pedidos,
      orElse: () => null,
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
