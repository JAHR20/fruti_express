import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/direcciones/domain/entities/direccion.dart';

part 'direccion_model.freezed.dart';
part 'direccion_model.g.dart';

@freezed
abstract class DireccionModel with _$DireccionModel {
  const factory DireccionModel({
    required String id,
    @JsonKey(name: 'usuario_id') required String usuarioId,
    required String alias,
    required String calle,
    @JsonKey(name: 'num_ext') required String numExt,
    @JsonKey(name: 'num_int') String? numInt,
    required String colonia,
    @JsonKey(name: 'codigo_postal') required String codigoPostal,
    required String municipio,
    required String estado,
    String? referencias,
    @JsonKey(name: 'es_principal') @Default(false) bool esPrincipal,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    required double latitud,
    required double longitud,
  }) = _DireccionModel;

  factory DireccionModel.fromJson(Map<String, dynamic> json) =>
      _$DireccionModelFromJson(json);
}

extension DireccionModelX on DireccionModel {
  Direccion toDomain() => Direccion(
    id: id,
    usuarioId: usuarioId,
    alias: alias,
    calle: calle,
    numExt: numExt,
    numInt: numInt,
    colonia: colonia,
    codigoPostal: codigoPostal,
    municipio: municipio,
    estado: estado,
    referencias: referencias,
    esPrincipal: esPrincipal,
    fechaCreacion: fechaCreacion,
    updatedAT: updatedAt,
    latitud: latitud,
    longitud: longitud
  );

  static DireccionModel fromDomain(Direccion d) => DireccionModel(
    id: d.id,
    usuarioId: d.usuarioId,
    alias: d.alias,
    calle: d.calle,
    numExt: d.numExt,
    numInt: d.numInt,
    colonia: d.colonia,
    codigoPostal: d.codigoPostal,
    municipio: d.municipio,
    estado: d.estado,
    referencias: d.referencias,
    esPrincipal: d.esPrincipal,
    fechaCreacion: d.fechaCreacion,
    updatedAt: d.updatedAT,
    latitud: d.latitud ?? 0.0,
    longitud: d.longitud ?? 0.0
  );
}