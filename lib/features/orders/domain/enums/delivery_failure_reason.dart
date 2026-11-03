enum DeliveryFailureReason {
  customerAbsent('customer_absent', 'El cliente no estaba'),
  orderRejected('order_rejected', 'El cliente rechazó el pedido'),
  cannotPay('cannot_pay', 'El cliente no pudo pagar'),
  wrongAddress('wrong_address', 'Dirección incorrecta'),
  other('other', 'Otro motivo');

  const DeliveryFailureReason(this.code, this.label);

  final String code;

  final String label;
}