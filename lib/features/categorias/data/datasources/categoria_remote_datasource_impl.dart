import 'package:supabase_flutter/supabase_flutter.dart';
import 'categoria_remote_datasource.dart';
import '../../domain/entities/categoria.dart';

class CategoriaRemoteDataSourceImpl implements CategoriaRemoteDataSource {
  final SupabaseClient supabase;

  CategoriaRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<Categoria>> obtenerTodas() async {
    final response = await supabase
        .from('categorias')
        .select()
        .order('nombre', ascending: true);

    return (response as List).map((json) => Categoria.fromJson(json)).toList();
  }

  @override
  Future<Categoria?> obtenerPorId(String id) async {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? Categoria.fromJson(response) : null;
  }

  @override
  Future<Categoria?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();
    return response != null ? Categoria.fromJson(response) : null;
  }

  @override
  Future<List<Categoria>> obtenerPorPadre(String? padreId) async {
    // Si padreId es nulo, buscamos las categorías raíz
    final query = supabase.from('categorias').select();
    final response = padreId == null
        ? await query.isFilter('padre_id', null)
        : await query.eq('padre_id', padreId);

    return (response as List).map((json) => Categoria.fromJson(json)).toList();
  }

  @override
  Stream<List<Categoria>> watchTodas() {
    return supabase
        .from('categorias')
        .stream(primaryKey: ['id'])
        .order('nombre')
        .map((data) => data.map((json) => Categoria.fromJson(json)).toList());
  }

  @override
  Future<Categoria> crear(Categoria categoria) async {
    final response = await supabase
        .from('categorias')
        .insert(categoria.toJson())
        .select()
        .single();

    return Categoria.fromJson(response);
  }

  @override
  Future<Categoria> actualizar(Categoria categoria) async {
    final response = await supabase
        .from('categorias')
        .update(categoria.toJson())
        .eq('id', categoria.id)
        .select()
        .single();

    return Categoria.fromJson(response);
  }

  @override
  Future<void> desactivar(String id) async {
    await supabase.from('categorias').update({'activa': false}).eq('id', id);
  }
}
