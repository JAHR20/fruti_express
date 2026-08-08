import 'package:fruti_express_jahr_admin/features/sucursales/data/models/sucursal_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'sucursal_remote_datasource.dart';

class SucursalRemoteDatasourceImpl implements SucursalRemoteDatasource {
  final SupabaseClient supabase;

  SucursalRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<SucursalModel>> obtenerTodas() async {
    final response = await supabase
        .from('sucursales')
        .select()
        .order('nombre', ascending: true);

    return (response as List)
        .map((json) => SucursalModel.fromJson(json))
        .toList();
  }

  @override
  Future<SucursalModel?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('sucursales')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();

    if (response == null) return null;

    return SucursalModel.fromJson(response);
  }

  @override
  Stream<List<SucursalModel>> watchTodas() {
    return supabase
        .from('sucursales')
        .stream(primaryKey: ['id'])
        .order('nombre')
        .map(
          (data) => data.map((json) => SucursalModel.fromJson(json)).toList(),
        );
  }

  @override
  Future<SucursalModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from('sucursales')
        .select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;

    return SucursalModel.fromJson(response);
  }

  @override
  Future<SucursalModel> crear(SucursalModel model) async {
    final datos = model.toJson();
    datos.remove('id');
    final response = await supabase
        .from('sucursales')
        .insert(datos)
        .select()
        .single();

    return SucursalModel.fromJson(response);
  }

  @override
  Future<SucursalModel> actualizar(SucursalModel model) async {
    final datos = model.toJson();
    datos.remove('id');
    final response = await supabase
        .from('sucursales')
        .update(datos)
        .eq('id', model.id)
        .select()
        .single();

    return SucursalModel.fromJson(response);
  }

  // --- 📡 NUEVOS MÉTODOS DE COBERTURA (Actualizados para BD Relacional) ---

  @override
  Future<List<String>> obtenerCobertura(String sucursalId) async {
    // Vamos a la nueva tabla y traemos solo los C.P. de esta sucursal
    final response = await supabase
        .from('sucursal_cobertura')
        .select('codigo_postal')
        .eq('sucursal_id', sucursalId);

    // Mapeamos la lista de mapas [{'codigo_postal': '96700'}, ...] a una lista de Strings
    return (response as List)
        .map((row) => row['codigo_postal'] as String)
        .toList();
  }

  @override
  Future<void> guardarCobertura({
    required String sucursalId,
    required List<String> codigosPostales,
  }) async {
    // 1. Primero borramos la cobertura anterior de esta sucursal para evitar duplicados
    await supabase
        .from('sucursal_cobertura')
        .delete()
        .eq('sucursal_id', sucursalId);

    // 2. Si la lista nueva no está vacía, insertamos los nuevos registros
    if (codigosPostales.isNotEmpty) {
      final insertData = codigosPostales
          .map((cp) => {'sucursal_id': sucursalId, 'codigo_postal': cp})
          .toList();

      await supabase.from('sucursal_cobertura').insert(insertData);
    }
  }

  @override
  Future<SucursalModel?> obtenerPorCodigoPostal(String codigoPostal) async {
    // 🌟 Magia relacional de Supabase: Buscamos en la tabla de cobertura
    // y hacemos un JOIN automático para traernos toda la info de la sucursal
    final response = await supabase
        .from('sucursal_cobertura')
        .select(
          'sucursales(*)',
        ) // Trae la fila completa de la tabla 'sucursales'
        .eq('codigo_postal', codigoPostal)
        .maybeSingle();

    // Si no hay cobertura, o por alguna razón el join falla
    if (response == null || response['sucursales'] == null) {
      return null;
    }

    // Convertimos el JSON anidado al modelo de Sucursal
    return SucursalModel.fromJson(response['sucursales']);
  }
}
