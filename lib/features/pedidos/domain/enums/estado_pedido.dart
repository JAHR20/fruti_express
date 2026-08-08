enum EstadoPedido {
  pagoPendiente,
  confirmado,
  enPreparacion,
  enCamino,
  entregado,
  cancelado;

  String get displayName => switch (this) {
    EstadoPedido.pagoPendiente  => 'Pago Pendiente',
    EstadoPedido.confirmado     => 'Confirmado',
    EstadoPedido.enPreparacion  => 'En Preparación',
    EstadoPedido.enCamino       => 'En Camino',
    EstadoPedido.entregado      => 'Entregado',
    EstadoPedido.cancelado      => 'Cancelado',
  };

  /// Estados que el encargado puede asignar
  bool get esGestionableEncargado => switch (this) {
    EstadoPedido.confirmado    => true,
    EstadoPedido.enPreparacion => true,
    EstadoPedido.cancelado     => true,
    _ => false,
  };

  /// Estados que el repartidor puede asignar
  bool get esGestionableRepartidor => switch (this) {
    EstadoPedido.enCamino  => true,
    EstadoPedido.entregado => true,
    _ => false,
  };
}