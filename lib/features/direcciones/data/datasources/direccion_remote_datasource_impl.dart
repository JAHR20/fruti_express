import 'package:fruti_express_jahr_admin/features/direcciones/data/models/direccion_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'direccion_remote_datasource.dart';

class DireccionRemoteDatasourceImpl implements DireccionRemoteDatasource {
  final SupabaseClient supabase;
  DireccionRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<DireccionModel>> obtenerPorUsuario(String usuarioId) async {
    final response = await supabase
        .from('direcciones')
        .select()
        .eq('usuario_id', usuarioId)
        .order('es_principal', ascending: false);
    return (response as List)
        .map((json) => DireccionModel.fromJson(json))
        .toList();
  }

  @override
  Future<DireccionModel> crear(DireccionModel model) async {
    final datos = model.toJson();
    datos.remove('id');
    datos.remove('updated_at');
    datos.remove('fecha_creacion');
    final response = await supabase
        .from('direcciones')
        .insert(datos)
        .select()
        .single();
    return DireccionModel.fromJson(response);
  }

  @override
  Future<DireccionModel> actualizar(DireccionModel model) async {
    final response = await supabase
        .from('direcciones')
        .update(model.toJson())
        .eq('id', model.id)
        .select()
        .single();
    return DireccionModel.fromJson(response);
  }

  @override
  Future<void> eliminar(String id) async {
    await supabase.from('direcciones').delete().eq('id', id);
  }

  @override
  Future<void> establecerPrincipal(String usuarioId, String direccionId) async {
    // 1. Ponemos todas las direcciones de este usuario en es_principal = false
    await supabase
        .from('direcciones')
        .update({'es_principal': false})
        .eq('usuario_id', usuarioId);

    // 2. Activamos la dirección seleccionada
    await supabase
        .from('direcciones')
        .update({'es_principal': true})
        .eq('id', direccionId);
  }
}
