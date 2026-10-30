enum PaymentMethodType {
  cashOnDelivery,
  mercadoPago;

  /// Devuelve un texto legible para la UI
  String get displayName {
    switch (this) {
      case PaymentMethodType.cashOnDelivery:
        return 'Pago contra entrega';
      case PaymentMethodType.mercadoPago:
        return 'Tarjeta de crédito, débito o saldo de Mercado Pago';
    }
  }

  /// Convierte el enum al valor esperado por la base de datos de Supabase o backend
  String toJson() {
    switch (this) {
      case PaymentMethodType.cashOnDelivery:
        return 'cashOnDelivery';
      case PaymentMethodType.mercadoPago:
        return 'mercadoPago';
    }
  }

  /// Permite deserializar desde JSON si lo necesitas
  static PaymentMethodType fromJson(String value) {
    switch (value) {
      case 'mercadoPago':
        return PaymentMethodType.mercadoPago;
      case 'cashOnDelivery':
      default:
        return PaymentMethodType.cashOnDelivery;
    }
  }
}