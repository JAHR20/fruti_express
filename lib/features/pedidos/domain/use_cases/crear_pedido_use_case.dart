import 'package:fpdart/fpdart.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart';
import 'package:fruti_express_jahr_admin/core/types/result.dart';
import 'package:fruti_express_jahr_admin/features/inventario/domain/repositories/inventario_repository.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/entities/pedido.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/repositories/pedido_repository.dart';
import 'crear_pedido_params.dart';

class CrearPedidoUseCase {
  final PedidoRepository _pedidoRepository;
  
  final InventarioRepository _inventarioRepository;

 CrearPedidoUseCase(this._pedidoRepository, this._inventarioRepository);

  ResultTask<Pedido> call(CrearPedidoParams params) => TaskEither.Do(($) async {
        
        for (final item in params.items) {
          
          final stockActual = await $(_inventarioRepository.obtenerStockActual(
            item.productoId,
            params.sucursalId,
          ));

          if (item.cantidad > stockActual) {
            final mensaje = 'El producto "${item.nombreProductoSnapshot}" se ha agotado o no tiene suficiente stock. (Disponibles: $stockActual)';
            await $(TaskEither.left(Failure.insufficientStock(mensaje)));
          }
        }
        
        final pedidoCreado = await $(_pedidoRepository.crear(params));

        for (final item in params.items) {
          final cantidadParaRestar = item.cantidad * -1;
          
          await $(_inventarioRepository.ajustarStockAtomicamente(
            productoId: item.productoId,
            sucursalId: params.sucursalId,
            cantidadCambio: cantidadParaRestar,
          ));
        }

        return pedidoCreado;
      });
}