import 'package:freezed_annotation/freezed_annotation.dart';

part 'ubicacion_postal.freezed.dart';

@freezed
abstract class UbicacionPostal with _$UbicacionPostal {
  const factory UbicacionPostal({
    required String codigoPostal,
    required String estado,
    required String municipio,
    @Default([]) List<String> codigosPostalesDisponibles,
    @Default({}) Map<String, List<String>> coloniasPorCodigoPostal,
  }) = _UbicacionPostal;
}