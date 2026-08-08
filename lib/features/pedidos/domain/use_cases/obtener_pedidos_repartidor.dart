// features/pedidos/domain/use_cases/watch_pedidos_repartidor_use_case.dart

import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosRepartidor {
  final PedidoRepository repository;
  ObtenerPedidosRepartidor(this.repository);

  ResultStream<List<Pedido>> call(String repartidorId) {
    return repository.watchPorRepartidor(repartidorId);
  }
}