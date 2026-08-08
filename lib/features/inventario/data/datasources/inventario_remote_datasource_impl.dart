import 'package:fruti_express_jahr_admin/features/inventario/data/models/inventario_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'inventario_remote_datasource.dart';

class InventarioRemoteDatasourceImpl implements InventarioRemoteDatasource {
  final SupabaseClient supabase;

  InventarioRemoteDatasourceImpl(this.supabase);

  @override
  Future<InventarioModel> crear(InventarioModel model) async {
    final response = await supabase
        .from('inventario')
        .insert(model.toJson())
        .select()
        .single();
    return InventarioModel.fromJson(response);
  }

  @override
  Future<List<InventarioModel>> obtenerPorProducto(String productoId) async {
    final response = await supabase
        .from('inventario')
        .select()
        .eq('producto_id', productoId);
    return (response as List).map((json) => InventarioModel.fromJson(json)).toList();
  }

  @override
  Stream<List<InventarioModel>> watchPorSucursal(String sucursalId) {
    return supabase
        .from('inventario')
        .stream(primaryKey: ['id'])
        .eq('sucursal_id', sucursalId)
        .map((data) => data.map((json) => InventarioModel.fromJson(json)).toList());
  }

  @override
  Future<InventarioModel?> obtener({
    required String productoId,
    required String sucursalId,
  }) async {
    final response = await supabase
        .from('inventario')
        .select()
        .eq('producto_id', productoId)
        .eq('sucursal_id', sucursalId)
        .maybeSingle();

    return response != null ? InventarioModel.fromJson(response) : null;
  }

  @override
  Future<InventarioModel> actualizar(InventarioModel model) async {
    // .upsert() detecta si ya existe el par producto/sucursal.
    // Si existe, hace UPDATE; si no, hace INSERT.
    final response = await supabase
        .from('inventario')
        .upsert(model.toJson())
        .select()
        .single();

    return InventarioModel.fromJson(response);
  }

  @override
  Future<List<InventarioModel>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from('inventario')
        .select()
        .eq('sucursal_id', sucursalId);

    return (response as List).map((json) => InventarioModel.fromJson(json)).toList();
  }

  @override
  Future<void> ajustarStockAtomicamente({
    required String productoId,
    required String sucursalId,
    required int cantidadCambio,
  }) async {
    await supabase.rpc(
      'ajustar_stock_inventario',
      params: {
        'p_producto_id': productoId,
        'p_sucursal_id': sucursalId,
        'p_cantidad_cambio': cantidadCambio,
      },
    );
  }

  @override
  Future<int> obtenerStockActual(String productoId, String sucursalId) async {
    final response = await supabase
        .from('inventario')
        .select('stock_disponible')
        .eq('producto_id', productoId)
        .eq('sucursal_id', sucursalId)
        .maybeSingle();

    return response?['stock_disponible'] ?? 0;
  }
}
