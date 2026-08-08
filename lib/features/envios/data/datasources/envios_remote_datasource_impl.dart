import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruti_express_jahr_admin/core/errors/failures.dart'; // Tu clase de errores
import 'package:fruti_express_jahr_admin/features/envios/data/datasources/envios_remote_datasource.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/configuracion_envio_model.dart';
import 'package:fruti_express_jahr_admin/features/envios/data/models/tarifa_envio_model.dart';

class EnviosRemoteDatasourceImpl implements EnviosRemoteDatasource {
  final SupabaseClient _supabaseClient;

  EnviosRemoteDatasourceImpl(this._supabaseClient);

  @override
  Future<ConfiguracionEnvioModel?> obtenerConfiguracion(String sucursalId) async {
    try {
      // 🌟 1. Traemos SOLO la configuración (sin el Join que causa el error)
      final response = await _supabaseClient
          .from('configuracion_envio')
          .select() 
          .eq('sucursal_id', sucursalId)
          .maybeSingle();

      if (response == null) {
        return null; // Sucursal nueva, no hay problema
      }

      // 🌟 2. Traemos los Códigos Postales por separado
      final coberturaResponse = await _supabaseClient
          .from('sucursal_cobertura')
          .select('codigo_postal')
          .eq('sucursal_id', sucursalId);

      // 🌟 3. Armamos el mapa "engañando" a tu modelo para que crea que vinieron juntos
      final datosCompletos = Map<String, dynamic>.from(response);
      datosCompletos['sucursal_cobertura'] = coberturaResponse;

      // ¡Tu modelo lo procesará perfectamente!
      return ConfiguracionEnvioModel.fromSupabase(datosCompletos);
      
    } on PostgrestException catch (e) {
      throw ServerFailure(e.message);
    } catch (e, stacktrace) {
      print('💀 ERROR AL LEER CONFIGURACIÓN: $e');
      print('📍 STACKTRACE: $stacktrace');
      throw ServerFailure('Error al obtener la configuración');
    }
  }

  @override
  Future<List<TarifaEnvioModel>> obtenerTarifas(String sucursalId) async {
    try {
      final response = await _supabaseClient
          .from('tarifas_envio') // Nombre exacto de tu tabla SQL
          .select()
          .eq('sucursal_id', sucursalId)
          .eq(
            'activa',
            true,
          ) // Solo traemos las tarifas activas por seguridad extra
          .order(
            'distancia_min_km',
            ascending: true,
          ); // Ordenamos de menor a mayor distancia

      return response.map((json) => TarifaEnvioModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure('Error inesperado al obtener las tarifas de envío');
    }
  }

  @override
  Future<void> guardarConfiguracion(
    ConfiguracionEnvioModel configuracion,
  ) async {
    try {
      await _supabaseClient.rpc(
        'guardar_configuracion_envio',
        params: {
          'p_configuracion': configuracion.toJsonParaInsertar(),
          'p_codigos_postales': configuracion.codigosPostalesPermitidos,
        },
      );
    } on PostgrestException catch (e) {
      print('🔥 ERROR DE SUPABASE: ${e.message} \nDETALLES: ${e.details} \nHINT: ${e.hint}');
      throw ServerFailure(e.message);
    } catch (e, stacktrace) {
      print('💀 ERROR DE DART: $e'); 
      print('📍 STACKTRACE: $stacktrace');
      throw ServerFailure('Error al guardar la configuración de envío');
    }
  }

  @override
  Future<void> guardarTarifa(TarifaEnvioModel tarifa) async {
    try {
      final datos = tarifa.id.isEmpty
          ? tarifa.toJsonParaInsertar()
          : tarifa.toJson();

      await _supabaseClient.from('tarifas_envio').upsert(datos);
    } on PostgrestException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure('Error al guardar la tarifa');
    }
  }

  @override
  Future<void> eliminarTarifa(String tarifaId) async {
    try {
      await _supabaseClient.from('tarifas_envio').delete().eq('id', tarifaId);
    } on PostgrestException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw ServerFailure('Error al eliminar la tarifa');
    }
  }
}
