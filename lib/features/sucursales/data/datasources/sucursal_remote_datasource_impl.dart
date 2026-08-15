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

  @override
  Future<List<String>> obtenerCobertura(String sucursalId) async {
    final response = await supabase
        .from('sucursal_cobertura')
        .select('codigo_postal')
        .eq('sucursal_id', sucursalId);
    return (response as List)
        .map((row) => row['codigo_postal'] as String)
        .toList();
  }

  @override
  Future<SucursalModel?> obtenerPorCodigoPostal(String codigoPostal) async {
    final response = await supabase
        .from('sucursal_cobertura')
        .select('sucursales(*)')
        .eq('codigo_postal', codigoPostal)
        .maybeSingle();

    if (response == null || response['sucursales'] == null) {
      return null;
    }

    return SucursalModel.fromJson(response['sucursales']);
  }

  @override
  Future<void> actualizarCobertura({
    required String sucursalId,
    required List<String> codigosPostales,
  }) async {
    await supabase
        .from('sucursal_cobertura')
        .delete()
        .eq('sucursal_id', sucursalId);

    if (codigosPostales.isNotEmpty) {
      final listaInsert = codigosPostales
          .map((cp) => {'sucursal_id': sucursalId, 'codigo_postal': cp})
          .toList();

      await supabase.from('sucursal_cobertura').insert(listaInsert);
    }
  }
}
