import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/carrito/domain/entities/carrito_item.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_params.dart';
import 'package:fruti_express_jahr_admin/features/pedidos/domain/use_cases/crear_pedido_use_case.dart';
import 'package:fruti_express_jahr_admin/features/usuarios/domain/entities/perfil.dart';
import 'pedido_state.dart';

class PedidoCubit extends Cubit<PedidoState> {
  final CrearPedidoUseCase _crearPedidoUseCase;

  PedidoCubit({
    required CrearPedidoUseCase crearPedidoUseCase,
  })  : _crearPedidoUseCase = crearPedidoUseCase,
        super(const PedidoState.initial());

  Future<void> crearDesdeCarrito({
    required List<CarritoItem> items,
    Direccion? direccion,
    required Perfil perfil,
    required int subtotal,
    required String sucursalId,
    required ModoEntrega modoEntrega,
  }) async {
    emit(const PedidoState.procesando());

    // 🌟 Usamos el nuevo getter elegante del Dominio
    final String direccionSnapshotTexto = modoEntrega == ModoEntrega.pickUp
        ? 'Recoger en sucursal (Pick-Up)'
        : (direccion != null 
            ? direccion.formateadaSnapshot 
            : 'Dirección no especificada');

    final params = CrearPedidoParams(
      clienteId: perfil.id,
      sucursalId: sucursalId,
      clienteNombreSnapshot: perfil.nombreCompletoSnapshot, // 🌟 Usamos el getter
      clienteTelefonoSnapshot: perfil.telefono ?? '',
      direccionSnapshot: direccionSnapshotTexto,
      subtotal: subtotal,
      modoEntrega: modoEntrega,
      costoEnvio: 0,
      descuentosAplicados: 0,
      total: subtotal,
      items: items.map((item) => CrearPedidoItemParams(
        productoId: item.productoId,
        nombreProductoSnapshot: item.nombre,
        cantidad: item.cantidad,
        precioUnitarioSnapshot: item.precioUnitario,
        unidadMedida: item.unidadMedida,
      )).toList(),
    );

    final result = await _crearPedidoUseCase(params).run();

    result.fold(
      (failure) => emit(PedidoState.error(failure.errorMessage)),
      (pedidoCreado) => emit(PedidoState.esperandoPago(pedidoCreado)),
    );
  }

  void reiniciarEstado() => emit(const PedidoState.initial());
}