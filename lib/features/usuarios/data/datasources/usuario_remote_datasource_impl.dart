import 'package:fruti_express_jahr_admin/features/usuarios/data/models/perfil_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'usuario_remote_datasource.dart';

class UsuarioRemoteDatasourceImpl implements UsuarioRemoteDatasource {
  final SupabaseClient supabase;
  static const String _table = 'perfiles';

  UsuarioRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<PerfilModel>> obtenerTodos() async {
    final response = await supabase.from(_table).select().order('nombre');

    return (response as List)
        .map((json) => PerfilModel.fromJson(json))
        .toList();
  }

  @override
  Future<PerfilModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('id', id)
        .maybeSingle();

    return response != null ? PerfilModel.fromJson(response) : null;
  }

  @override
  Future<List<PerfilModel>> buscarUsuarios(String query) async {
    final response = await supabase
        .from(_table)
        .select()
        .or('nombre.ilike.%$query%,email.ilike.%$query%')
        .order('nombre');

    return (response as List)
        .map((json) => PerfilModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<PerfilModel>> obtenerRepartidores({String? sucursalId}) async {
    var query = supabase.from(_table).select().eq('rol', 'repartidor');
    if (sucursalId != null) {
      query = query.eq('sucursal_id', sucursalId);
    }

    final response = await query.order('nombre');
    return (response as List)
        .map((json) => PerfilModel.fromJson(json))
        .toList();
  }

  @override
  Future<PerfilModel> actualizarPerfil(PerfilModel model) async {
    final response = await supabase
        .from(_table)
        .update(model.toJson())
        .eq('id', model.id)
        .select()
        .single();

    return PerfilModel.fromJson(response);
  }

  @override
  Future<PerfilModel> cambiarRol({
    required String id,
    required String rol,
  }) async {
    final response = await supabase
        .from(_table)
        .update({'rol': rol})
        .eq('id', id)
        .select()
        .single();

    return PerfilModel.fromJson(response);
  }

  @override
  Future<PerfilModel> cambiarEstado({
    required String id,
    required bool activo,
  }) async {
    final response = await supabase
        .from(_table)
        .update({'activo': activo})
        .eq('id', id)
        .select()
        .single();

    return PerfilModel.fromJson(response);
  }

  @override
  Future<int> contarPorRolYEstado({
    required String rol,
    required bool activo,
  }) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('rol', rol)
        .eq('activo', activo)
        .count(CountOption.exact);

    return response.count;
  }

  @override
  Future<bool> existeEncargadoEnSucursal(String sucursalId) async {
    final response = await supabase
        .from(_table)
        .select('id')
        .eq('rol', 'encargado')
        .eq('sucursal_id', sucursalId)
        .maybeSingle();

    return response != null;
  }

  @override
  Future<List<PerfilModel>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('sucursal_id', sucursalId)
        .eq('rol', 'cliente');

    return (response as List)
        .map((json) => PerfilModel.fromJson(json))
        .toList();
  }
}
