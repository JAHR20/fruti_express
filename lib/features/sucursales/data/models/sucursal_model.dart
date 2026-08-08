import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';

part 'sucursal_model.freezed.dart';
part 'sucursal_model.g.dart';

@freezed
abstract class SucursalModel with _$SucursalModel {
  const factory SucursalModel({
    required String id,
    required String nombre,
    required String calle,
    @JsonKey(name: 'numero_exterior') required String numeroExterior,
    @JsonKey(name: 'codigo_postal') required String codigoPostal,
    required String colonia,
    required String municipio,
    required String estado,
    double? latitud,
    double? longitud,
    @JsonKey(name: 'is_active') required bool activa,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
    @JsonKey(name: 'fecha_actualizacion') DateTime? fechaActualizacion,
  }) = _SucursalModel;

  factory SucursalModel.fromJson(Map<String, dynamic> json) =>
      _$SucursalModelFromJson(json);
}

extension SucursalModelX on SucursalModel {
  Sucursal toDomain() => Sucursal(
    id: id,
    nombre: nombre,
    calle: calle,
    numExterior: numeroExterior,
    codigoPostal: codigoPostal,
    colonia: colonia,
    municipio: municipio,
    estado: estado,
    latitud: latitud,
    longitud: longitud,
    activa: activa,
    fechaCreacion: fechaCreacion,
    fechaActualizacion: fechaActualizacion,
  );

  static SucursalModel fromDomain(Sucursal s) => SucursalModel(
    id: s.id,
    nombre: s.nombre,
    calle: s.calle,
    numeroExterior: s.numExterior,
    codigoPostal: s.codigoPostal,
    colonia: s.colonia,
    municipio: s.municipio,
    estado: s.estado,
    latitud: s.latitud,
    longitud: s.longitud,
    activa: s.activa,
    fechaCreacion: s.fechaCreacion,
    fechaActualizacion: s.fechaActualizacion,
  );
}