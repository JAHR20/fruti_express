import 'package:intl/intl.dart';

class FormatoMoneda {
  static final _formato = NumberFormat.currency(
    locale: 'es_MX', // 🇲🇽 Perfecto para México
    symbol: '\$',
    decimalDigits: 2,
  );

  static String formatear(int centavos) => 
      _formato.format(centavos / 100);
}

// 🌟 LA MEJORA PRO: Una extensión sobre la clase int
extension IntMonedaX on int {
  /// Convierte automáticamente este número (en centavos) a texto de moneda.
  String get formatoMoneda => FormatoMoneda.formatear(this);
}