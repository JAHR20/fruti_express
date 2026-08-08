

import 'package:fruti_express_jahr_admin/core/enums/modo_entrega.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

class CrearPedidoParams {
  final String clienteId;
  final String sucursalId;
  final String clienteNombreSnapshot;
  final String clienteTelefonoSnapshot;
  final String direccionSnapshot;
  final int subtotal;
  final int costoEnvio;
  final int descuentosAplicados;
  final int total;
  final ModoEntrega modoEntrega;
  final List<CrearPedidoItemParams> items;

  const CrearPedidoParams({
    required this.clienteId,
    required this.sucursalId,
    required this.clienteNombreSnapshot,
    required this.clienteTelefonoSnapshot,
    required this.direccionSnapshot,
    required this.subtotal,
    required this.costoEnvio,
    required this.descuentosAplicados,
    required this.total,
    required this.modoEntrega,
    required this.items,
  });
}

class CrearPedidoItemParams {
  final String productoId;
  final String nombreProductoSnapshot;
  final int cantidad;
  final int precioUnitarioSnapshot;
  final UnidadMedida? unidadMedida;

  const CrearPedidoItemParams({
    required this.productoId,
    required this.nombreProductoSnapshot,
    required this.cantidad,
    required this.precioUnitarioSnapshot,
    this.unidadMedida,
  });
}