import 'package:supabase_flutter/supabase_flutter.dart';
import 'inventario_remote_datasource.dart';
import '../../domain/entities/inventario.dart';

class InventarioRemoteDatasourceImpl implements InventarioRemoteDatasource {
  final SupabaseClient supabase;

  InventarioRemoteDatasourceImpl(this.supabase);

  @override
  Future<Inventario> crear(Inventario inventario) async {
    final response = await supabase
        .from('inventarios')
        .insert(inventario.toJson())
        .select()
        .single();
    return Inventario.fromJson(response);
  }

  @override
  Future<List<Inventario>> obtenerPorProducto(String productoId) async {
    final response = await supabase
        .from('inventarios')
        .select()
        .eq('producto_id', productoId);
    return (response as List).map((json) => Inventario.fromJson(json)).toList();
  }

  @override
  Stream<List<Inventario>> watchPorSucursal(String sucursalId) {
    return supabase
        .from('inventarios')
        .stream(primaryKey: ['id'])
        .eq('sucursal_id', sucursalId)
        .map((data) => data.map((json) => Inventario.fromJson(json)).toList());
  }

  @override
  Future<Inventario?> obtener({
    required String productoId,
    required String sucursalId,
  }) async {
    final response = await supabase
        .from('inventarios')
        .select()
        .eq('producto_id', productoId)
        .eq('sucursal_id', sucursalId)
        .maybeSingle();

    return response != null ? Inventario.fromJson(response) : null;
  }

  @override
  Future<Inventario> actualizar(Inventario inventario) async {
    // .upsert() detecta si ya existe el par producto/sucursal.
    // Si existe, hace UPDATE; si no, hace INSERT.
    final response = await supabase
        .from('inventarios')
        .upsert(inventario.toJson())
        .select()
        .single();

    return Inventario.fromJson(response);
  }

  @override
  Future<List<Inventario>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from('inventarios')
        .select()
        .eq('sucursal_id', sucursalId);

    return (response as List).map((json) => Inventario.fromJson(json)).toList();
  }
}
