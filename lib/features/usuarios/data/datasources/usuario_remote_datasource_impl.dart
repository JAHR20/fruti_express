import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/perfil.dart';
import 'usuario_remote_datasource.dart';

class UsuarioRemoteDatasourceImpl implements UsuarioRemoteDatasource {
  final SupabaseClient supabase;
  static const String _table =
      'perfiles'; // Variable para evitar errores de dedo

  UsuarioRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<Perfil>> obtenerTodos() async {
    final response = await supabase.from(_table).select().order('nombre');
    return (response as List).map((json) => Perfil.fromJson(json)).toList();
  }

  @override
  Future<Perfil?> obtenerPorId(String id) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('id', id)
        .maybeSingle();

    return response != null ? Perfil.fromJson(response) : null;
  }

  // --- 🔍 NUEVOS MÉTODOS DE CONSULTA ---

  @override
  Future<List<Perfil>> buscarUsuarios(String query) async {
    // 🕵️‍♂️ Filtro 'or' con 'ilike' para buscar en nombre O email (ignora mayúsculas)
    final response = await supabase
        .from(_table)
        .select()
        .or('nombre.ilike.%$query%,email.ilike.%$query%')
        .order('nombre');

    return (response as List).map((json) => Perfil.fromJson(json)).toList();
  }

  @override
  Future<List<Perfil>> obtenerRepartidores({String? sucursalId}) async {
    var query = supabase.from(_table).select().eq('rol', 'repartidor');

    // 📍 Si viene sucursalId, filtramos, si no (Admin), traemos todos
    if (sucursalId != null) {
      query = query.eq('sucursal_id', sucursalId);
    }

    final response = await query.order('nombre');
    return (response as List).map((json) => Perfil.fromJson(json)).toList();
  }

  // --- ✍️ ACTUALIZACIONES (Ahora devuelven el Perfil actualizado) ---

  @override
  Future<Perfil> actualizarPerfil(Perfil perfil) async {
    final response = await supabase
        .from(_table)
        .update(perfil.toJson())
        .eq('id', perfil.id)
        .select() // 🔥 Vital para obtener el objeto actualizado
        .single();

    return Perfil.fromJson(response);
  }

  @override
  Future<Perfil> cambiarRol({required String id, required String rol}) async {
    final response = await supabase
        .from(_table)
        .update({'rol': rol})
        .eq('id', id)
        .select()
        .single();

    return Perfil.fromJson(response);
  }

  @override
  Future<Perfil> cambiarEstado({
    required String id,
    required bool activo,
  }) async {
    final response = await supabase
        .from(_table)
        .update({'activo': activo})
        .eq('id', id)
        .select()
        .single();

    return Perfil.fromJson(response);
  }

  // --- 📊 MÉTRICAS Y REGLAS ---

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
  Future<List<Perfil>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from(_table)
        .select()
        .eq('sucursal_id', sucursalId)
        .eq('rol', 'cliente'); // Generalmente los encargados gestionan clientes

    return (response as List).map((json) => Perfil.fromJson(json)).toList();
  }
}
