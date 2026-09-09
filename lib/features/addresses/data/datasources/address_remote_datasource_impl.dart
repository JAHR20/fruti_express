import 'package:fruti_express_jahr_admin/features/addresses/data/models/address_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'address_remote_datasource.dart';

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final SupabaseClient supabase;
  
  static const String _tableName = 'addresses';
  static const String _colId = 'id';
  static const String _colUserId = 'user_id';
  static const String _colIsPrimary = 'is_primary';
  
  AddressRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<AddressModel>> getByUser(String userId) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colUserId, userId)
        .order(_colIsPrimary, ascending: false);
        
    return (response as List)
        .map((json) => AddressModel.fromJson(json))
        .toList();
  }

  @override
  Future<AddressModel> create(AddressModel model) async {
    final data = model.toJson(); 
    
    // lo vamos a mejora con un metodo en e model
    data.remove(_colId);
    data.remove('updated_at');
    data.remove('created_at');
    
    final response = await supabase
        .from(_tableName)
        .insert(data)
        .select()
        .single();
        
    return AddressModel.fromJson(response);
  }

  @override
  Future<AddressModel> update(AddressModel model) async {
    final response = await supabase
        .from(_tableName)
        .update(model.toJson())
        .eq(_colId, model.id)
        .select()
        .single();
        
    return AddressModel.fromJson(response);
  }

  @override
  Future<void> delete(String id) async {
    await supabase.from(_tableName).delete().eq(_colId, id);
  }

  @override
  Future<void> setAsMain(String userId, String addressId) async {
    await supabase
        .from(_tableName)
        .update({_colIsPrimary: false})
        .eq(_colUserId, userId);
        
    await supabase
        .from(_tableName)
        .update({_colIsPrimary: true})
        .eq(_colId, addressId);
  }
}