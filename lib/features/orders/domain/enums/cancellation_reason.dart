enum CancellationReason {
  customerRequest('customer_request', 'El cliente lo pidió'),
  outOfStock('out_of_stock', 'Sin existencias'),
  other('other', 'Otro motivo');

  const CancellationReason(this.code, this.label);

  final String code;

  final String label;
}