import 'package:flutter/widgets.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/app_user_model.dart';
import 'package:fruti_express_jahr_admin/features/users/data/models/user_profile_model.dart';
import 'package:fruti_express_jahr_admin/features/users/domain/enums/user_role.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'user_remote_datasource.dart';

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final SupabaseClient supabase;

  static const String _tableName = 'app_users';
  static const String _profileTable = 'user_profiles';
  static const String _joinSelect = '*, user_profiles(*)';
  static const String _colId = 'id';
  static const String _searchAppUsers = 'search_app_users';
  static const String _searchQuery = 'search_query';
  static const String _colRole = 'role';
  static const String _colBranchId = 'branch_id';
  static const String _colIsActive = 'is_active';
  static const String _colFirstName = 'first_name';

  UserRemoteDatasourceImpl(this.supabase);

  @override
  Future<List<AppUserModel>> getAll() async {
    final response = await supabase
        .from(_tableName)
        .select(_joinSelect)
        .order(_colFirstName, referencedTable: _profileTable);

    return (response as List)
        .map((json) => AppUserModel.fromJson(json))
        .toList();
  }

  @override
  Future<AppUserModel?> getById(String id) async {
    final response = await supabase
        .from(_tableName)
        .select(_joinSelect)
        .eq(_colId, id)
        .maybeSingle();

    return response != null ? AppUserModel.fromJson(response) : null;
  }

  @override
  Future<List<AppUserModel>> searchUsers(String query) async {
    final response = await supabase.rpc(
      _searchAppUsers,
      params: {_searchQuery: query},
    );

    return (response as List)
        .map(
          (row) => AppUserModel.fromJson(row['result'] as Map<String, dynamic>),
        )
        .toList();
  }

  @override
  Future<List<AppUserModel>> getDeliveryPersons({String? branchId}) async {
    var query = supabase
        .from(_tableName)
        .select(_joinSelect)
        .eq(_colRole, UserRole.deliveryPerson.name);

    if (branchId != null) {
      query = query.eq(_colBranchId, branchId);
    }

    final response = await query.order(
      _colFirstName,
      referencedTable: _profileTable,
    );
    return (response as List)
        .map((json) => AppUserModel.fromJson(json))
        .toList();
  }

  @override
  Future<UserProfileModel> updateProfile(UserProfileModel model) async {
    final response = await supabase
        .from(_profileTable)
        .update(model.toJson())
        .eq(_colId, model.id)
        .select()
        .single();

    return UserProfileModel.fromJson(response);
  }

  @override
  Future<AppUserModel> changeRole({
    required String id,
    required String role,
    String? branchId,
  }) async {
    debugPrint('changeRole -> id=$id role=$role branchId=$branchId');
    final response = await supabase
        .from(_tableName)
        .update({_colRole: role, _colBranchId: branchId})
        .eq(_colId, id)
        .select(_joinSelect)
        .single();

    return AppUserModel.fromJson(response);
  }

  @override
  Future<AppUserModel> changeStatus({
    required String id,
    required bool active,
  }) async {
    final response = await supabase
        .from(_tableName)
        .update({_colIsActive: active})
        .eq(_colId, id)
        .select(_joinSelect)
        .single();

    return AppUserModel.fromJson(response);
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
        .eq(_colRole, UserRole.manager.name)
        .eq(_colBranchId, branchId)
        .maybeSingle();

    return response != null;
  }

  @override
  Future<List<AppUserModel>> getByBranch(String branchId) async {
    final response = await supabase
        .from(_tableName)
        .select(_joinSelect)
        .eq(_colBranchId, branchId)
        .eq(_colRole, UserRole.customer.name);

    return (response as List)
        .map((json) => AppUserModel.fromJson(json))
        .toList();
  }
}
