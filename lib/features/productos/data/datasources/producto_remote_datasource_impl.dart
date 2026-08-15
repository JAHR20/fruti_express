import 'dart:io';
import 'package:fruti_express_jahr_admin/features/productos/data/models/producto_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'producto_remote_datasource.dart';

class ProductoRemoteDatasourceImpl implements ProductoRemoteDatasource {
  final SupabaseClient supabase;

  ProductoRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<ProductoModel>> obtenerTodos() async {
    final response = await supabase
        .from('productos')
        .select()
        .order('nombre', ascending: true);

    return (response as List)
        .map((json) => ProductoModel.fromJson(json))
        .where((producto) => producto.id != null && producto.id!.isNotEmpty)
        .toList();
  }

  @override
  Future<ProductoModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from('productos')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? ProductoModel.fromJson(response) : null;
  }

  @override
  Future<ProductoModel?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('productos')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();
    return response != null ? ProductoModel.fromJson(response) : null;
  }

  @override
  Future<bool> existePorNombre(String nombre) async {
    final response = await supabase
        .from('productos')
        .select('id')
        .eq('nombre', nombre)
        .maybeSingle();
    return response != null;
  }

  @override
  Future<List<ProductoModel>> buscarProductos(String query, String sucursalId) async {
    final response = await supabase
        .from('productos')
        .select('*, inventario!inner(stock_disponible)')
        .ilike('nombre', '%$query%')
        .eq('inventario.sucursal_id', sucursalId);

    return (response as List).map((json) => ProductoModel.fromJson(json)).toList();
  }

  @override
  Future<ProductoModel> crear(ProductoModel model) async {
    final Map<String, dynamic> productoJson = model.toJson();
    productoJson.removeWhere((key, value) => value == null || value == '');

    final respone = await supabase
        .from('productos')
        .insert(productoJson)
        .select()
        .single();
    return ProductoModel.fromJson(respone);
  }

  @override
  Future<ProductoModel> actualizar(ProductoModel model) async {
    final Map<String, dynamic> productoJson = model.toJson();
    productoJson.removeWhere((key, value) => value == null || value == '');

    final reponse = await supabase
        .from('productos')
        .update(productoJson)
        .eq('id', model.id!)
        .select()
        .single();
    return ProductoModel.fromJson(reponse);
  }

  @override
  Future<void> eliminar(String id) async {
    await supabase.from('productos').update({'activo': false}).eq('id', id);
  }

  @override
  Future<List<ProductoModel>> obtenerPorCategoria(String categoriaId, String sucursalId) async {
    final response = await supabase
        .from('productos')
        .select('*, inventario!inner(stock_disponible)')
        .eq('categoria_id', categoriaId)
        .eq('inventario.sucursal_id', sucursalId);

    return (response as List).map((json) => ProductoModel.fromJson(json)).toList();
  }

  @override
  Future<String> subirImagen(File archivo, String nombreArchivo) async {
    final String rutaStorage = 'catalogo/$nombreArchivo';

    final extension = nombreArchivo.split('.').last.toLowerCase();

    String tipoContenido = 'image/jpeg'; 
    if (extension == 'png') {
      tipoContenido = 'image/png';
    } else if (extension == 'webp') {
      tipoContenido = 'image/webp';
    } else if (extension == 'heic') {
      tipoContenido = 'image/heic'; 
    }

    await supabase.storage
        .from('imagenes_productos')
        .upload(
          rutaStorage,
          archivo,
          fileOptions: FileOptions(
            cacheControl: '3600',
            upsert: true,
            contentType: tipoContenido, 
          ),
        );

    return supabase.storage
        .from('imagenes_productos')
        .getPublicUrl(rutaStorage);
  }

  @override
  Future<List<ProductoModel>> obtenerPorSucursal(String sucursalId) async {
    final response = await supabase
        .from('productos')
        .select('*, inventario!inner(stock_disponible)')
        .eq('inventario.sucursal_id', sucursalId); 

    return (response as List)
        .map((json) => ProductoModel.fromJson(json))
        .toList();
  }
}
