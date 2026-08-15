import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/enums/estado_pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ActualizarEstadoPedido {
  final PedidoRepository repository;

  ActualizarEstadoPedido(this.repository);

  ResultTask<Pedido> ejecutar({
    required Pedido pedido,
    required EstadoPedido nuevoEstado,
  }) {
    return TaskEither.Do(($) async {
      await $(_validarTransicion(pedido.estado, nuevoEstado));
      return await $(
        repository.actualizarEstado(
          pedidoId: pedido.id,
          nuevoEstado: nuevoEstado,
        ),
      );
    });
  }

  ResultTask<Unit> _validarTransicion(EstadoPedido actual, EstadoPedido nuevo) {
    final esValida = switch (actual) {
      EstadoPedido.pagoPendiente =>
        nuevo == EstadoPedido.confirmado || nuevo == EstadoPedido.cancelado,

      EstadoPedido.confirmado =>
        nuevo == EstadoPedido.enPreparacion || nuevo == EstadoPedido.cancelado,

      EstadoPedido.enPreparacion =>
        nuevo == EstadoPedido.enCamino || nuevo == EstadoPedido.cancelado,

      EstadoPedido.enCamino => nuevo == EstadoPedido.entregado,
      _ => false,
    };

    return esValida
        ? TaskEither.right(unit)
        : TaskEither.left(
            Failure.validation(
              'Transición no permitida: de ${actual.name} a ${nuevo.name}.',
            ),
          );
  }
}
