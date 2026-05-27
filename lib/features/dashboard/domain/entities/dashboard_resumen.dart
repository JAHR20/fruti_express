class DashboardResumen {
  final int pedidosPendientes;
  final int pedidosEnPreparacion;
  final int pedidosEnCamino;
  final int ventasDelDia;
  final int totalPedidosHoy;

  DashboardResumen({
    required this.pedidosPendientes,
    required this.pedidosEnPreparacion,
    required this.pedidosEnCamino,
    required this.ventasDelDia,
    required this.totalPedidosHoy,
  });
}
