import 'package:supabase_flutter/supabase_flutter.dart';
import 'producto_remote_datasource.dart';
import '../../domain/entities/producto.dart';

class ProductoRemoteDatasourceImpl implements ProductoRemoteDatasource {
  final SupabaseClient supabase;

  ProductoRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<Producto>> obtenerTodos() async {
    final response = await supabase
        .from('productos')
        .select()
        .order('nombre', ascending: true);

    return (response as List).map((json) => Producto.fromJson(json)).toList();
  }

  @override
  Future<Producto?> obtenerPorId(String id) async {
    final response = await supabase
        .from('productos')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? Producto.fromJson(response) : null;
  }

  @override
  Future<Producto?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('productos')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();
    return response != null ? Producto.fromJson(response) : null;
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
  Future<Producto> crear(Producto producto) async {
    final respone = await supabase
        .from('productos')
        .insert(producto.toJson())
        .select()
        .single();
    return Producto.fromJson(respone);
  }

  @override
  Future<Producto> actualizar(Producto producto) async {
    final reponse = await supabase
        .from('productos')
        .update(producto.toJson())
        .eq('id', producto.id!)
        .select()
        .single();
    return Producto.fromJson(reponse);
  }

  @override
  Future<void> eliminar(String id) async {
    // Aplicamos la regla del elefante: Desactivar en lugar de borrar
    await supabase.from('productos').update({'activo': false}).eq('id', id);
  }

  @override
  Future<List<Producto>> obtenerPorCategoria(String categoriaId) async {
    final response = await supabase
        .from('productos')
        .select()
        .eq('categoria_id', categoriaId);

    return (response as List).map((json) => Producto.fromJson(json)).toList();
  }
}
