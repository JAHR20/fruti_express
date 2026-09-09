import 'package:fruti_express_jahr_admin/features/users/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final SupabaseClient supabase;
  
  static const String _tableName = 'profiles'; 
  static const String _colId = 'id';
  static const String _colFirstName = 'first_name';
  static const String _colEmail = 'email';
  static const String _colRole = 'role';
  static const String _colBranchId = 'branch_id';
  static const String _colIsActive = 'is_active';

  UserRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<ProfileModel>> getAll() async {
    final response = await supabase.from(_tableName).select().order(_colFirstName);

    return (response as List)
        .map((json) => ProfileModel.fromJson(json))
        .toList();
  }

  @override
  Future<ProfileModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colId, id)
        .maybeSingle();

    return response != null ? ProfileModel.fromJson(response) : null;
  }

  @override
  Future<List<ProfileModel>> searchUsers(String query) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .or('$_colFirstName.ilike.%$query%,$_colEmail.ilike.%$query%')
        .order(_colFirstName);

    return (response as List)
        .map((json) => ProfileModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ProfileModel>> getDeliveryPersons({String? branchId}) async {
    var query = supabase.from(_tableName).select().eq(_colRole, 'deliveryPerson');
    
    if (branchId != null) {
      query = query.eq(_colBranchId, branchId);
    }

    final response = await query.order(_colFirstName);
    return (response as List)
        .map((json) => ProfileModel.fromJson(json))
        .toList();
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel model) async {
    final response = await supabase
        .from(_tableName)
        .update(model.toJson())
        .eq(_colId, model.id)
        .select()
        .single();

    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> changeRole({
    required String id,
    required String role,
  }) async {
    final response = await supabase
        .from(_tableName)
        .update({_colRole: role})
        .eq(_colId, id)
        .select()
        .single();

    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> changeStatus({
    required String id,
    required bool active,
  }) async {
    final response = await supabase
        .from(_tableName)
        .update({_colIsActive: active})
        .eq(_colId, id)
        .select()
        .single();

    return ProfileModel.fromJson(response);
  }

  @override
  Future<int> countByRoleAndStatus({
    required String role,
    required bool active,
  }) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colRole, role)
        .eq(_colIsActive, active)
        .count(CountOption.exact);

    return response.count;
  }

  @override
  Future<bool> managerExistsInBranch(String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select(_colId)
        .eq(_colRole, 'manager')
        .eq(_colBranchId, branchId)
        .maybeSingle();

    return response != null;
  }

  @override
  Future<List<ProfileModel>> getByBranch(String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select()
        .eq(_colBranchId, branchId)
        .eq(_colRole, 'customer');

    return (response as List)
        .map((json) => ProfileModel.fromJson(json))
        .toList();
  }
}