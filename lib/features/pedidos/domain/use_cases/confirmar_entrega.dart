import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'confirmar_entrega_params.dart';

class ConfirmarEntrega {
  final PedidoRepository repository;
  ConfirmarEntrega(this.repository);

  ResultTask<Unit> call(ConfirmarEntregaParams params) {
    return repository.confirmarEntrega(params);
  }
}