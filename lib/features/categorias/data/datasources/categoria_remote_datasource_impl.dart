import 'package:fruti_express_jahr_admin/features/categorias/data/models/categoria_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'categoria_remote_datasource.dart';

class CategoriaRemoteDataSourceImpl implements CategoriaRemoteDataSource {
  final SupabaseClient supabase;

  CategoriaRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<CategoriaModel>> obtenerTodas() async {
    final response = await supabase
        .from('categorias')
        .select()
        .order('nombre', ascending: true);

    return (response as List)
        .map((json) => CategoriaModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CategoriaModel>> obtenerActivas() async {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('is_active', true)
        .order('nombre', ascending: true);

    return (response as List)
        .map((json) => CategoriaModel.fromJson(json))
        .toList();
  }

  @override
  Future<CategoriaModel?> obtenerPorId(String id) async {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response != null ? CategoriaModel.fromJson(response) : null;
  }

  @override
  Future<CategoriaModel?> obtenerPorNombre(String nombre) async {
    final response = await supabase
        .from('categorias')
        .select()
        .eq('nombre', nombre)
        .maybeSingle();
    return response != null ? CategoriaModel.fromJson(response) : null;
  }

  @override
  Future<List<CategoriaModel>> obtenerPorPadre(String? padreId) async {
    // Si padreId es nulo, buscamos las categorías raíz
    final query = supabase.from('categorias').select();
    final response = padreId == null
        ? await query.isFilter('categoria_padre_id', null)
        : await query.eq('categoria_padre_id', padreId);

    return (response as List)
        .map((json) => CategoriaModel.fromJson(json))
        .toList();
  }

  @override
  Stream<List<CategoriaModel>> watchTodas() {
    return supabase
        .from('categorias')
        .stream(primaryKey: ['id'])
        .order('nombre')
        .map(
          (data) => data.map((json) => CategoriaModel.fromJson(json)).toList(),
        );
  }

  @override
  Future<CategoriaModel> crear(CategoriaModel model) async {
    final mapaDatos = model.toJson();

    // 🚨 2. ELIMINAMOS las llaves que no queremos enviar.
    // Al quitar el 'id', Supabase dirá: "Ah, no me mandó ID, yo le genero uno nuevo"
    mapaDatos.remove('id');

    // Opcional: Si quieres que Supabase maneje las fechas automáticamente por defecto,
    // también puedes removerlas del insert inicial.
    mapaDatos.remove('fecha_actualizacion');
    final response = await supabase
        .from('categorias')
        .insert(mapaDatos)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al crear la categoría',
        code: '500',
      );
    }

    return CategoriaModel.fromJson(response);
  }

  @override
  Future<CategoriaModel> actualizar(CategoriaModel model) async {
    final response = await supabase
        .from('categorias')
        .update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al actualizar la categoría',
        code: '500',
      );
    }

    return CategoriaModel.fromJson(response);
  }

  @override
  Future<void> cambiarEstado(String id, bool nuevoEstado) async {
    await supabase
        .from('categorias')
        .update({
          'is_active':
              nuevoEstado, // Asegúrate de calcular el nuevo estado antes de esta línea
          'fecha_actualizacion': DateTime.now().toIso8601String(),
        })
        .eq('id', id);
  }
}
