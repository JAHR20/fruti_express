import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/tarifa_envio.dart';

part 'tarifa_envio_model.freezed.dart';
part 'tarifa_envio_model.g.dart';

@freezed
abstract class TarifaEnvioModel with _$TarifaEnvioModel {
  const TarifaEnvioModel._();

  const factory TarifaEnvioModel({
    required String id,
    @JsonKey(name: 'sucursal_id') required String sucursalId,
    required String nombre,
    @JsonKey(name: 'distancia_min_km') required double distanciaMinKm,
    @JsonKey(name: 'distancia_max_km') required double distanciaMaxKm,
    required int costo,
    required bool activa,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
  }) = _TarifaEnvioModel;

  factory TarifaEnvioModel.fromJson(Map<String, dynamic> json) =>
      _$TarifaEnvioModelFromJson(json);

  TarifaEnvio toEntity() {
    return TarifaEnvio(
      id: id,
      sucursalId: sucursalId,
      nombre: nombre,
      distanciaMinKm: distanciaMinKm,
      distanciaMaxKm: distanciaMaxKm,
      costo: costo,
      activa: activa,
      fechaCreacion: fechaCreacion,
    );
  }
  factory TarifaEnvioModel.fromEntity(TarifaEnvio entity) {
    return TarifaEnvioModel(
      id: entity.id,
      sucursalId: entity.sucursalId,
      nombre: entity.nombre,
      distanciaMinKm: entity.distanciaMinKm,
      distanciaMaxKm: entity.distanciaMaxKm,
      costo: entity.costo,
      activa: entity.activa,
      fechaCreacion: entity.fechaCreacion,
    );
  }

  Map<String, dynamic> toJsonParaInsertar() {
    final json = toJson(); 
    json.remove('id');
    json.remove('fecha_creacion');
    return json;
  }
}
