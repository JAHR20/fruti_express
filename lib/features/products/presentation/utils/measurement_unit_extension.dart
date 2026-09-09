import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

extension MeasurementUnitUI on MeasurementUnit {
  String get displayName {
    switch (this) {
      case MeasurementUnit.gram:
        return 'Kilogramo (Kg)';
      case MeasurementUnit.milliliter:
        return 'Litro (L)';
      case MeasurementUnit.piece:
        return 'Pieza (Pza)';
      case MeasurementUnit.bunch:
        return 'Mazo (Mz)';
    }
  }
}