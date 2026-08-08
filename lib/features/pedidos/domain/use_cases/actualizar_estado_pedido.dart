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
      // 1️⃣ Validar la transición de estados (Máquina de Estados)
      // Si la transición no es permitida, el $ corta el flujo aquí.
      await $(_validarTransicion(pedido.estado, nuevoEstado));

      // 2️⃣ Ejecutar la actualización en el repositorio
      // El $ extrae el Pedido actualizado o propaga el error del repo.
      return await $(
        repository.actualizarEstado(
          pedidoId: pedido.id,
          nuevoEstado: nuevoEstado,
        ),
      );
    });
  }

  // --- 🧩 MICRO-PASOS DE LÓGICA PURA ---

  /// Valida si el cambio de estado es lógicamente posible.
  ResultTask<Unit> _validarTransicion(EstadoPedido actual, EstadoPedido nuevo) {
    final esValida = switch (actual) {
      EstadoPedido.pagoPendiente =>
        nuevo == EstadoPedido.confirmado || nuevo == EstadoPedido.cancelado,

      EstadoPedido.confirmado =>
        nuevo == EstadoPedido.enPreparacion || nuevo == EstadoPedido.cancelado,

      EstadoPedido.enPreparacion =>
        nuevo == EstadoPedido.enCamino || nuevo == EstadoPedido.cancelado,

      EstadoPedido.enCamino => nuevo == EstadoPedido.entregado,

      // Estados finales (entregado, cancelado) no permiten más cambios.
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
