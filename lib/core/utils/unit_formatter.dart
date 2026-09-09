import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

extension MeasurementUnitFormatter on MeasurementUnit {
  String format(int quantity) {
    switch (this) {
      case MeasurementUnit.gram:
        if (quantity >= 1000) {
          return '${_cleanDecimal(quantity / 1000)} Kg';
        }
        return '$quantity g';

      case MeasurementUnit.milliliter:
        if (quantity >= 1000) {
          return '${_cleanDecimal(quantity / 1000)} L';
        }
        return '$quantity ml';

      case MeasurementUnit.piece:
        return '$quantity Pza${quantity != 1 ? 's' : ''}';

      case MeasurementUnit.bunch:
        return '$quantity Mazo${quantity != 1 ? 's' : ''}';
    }
  }
}

// Convierte 1.0 → "1", 1.5 → "1.5", 1.25 → "1.25"
String _cleanDecimal(double value) {
  return value == value.truncateToDouble()
      ? value.toInt().toString()
      : value.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
}