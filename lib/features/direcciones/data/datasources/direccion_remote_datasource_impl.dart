import 'package:supabase_flutter/supabase_flutter.dart';
import 'direccion_remote_datasource.dart';
import '../../domain/entities/direccion.dart';

class DireccionRemoteDatasourceImpl implements DireccionRemoteDatasource {
  final SupabaseClient supabase;
  DireccionRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<Direccion>> obtenerPorUsuario(String usuarioId) async {
    final response = await supabase
        .from('direcciones')
        .select()
        .eq('usuario_id', usuarioId)
        .order('es_principal', ascending: false);
    return (response as List).map((json) => Direccion.fromJson(json)).toList();
  }

  @override
  Future<Direccion> crear(Direccion direccion) async {
    final response = await supabase
        .from('direcciones')
        .insert(direccion.toJson())
        .select()
        .single();
    return Direccion.fromJson(response);
  }

  @override
  Future<Direccion> actualizar(Direccion direccion) async {
    final response = await supabase
        .from('direcciones')
        .update(direccion.toJson())
        .eq('id', direccion.id)
        .select()
        .single();
    return Direccion.fromJson(response);
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
