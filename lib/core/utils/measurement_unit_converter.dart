import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/products/domain/enums/measurement_unit.dart';

class MeasurementUnitConverter implements JsonConverter<MeasurementUnit?, String?> {
  const MeasurementUnitConverter();

  // De Supabase (String) a Flutter (Enum)
  @override
  MeasurementUnit? fromJson(String? json) {
    if (json == null) return null;
    return MeasurementUnit.values.where((u) => u.name == json).firstOrNull;
  }

  // De Flutter (Enum) a Supabase (String)
  @override
  String? toJson(MeasurementUnit? object) => object?.name;
}