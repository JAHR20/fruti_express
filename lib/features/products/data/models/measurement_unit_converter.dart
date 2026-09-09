import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

class MeasurementUnitConverter implements JsonConverter<MeasurementUnit?, String?> {
  const MeasurementUnitConverter();

  @override
  MeasurementUnit? fromJson(String? json) {
    if (json == null) return null;
    
    switch (json.toLowerCase()) {
      // Casos en inglés (Nueva BD)
      case 'piece':
      case 'pieza': 
        return MeasurementUnit.piece;
      case 'gram':
      case 'gramo':
        return MeasurementUnit.gram;
      case 'milliliter':
      case 'mililitro':
        return MeasurementUnit.milliliter;
      case 'bunch':
      case 'mazo':
        return MeasurementUnit.bunch;
      default:
        return MeasurementUnit.piece; 
    }
  }

  @override
  String? toJson(MeasurementUnit? object) {
    if (object == null) return null;
    return object.name; 
  }
}