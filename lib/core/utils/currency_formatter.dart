import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final _formatter = NumberFormat.currency(
    locale: 'es_MX', 
    symbol: '\$',
    decimalDigits: 2,
  );

  static String format(int cents) => _formatter.format(cents / 100);

  static int doubleToCents(double amount) => (amount * 100).round();

  static int stringToCents(String amountString) {
    final cleanString = amountString.replaceAll(RegExp(r'[^0-9.]'), '');
    final doubleAmount = double.tryParse(cleanString) ?? 0.0;
    return doubleToCents(doubleAmount);
  }

  static String formatForInput(int cents) => (cents / 100).toStringAsFixed(2);
}


extension IntCurrencyX on int {
  String get toCurrencyFormat => CurrencyFormatter.format(this);
  String get toInputFormat => CurrencyFormatter.formatForInput(this);
}

extension DoubleCurrencyX on double {
  int get toCents => CurrencyFormatter.doubleToCents(this);
}

extension StringCurrencyX on String {
  int get toCents => CurrencyFormatter.stringToCents(this);
  int? get toCentsOrNull {
    if (trim().isEmpty) return null;
    return toCents;
  }
}