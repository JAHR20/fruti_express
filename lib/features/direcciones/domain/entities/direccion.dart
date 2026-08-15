import 'package:freezed_annotation/freezed_annotation.dart';

part 'direccion.freezed.dart';

@freezed
abstract class Direccion with _$Direccion {
  const factory Direccion({
    required String id,
    required String usuarioId,
    required String alias,
    required String calle,
    required String numExt,
    String? numInt,
    required String colonia,
    required String codigoPostal,
    required String municipio,
    required String estado,
    String? referencias,
    @Default(false) bool esPrincipal,
    required DateTime fechaCreacion,
    DateTime? updatedAT,

    required double latitud,
    required double longitud,
  }) = _Direccion;
}