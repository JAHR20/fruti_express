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