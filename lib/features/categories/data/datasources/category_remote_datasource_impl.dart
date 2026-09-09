import 'package:fruti_express_jahr_admin/features/categories/data/models/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'category_remote_datasource.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final SupabaseClient supabase;

  static const String _tableName = 'categories';
  static const String _colId = 'id';
  static const String _colName = 'name';
  static const String _colIsActive = 'is_active';
  static const String _colParentId = 'parent_category_id';
  static const String _colUpdatedAt = 'updated_at';

  CategoryRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<CategoryModel>> getAll() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .order(_colName, ascending: true);

    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<CategoryModel>> getActive() async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colIsActive, true)
        .order(_colName, ascending: true);

    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Future<CategoryModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();
    return response != null ? CategoryModel.fromJson(response) : null;
  }

  @override
  Future<CategoryModel?> getByName(String name) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colName, name)
        .maybeSingle();
    return response != null ? CategoryModel.fromJson(response) : null;
  }

  @override
  Future<List<CategoryModel>> getByParent(String? parentId) async {
    final query = supabase.from(_tableName).select();
    final response = parentId == null
        ? await query.isFilter(_colParentId, null)
        : await query.eq(_colParentId, parentId);

    return (response as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }

  @override
  Stream<List<CategoryModel>> watchAll() {
    return supabase
        .from(_tableName)
        .stream(primaryKey: [_colId])
        .order(_colName)
        .map(
          (data) => data.map((json) => CategoryModel.fromJson(json)).toList(),
        );
  }

  @override
  Future<CategoryModel> create(CategoryModel model) async {
    final dataMap = model.toJson();
    dataMap.remove(_colId);
    dataMap.remove(_colUpdatedAt);
    
    final response = await supabase
        .from(_tableName)
        .insert(dataMap)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al crear la categoría',
        code: '500',
      );
    }

    return CategoryModel.fromJson(response);
  }

  @override
  Future<CategoryModel> update(CategoryModel model) async {
    final response = await supabase
        .from(_tableName)
        .update(model.toJson())
        .eq(_colId, model.id)
        .select()
        .maybeSingle();

    if (response == null) {
      throw const PostgrestException(
        message: 'Error al actualizar la categoría',
        code: '500',
      );
    }

    return CategoryModel.fromJson(response);
  }

  @override
  Future<void> changeStatus(String id, bool newState) async {
    await supabase
        .from(_tableName)
        .update({
          _colIsActive: newState,
          _colUpdatedAt: DateTime.now().toIso8601String(),
        })
        .eq(_colId, id);
  }
}