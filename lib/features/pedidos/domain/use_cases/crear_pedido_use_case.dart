import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class CrearPedidoUseCase {
  final PedidoRepository repository;

  CrearPedidoUseCase(this.repository);

  ResultTask<Pedido> call(Pedido pedido) {
    return repository.crear(pedido);
  }
}
