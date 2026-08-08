import 'package:freezed_annotation/freezed_annotation.dart';

part 'sucursal.freezed.dart';

@freezed
abstract class Sucursal with _$Sucursal {
  const factory Sucursal({
    required String id,
    required String nombre,
    required String calle,
    required String numExterior,
    required String codigoPostal,
    required String colonia,
    required String municipio,
    required String estado,
    double? latitud,
    double? longitud,
    required bool activa,
    required DateTime fechaCreacion,
    DateTime? fechaActualizacion,
  }) = _Sucursal;
  // ← Sin fromJson, sin @JsonKey, sin .g.dart
}