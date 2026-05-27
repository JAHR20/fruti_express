import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';

class ObtenerPedidosUsuarioUseCase {
  final PedidoRepository repository;

  ObtenerPedidosUsuarioUseCase(this.repository);

  ResultTask<List<Pedido>> call(String usuarioId) {
    return repository.obtenerPorUsuario(usuarioId);
  }
}
