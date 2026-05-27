import 'package:fruti_express_jahr_admin/features/sucursales/domain/entities/sucursal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'sucursal_remote_datasource.dart';

class SucursalRemoteDatasourceImpl implements SucursalRemoteDatasource {
  final SupabaseClient supabase;

  SucursalRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<Sucursal>> obtenerTodas() async {
    final response = await supabase
        .from('sucursales')
        .select()
        .order('nombre', ascending: true);

    return (response as List).map((json) => Sucursal.fromJson(json)).toList();
  }

  @override
  Future<Sucursal?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('sucursales')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();

    return response != null ? Sucursal.fromJson(response) : null;
  }

  @override
  Stream<List<Sucursal>> watchTodas() {
    return supabase
        .from('sucursales')
        .stream(primaryKey: ['id'])
        .order('nombre')
        .map((data) => data.map((json) => Sucursal.fromJson(json)).toList());
  }

  @override
  Future<Sucursal?> obtenerPorId(String id) async {
    final response = await supabase
        .from('sucursales')
        .select()
        .eq('id', id)
        .maybeSingle();

    return response != null ? Sucursal.fromJson(response) : null;
  }

  @override
  Future<Sucursal> crear(Sucursal sucursal) async {
    final response = await supabase
        .from('sucursales')
        .insert(sucursal.toJson())
        .select()
        .single();

    return Sucursal.fromJson(response);
  }

  @override
  Future<Sucursal> actualizar(Sucursal sucursal) async {
    final response = await supabase
        .from('sucursales')
        .update(sucursal.toJson())
        .eq('id', sucursal.id)
        .select()
        .single();

    return Sucursal.fromJson(response);
  }

  @override
  Future<void> desactivar(String id) async {
    // Aplicamos Soft Delete: Desactivamos la sucursal en lugar de borrarla
    await supabase.from('sucursales').update({'activa': false}).eq('id', id);
  }
}
