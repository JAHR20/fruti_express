import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/entities/configuracion_envio.dart';
import 'package:fruti_express_jahr_admin/features/envios/domain/enums/estrategia_envio.dart';

part 'configuracion_envio_model.freezed.dart';
part 'configuracion_envio_model.g.dart';

@freezed
abstract class ConfiguracionEnvioModel with _$ConfiguracionEnvioModel {
  const ConfiguracionEnvioModel._();

  const factory ConfiguracionEnvioModel({
    required String id,
    @JsonKey(name: 'sucursal_id') required String sucursalId,
    required EstrategiaEnvio estrategia,
    @JsonKey(name: 'radio_max_km') required double radioMaximoKm,
    @JsonKey(includeToJson: false) @Default([]) List<String> codigosPostalesPermitidos,
    @JsonKey(name: 'requerir_validacion_cp') @Default(false) bool requerirValidacionCP,
    @JsonKey(name: 'monto_minimo_envio_gratis') double? montoMinimoEnvioGratis,
    required bool activa,
    @JsonKey(name: 'fecha_creacion') required DateTime fechaCreacion,
  }) = _ConfiguracionEnvioModel;

  factory ConfiguracionEnvioModel.fromJson(Map<String, dynamic> json) =>
      _$ConfiguracionEnvioModelFromJson(json);

  // 2. 🌟 Creamos nuestro propio factory para limpiar los datos antes
  factory ConfiguracionEnvioModel.fromSupabase(Map<String, dynamic> json) {
    // Interceptamos la respuesta de Supabase (el JOIN) para aplanar los C.P.
    if (json['sucursal_cobertura'] != null) {
      final listaRelacional = json['sucursal_cobertura'] as List<dynamic>;
      // Lo inyectamos en el json
      json['codigosPostalesPermitidos'] = listaRelacional
          .map((e) => e['codigo_postal'].toString())
          .toList();
    }
    
    // Ahora sí se lo pasamos al fromJson generado
    return ConfiguracionEnvioModel.fromJson(json);
  }

  ConfiguracionEnvio toEntity() {
    return ConfiguracionEnvio(
      id: id,
      sucursalId: sucursalId,
      estrategia: estrategia,
      radioMaximoKm: radioMaximoKm,
      codigosPostalesPermitidos: codigosPostalesPermitidos,
      requerirValidacionCP: requerirValidacionCP,
      montoMinimoEnvioGratis: montoMinimoEnvioGratis,
      activa: activa,
      fechaCreacion: fechaCreacion,
    );
  }

  factory ConfiguracionEnvioModel.fromEntity(ConfiguracionEnvio entity) {
    return ConfiguracionEnvioModel(
      id: entity.id,
      sucursalId: entity.sucursalId,
      estrategia: entity.estrategia,
      radioMaximoKm: entity.radioMaximoKm,
      codigosPostalesPermitidos: entity.codigosPostalesPermitidos,
      requerirValidacionCP: entity.requerirValidacionCP,
      montoMinimoEnvioGratis: entity.montoMinimoEnvioGratis,
      activa: entity.activa,
      fechaCreacion: entity.fechaCreacion,
    );
  }

  Map<String, dynamic> toJsonParaInsertar() {
  return {
    'sucursal_id': sucursalId,
    'estrategia': estrategia.name,
    'radio_max_km': radioMaximoKm,
    'activa': activa,
    'requerir_validacion_cp': requerirValidacionCP,
    'monto_minimo_envio_gratis': montoMinimoEnvioGratis,
  };
}
}
