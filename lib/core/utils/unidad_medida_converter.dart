import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/productos/domain/enums/unidad_medida_producto.dart';

class UnidadMedidaConverter implements JsonConverter<UnidadMedida?, String?> {
  const UnidadMedidaConverter();

  // De Supabase (String) a Flutter (Enum)
  @override
  UnidadMedida? fromJson(String? json) {
    if (json == null) return null;
    return UnidadMedida.values.where((u) => u.name == json).firstOrNull;
  }

  // De Flutter (Enum) a Supabase (String)
  @override
  String? toJson(UnidadMedida? object) => object?.name;
}