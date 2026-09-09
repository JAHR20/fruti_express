enum OrderStatus {
  pendingPayment,
  confirmed,
  preparing,
  onTheWay,
  delivered,
  cancelled;

  String get displayName => switch (this) {
    OrderStatus.pendingPayment => 'Pago Pendiente',
    OrderStatus.confirmed      => 'Confirmado',
    OrderStatus.preparing      => 'En Preparación',
    OrderStatus.onTheWay       => 'En Camino',
    OrderStatus.delivered      => 'Entregado',
    OrderStatus.cancelled      => 'Cancelado',
  };

  bool get isManageableByManager => switch (this) { 
    OrderStatus.confirmed => true,
    OrderStatus.preparing => true,
    OrderStatus.cancelled => true,
    _ => false,
  };

  bool get isManageableByDriver => switch (this) { 
    OrderStatus.onTheWay  => true,
    OrderStatus.delivered => true,
    _ => false,
  };
}