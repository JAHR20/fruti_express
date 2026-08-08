// features/pedidos/domain/use_cases/confirmar_entrega_params.dart

/// Parámetros para confirmar la entrega de un pedido.
/// [urlEvidencia] es opcional — solo se usa cuando el cliente está ausente.
class ConfirmarEntregaParams {
  final String pedidoId;
  final String? codigoConfirmacion;
  final String? urlEvidencia;

  const ConfirmarEntregaParams({
    required this.pedidoId,
    this.codigoConfirmacion,
    this.urlEvidencia,
  });
}